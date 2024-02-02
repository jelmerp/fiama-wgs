#!/bin/bash

# SETUP: make sure you have the most recent version of mcic-scripts
# Either run 'git pull' inside an existing mcic-script dirs,
# or download a new copy with 'git clone https://github.com/mcic-osu/mcic-scripts.git'

# Dirs and files
#asm_dir=data/testgenomes  # Dir with genome assemblies (change as needed)
asm_dir=/fs/ess/PAS1548/FGG_Hydroponics_Survey/Bacteria_isolates/WGS_isolates_analysis/Assembly/All_isolates/

# Sourmash classify (Classify assembly to lowest taxonomic level possible)
for asm in "$asm_dir"/FG2*fasta; do
    sbatch mcic-scripts/meta/sourmash_classify.sh -i "$asm" -o results/sourmash_classify
done

# Kraken
kraken_db=/fs/ess/PAS0471/jelmer/refdata/kraken/std
for asm in "$asm_dir"/FG2*fasta; do
    sbatch mcic-scripts/meta/kraken.sh -i "$asm" -o results/kraken --db "$kraken_db"
done

# Sourmash search (Find the most similar genome in a custom database)
# Step 1: Download a set of genomes -- here, all Listeria cossartiae genomes
sbatch mcic-scripts/download/dl-genomes.sh -o results/refgenomes --taxon "Chromobacterium" --include "genome"
# Step 2: Make sourmash database for downloaded genomes
sourmash_db=results/sourmash_search/chrombacterium_db
sbatch mcic-scripts/meta/sourmash_db.sh -i results/refgenomes -o "$sourmash_db"
# Step 3: Run sourmash search
for asm in "$asm_dir"/FG22*fasta; do
    sbatch mcic-scripts/meta/sourmash_search.sh -i "$asm" --db_dir "$sourmash_db" -o results/sourmash_search
done
