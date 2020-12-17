#!/bin/bash

set -e


export PATH='/NABIC/HOME/yedomon1/mummer-3.9.4alpha':$PATH

#--Go to working directory

cd /NABIC/HOME/yedomon1/genomeassemblyfungiMR004/07.homologous_contigs_detection

#---Alignment

for seq in tig*.fasta

do

base=$(basename $seq .fasta)

#---nucmer

nucmer --maxmatch $seq unanchored.fasta --prefix=${base}.nucmer

#get alignment results

show-coords -rcl ${base}.nucmer.delta > ${base}.nucmer.coords

#---dot-plot
mummerplot --layout --png --large ${base}.nucmer.delta -p ${base}.mummer.plot

done

