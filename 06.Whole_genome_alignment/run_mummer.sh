#!/bin/bash

set -e

export PATH='/NABIC/HOME/yedomon1/mummer-3.9.4alpha':$PATH

#Variables declarations

fol=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/05.Assembly_quality_metrics/FOL4287.fasta
fos=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/05.Assembly_quality_metrics/MR4003_pilon_4_mito_free.fasta
bfol=$(basename $fol .fasta)
bfos=$(basename $fos .fasta)
out="${bfos}_${bfol}"


#Find maximal exact matches
nucmer --maxmatch ${fol} ${fos} --prefix=${out}.nucmer 

#Filter out repetitive query alignments
delta-filter ${out}.nucmer.delta >  ${out}.nucmer.filter.delta

#get alignment results
show-coords -rcl ${out}.nucmer.filter.delta > ${out}.nucmer.filter.delta.coords

#plot
mummerplot  --png --large ${out}.nucmer.filter.delta -p ${out}.mummer.plot
