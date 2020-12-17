#!/bin/bash

set -e

export PATH='/NABIC/HOME/yedomon1/canu-1.8/Linux-amd64/bin/':$PATH


raw_pacbio_data=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/02_Assembly_with_Canu/20191211.MR4003.cell1.subreads.fastq

output_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/02_Assembly_with_Canu/"

prefix='MR4003'
genomeSize=74.5m
threads=160
memory=1000

echo $raw_pacbio_data
echo $output_path

canu \
    -p $prefix \
    -d $output_path \
     useGrid=false \
     genomesize=$genomeSize \
    -pacbio-raw $raw_pacbio_data \
     maxThreads=$threads \
     maxMemory=$memory
