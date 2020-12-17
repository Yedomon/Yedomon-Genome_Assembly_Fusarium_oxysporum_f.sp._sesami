## Tools

* blastn v2.2.30
* seqtk v1.3
* Samtools v0.1.19
* RNAweasel web interface

## Running

### Step 01: Download refseq mitochondrial genomes from ncbi


[`bash download_refseq_mitochondrion_sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/04.Mitochondrial_genome_retrieving/download_refseq_mitochondrion_sh)




### Step 02: Nucleotide blastn running 


[`bash run_blastn.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/04.Mitochondrial_genome_retrieving/run_blastn.sh)



### Step 03: Identification of mitochodrial RNA signatures on contigs that showed mitochondrial hits from blastn results

After parsing the blast results, we identified four putative contigs with mitochondrial hits. We extracted those contigs using the following customed script:



[`bash extract_mito_contigs.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/04.Mitochondrial_genome_retrieving/extract_mitochondrial_contigs_best_hits.sh)



### Step 04: Search of mitochondrial RNA signature in each contigs using [RNAweasel](https://megasun.bch.umontreal.ca/cgi-bin/RNAweasel/RNAweaselInterface.pl) with yeast mitochondrion genetic code option.

### Step 05: Exclude the mitochondrial sequence from the assembly file

```
seqtk subseq MR4003_pilon_4.fasta keep.list > MR4003_pilon_4_mito_free.fasta

```

`keep.list` contains the nuclear sequences list with one name per line.



## References


* Altschul SF, Gish W, Miller W, Myers EW, Lipman DJ (1990) Basic local alignment search tool. Journal of Molecular Biology 215(3):403-410. [DOI](https://doi.org/10.1016/s0022-2836(05)80360-2)

* Li H, Handsaker B, Wysoker A, Fennell T, Ruan J, Homer N, Marth G, Abecasis G, Durbin R, 1000 Genome Project Data Processing Subgroup (2009) The Sequence Alignment/Map format and SAMtools. Bioinformatics 25(16):2078–2079. [DOI](https://doi.org/10.1093/bioinformatics/btp352)

* seqtk: A fast and lightweight tool for processing sequences in the FASTA or FASTQ format. [Github page](https://github.com/lh3/seqtk)

* RNAweasel: A web tool for automated annotation of mitochondrial and plastid genomes. [Link](https://megasun.bch.umontreal.ca/cgi-bin/RNAweasel/RNAweaselInterface.pl)





