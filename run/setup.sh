#!/bin/bash

# Get some example genomes from another project
mkdir -p data/testgenomes data/testfastq

shonna_asm_dir=/fs/ess/PAS0471/jelmer/assist/2023-07_shonna/results/bactopia/asm_links
cp -v "$shonna_asm_dir"/S006*fna data/testgenomes # Listeria
cp -v "$shonna_asm_dir"/S0499*fna data/testgenomes # Enterococcus

shonna_fq_dir=/fs/ess/PAS0471/jelmer/assist/2023-07_shonna/data/fastq
cp -v "$shonna_fq_dir"/S006*gz data/testfastq