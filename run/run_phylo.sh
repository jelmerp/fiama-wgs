#!/bin/bash

# Pangenome (Roary/Panaroo) => ClonalFrameML => IQ-Tree, with NCBI ref genomes

# Input dirs and files
asm_dir=results/bactopia/asm_files
#asm_dir=/fs/ess/PAS1548/FGG_Hydroponics_Survey/Bacteria_isolates/WGS_isolates_analysis/Assembly/All_isolates

# Output dirs, files, and settings
outdir=results/phylo
setid="all"
panaroo_aln="$outdir"/panaroo/"$setid"/core_gene_alignment_filtered.aln
masked_aln="$outdir"/clonalframe/"$setid"/core_gene_alignment_filtered.masked.aln
tree="$outdir"/iqtree/"$setid"/core_gene_alignment_filtered.masked.treefile

# Pangenome with Panaroo #! Failed with all genomes, not sure if due to large divergence
sbatch -t 16:00:00 mcic-scripts/bact/panaroo.sh -i "$asm_dir" -o "$outdir"/panaroo/"$setid"2
# Remove recombination (HGT) with ClonalFrameML
sbatch mcic-scripts/bact/clonalframeml.sh -i "$panaroo_aln" -o "$outdir"/clonalframe/"$setid"
# Build a tree with IQ-tree and plot it
sbatch mcic-scripts/trees/iqtree.sh -i "$masked_aln" -o "$outdir"/iqtree/"$setid" --fast
module load miniconda3 && source activate /fs/ess/PAS0471/jelmer/conda/r_tree
Rscript mcic-scripts/trees/ggtree.R -i "$tree"
