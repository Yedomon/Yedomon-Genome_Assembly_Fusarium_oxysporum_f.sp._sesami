#!/bin/bash

set -e


genome=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/05.Assembly_quality_metrics/MR4003_pilon_4_mito_free.fasta

working_dir="/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/05.Assembly_quality_metrics"

long_reads=/NABIC/HOME/yedomon1/genomeassemblyfungiMR004/05.Assembly_quality_metrics/20191211.MR4003.cell1.subreads.fastq


for fq_trim1 in $working_dir/*_trim1.fastq
    
    do
        echo "working with file $fq_trim1"  
        
		base=$(basename $fq_trim1 _trim1.fastq)
        
		echo "base name is $base"
        
        #Trimmed short-reads declaration
	    fq_trim1=$working_dir/${base}_trim1.fastq
	    fq_trim2=$working_dir/${base}_trim2.fastq
	   
        #short-reads mapping variables declaration
	    sr_sam=$working_dir/${base}.sr.aligned.sam 
	    sr_bam=$working_dir/${base}.sr.aligned.bam
	    sr_sorted_bam=$working_dir/${base}.sr.aligned.sorted.bam
        
        #long-reads mapping variables declaration
	    lr_sam=$working_dir/${base}.lr.aligned.sam
	    lr_bam=$working_dir/${base}.lr.aligned.bam
	    lr_sorted_bam=$working_dir/${base}.lr.aligned.sorted.bam
       
		
	    echo "Short-reads mapping and mapping quality evaluation with qualimap tool ..."


        #Index file creation
        bwa index $genome

        #Mapping short reads
        bwa mem -t 16 $genome $fq_trim1 $fq_trim2 > $sr_sam
        samtools view -S -b $sr_sam > $sr_bam 
        samtools sort $sr_bam ${base}.sr.aligned.sorted
        samtools index $sr_sorted_bam   

        # Activate qualimap environment
        source activate qualimap_env

        #Qualimap running
        qualimap bamqc -bam $sr_sorted_bam -outfile MR4003_qualimap_map_short.pdf

        #Desactivate qualimap environment
        source deactivate qualimap_env


        echo "Long-reads mapping and mapping quality evaluation with qualimap tool ..."

        #Mapping long-reads
        bwa mem -x pacbio -t 16 $genome $long_reads > $lr_sam
        samtools view -S -b $lr_sam > $lr_bam
        samtools sort $lr_bam ${base}.lr.aligned.sorted
        samtools index $lr_sorted_bam   


        # Activate qualimap environm
        source activate qualimap_env


        # Qualimap running
        qualimap bamqc -bam $lr_sorted_bam -outfile MR4003_qualimap_map_long.pdf


        #Desactivate qualimap environment
        source deactivate qualimap_env
  done

echo "Job is completed!"
