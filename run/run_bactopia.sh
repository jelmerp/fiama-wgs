#!/bin/bash

# Input files and dirs, and settings
fqdir=/fs/ess/PAS1548/FGG_Hydroponics_Survey/Bacteria_isolates/WGS_isolates_analysis/raw_data
bakta_db=/fs/ess/PAS0471/jelmer/refdata/bakta/db
bactools_script="$PWD"/mcic-scripts/bact/bactopia3_tools.sh
species_full="UNKNOWN_SPECIES"

# Output dirs and files
bacdir="$PWD"/results/bactopia
asm_dir=results/bactopia/asm_files && mkdir -p "$asm_dir" # Single dir with all fna, faa, and gff files

# ==============================================================================
#                               BACTOPIA MAIN
# ==============================================================================
# Run Bactopia - includes read QC & cleaning (fastp), assembly (Spades), annotation (Bakta), AMRFinder+, Sourmash-Classify, MLST
sbatch mcic-scripts/bact/bactopia3.sh -i "$fqdir" -o results/bactopia \
    --species "$species_full" --bakta_db "$bakta_db"
# Check assembly summaries:
column -t results/bactopia/bactopia-runs/bactopia-20231216-132134/merged-results/assembly-scan.tsv | less -S
# Check MLST results:
find results/bactopia -wholename "*mlst/*tsv" -exec cat {} \; | awk '$2 != "-"' | cut -f1,2
# Check Sourmash GTDB results: (Note: The 'mash-refseq88-k21.txt' files are empty!)
find results/bactopia -wholename "*/sketcher/*sourmash-gtdb*txt" -exec tail -n+2 {} \;

# Copy FNA/FAA/GFF files to a single dir
find "$PWD"/results/bactopia -wholename "*assembler*fna.gz" -exec cp -v {} "$asm_dir" \;
find "$PWD"/results/bactopia -wholename "*faa.gz" -not -name "*hypothet*" -exec cp -v {} "$asm_dir" \;
find "$PWD"/results/bactopia -name "*gff3.gz" -exec cp -v {} "$asm_dir" \;
gunzip -v "$asm_dir"/*gz

# ==============================================================================
#                               BACTOPIA TOOLS
# ==============================================================================
# Create list of 5 samples to include for small test-runs for some of the tools 
ls -d results/bactopia/FG11* | xargs -n 1 basename > small_include.txt # 5 samples
small_include=$(realpath small_include.txt)

# Mashtree
(tool=mashtree && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch "$bactools_script" -i "$bacdir" -o "$bacdir" --tool "$tool")
tree=results/bactopia/bactopia-runs/mashtree-20231217-193349/mashtree/mashtree.dnd
module load miniconda3 && source activate /fs/ess/PAS0471/jelmer/conda/r_tree
Rscript mcic-scripts/trees/ggtree.R -i "$tree" --align_lwd 0.5
#results/bactopia/bactopia-runs/mashtree-20231217-193349/mashtree/mashtree.png

# EggNOG #TODO - redo with --download_eggnog, other database may be a bit old
eggnog_db=/fs/ess/PAS0471/jelmer/refdata/eggnog
(tool=eggnog && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch "$bactools_script" -i "$bacdir" -o "$bacdir" \
        --tool "$tool" --more_opts "--eggnog_db $eggnog_db" --include "$small_include")

# GTDB-TK #! FAILS #Try this with an own script (https://github.com/bactopia/bactopia/blob/master/subworkflows/local/gtdb/main.nf)
gtdb=/fs/ess/PAS0471/jelmer/refdata/gtdb/release214
(tool=gtdb && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch "$bactools_script" -i "$bacdir" -o "$bacdir" \
    --tool "$tool" --more_opts "--gtdb $gtdb" --include "$small_include")

# Busco (merged results table is in "bactopia-runs/busco-<date>-<time>/merged-results/busco.tsv")
(tool=busco && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch "$bactools_script" -i "$bacdir" -o "$bacdir" --tool "$tool")
column -ts $'\t' results/bactopia/bactopia-runs/busco-20231217-132607/merged-results/busco.tsv | less -S

# CheckM (merged results table is in "bactopia-runs/checkm-<date>-<time>/merged-results/checkm.tsv")
(tool=checkm && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch "$bactools_script" -i "$bacdir" -o "$bacdir" --tool "$tool")
column -ts $'\t' results/bactopia/bactopia-runs/checkm-20231217-132420/merged-results/checkm.tsv | less -S
#! Most around 1% contam, some up to 4% but two much higher:
#> Bin Id  Marker lineage                    # genomes  # markers  # marker sets  0  1    2   3  4  5+  Completeness  Contamination  Strain heterogeneity
#> FG42Y   k__Bacteria (UID203)              5449       104        58             0  20   83  1  0  0   100.00        74.50          0.00
#> FG56    k__Bacteria (UID203)              5449       104        58             0  52   50  2  0  0   100.00        50.24          0.00

# Move SLURM logs from Bactoptia tools
find bacsub -name "slurm*out" -exec mv -v {} results/bactopia/logs/ \;

# Run MultiQC on Bactopia output
sbatch -t 300 mcic-scripts/misc/multiqc.sh -i results/bactopia -o results/multiqc


# ==============================================================================
#                         ISSUES WITH BACTOPIA
# ==============================================================================
# - WARN: Maximum memory (128) was adjusted to fit your system (40)
#   WARN: Maximum CPUs (48) was adjusted to fit your system (10)

# - When using --bakta_download + --bakta_db, expecting to download to --bakta_db
#   As per https://bactopia.github.io/latest/full-guide/#bakta-download
#   Instead, "ERROR ~ * --bakta_db: Unable to find "/fs/ess/PAS0471/jelmer/assist/2023-12_fiama/results/bactopia/data/bakta_db/bakta.db", please verify it exists.""

# Run Bactopia tools - Snippy + Gubbins (main results are in "bactopia-runs/snippy-<date>-<time>")
snippy_ref_id=FG100
snippy_ref_gbff="$bacdir"/"$snippy_ref_id"/main/annotator/bakta/"$snippy_ref_id".gbff.gz
(tool=snippy && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch -t 6:00:00 "$bactools_script" -i "$bacdir" -o "$bacdir" \
    --tool "$tool" --more_opts "--reference $snippy_ref_gbff")
#! Gubbins error: RuntimeError: cannot cache function 'seq_to_int': no locator available for file '/usr/local/lib/python3.10/site-packages/gubbins/pyjar.py'

# Pangenome (= Panaroo => ClonalFrameML => IQ-Tree) (Note: uses PIRATE instead of Panaroo by default)
(tool=pangenome && mkdir -p bacsub/"$tool" && cd bacsub/"$tool" && \
    sbatch "$bactools_script" -i "$bacdir" -o "$bacdir" \
    --tool "$tool" --more_opts "--use_panaroo")
#! Not working - 75 samples were excluded due to missing files. They are:
