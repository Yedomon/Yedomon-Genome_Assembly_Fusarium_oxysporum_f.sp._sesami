#!/bin/bash

set -e

trimmed_reads_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/01_Genome_size_estimation/trimmed_reads"

genome=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/02.Canu_assembly/MR4003.contigs.fasta

polishing_path="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/03.Assembly_polishing"

pilon_path="/NABIC/HOME/yedomon1/miniconda3/share/pilon-1.23-2"


cd $polishing_path

bwa index $genome

mkdir -p sam bam 

for fq_trim1 in $trimmed_reads_path/*_1.trim.fastq.gz

    do
         echo "working with file $fq_trim1"  

                 base=$(basename $fq_trim1 _1.trim.fastq.gz)

         echo "base name is $base"

                fq_trim1=$trimmed_reads_path/${base}_1.trim.fastq.gz
                fq_trim2=$trimmed_reads_path/${base}_2.trim.fastq.gz
                sam=$polishing_path/sam/${base}.round1.aligned.sam 
                bam=$polishing_path/bam/${base}.round1.aligned.bam
                sorted_bam=$polishing_path/bam/${base}.round1.aligned.sorted.bam
           
                
                 # Indexed bam creation step

                 bwa mem $genome $fq_trim1 $fq_trim2 > $sam 
                 samtools view -S -b $sam > $bam 
                 samtools sort $bam ${base}.round1.aligned.sorted
                 samtools index $sorted_bam   

         
                 # Polishing step

                 java -Xmx16G -jar \
                       $pilon_path/pilon-1.23.jar \
                       --genome $genome --frags $sorted_bam --output MR4003_pilon_1 \
                       --fix all --mindepth 0.5 --changes --verbose --threads 4


    done

