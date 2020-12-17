#!/bin/bash

set -e

echo "Contiguity evaluation..."


cd  05.Assembly_quality_metrics


# In addition to our assembly, we downloaded reference genome Fusarium oxysporum f.sp. sesami genome assembly from NCBI (ASM14995v2)

wget https://ftp.ncbi.nlm.nih.gov/genomes/refseq/fungi/Fusarium_oxysporum/latest_assembly_versions/GCF_000149955.1_ASM14995v2/GCF_000149955.1_ASM14995v2_genomic.fna.gz

gunzip GCF_000149955.1_ASM14995v2_genomic.fna.gz

mv GCF_000149955.1_ASM14995v2_genomic.fna.gz FOL4287.fasta 


# Assembly stats of both assemblies
assembly-stats *.fasta > contiguity/assembly.metrics.txt

# Assembly stats using quast tool with the default minimum length = 500 bp
python quast.py \
	   *.fasta \
	   -o contiguity/quast_res_fos_fol 
