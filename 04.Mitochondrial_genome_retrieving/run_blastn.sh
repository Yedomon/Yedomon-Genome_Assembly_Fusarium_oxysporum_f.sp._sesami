#!/bin/bash

set -e

mito_retrieve_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/04.Mitochondrial_genome_retrieving/"

genome4xpolished=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/04.Mitochondrial_genome_retrieving/MR4003_pilon_4.fasta

refseq_mito=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/04.Mitochondrial_genome_retrieving/refseq.mitochondrion.fasta

cd $mito_retrieve_path

echo $refseq_mito

echo $genome4xpolished

blastn -subject $refseq_mito -query $genome4xpolished -output mito_blast -outfmt 6  

