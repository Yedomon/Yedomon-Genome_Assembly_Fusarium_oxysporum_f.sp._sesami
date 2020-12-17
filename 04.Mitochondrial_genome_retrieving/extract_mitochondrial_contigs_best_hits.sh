#!/bin/bash

set -e

genome4xpolished=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/04.Mitochondrial_genome_retrieving/MR4003_pilon_4.fasta

polishing_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/03.Assembly_polishing"

cd $polishing_path

#Index regions from the fasta file

samtools faidx MR4003_pilon_4.fasta

#Define a string variable with the contigs ids

contigs_id="tig00000260_pilon_pilon_pilon_pilon tig00000424_pilon_pilon_pilon_pilon tig00000937_pilon_pilon_pilon_pilon tig00001031_pilon_pilon_pilon_pilon"

# Extraction operation

for id in $contigs_id
    do
       samtools faidx $genome4xpolished $id > $id.mito.fasta
    done

echo "Job is completed"
