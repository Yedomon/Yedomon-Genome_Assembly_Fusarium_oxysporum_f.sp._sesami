## Tools

* BWA v0.7.9
* BUSCO v4.0.1
* Qualimap v2.2.2
* QUAST v5.0.2
* Samtools v0.1.19

## Running

* ### Contiguity


[`bash run_contiguity.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/05.Assembly_quality_metrics/run_contiguity.sh)



* ### Completeness

[`bash run_completeness.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/05.Assembly_quality_metrics/run_completeness.sh)



* ### Correcteness


[`bash correctness.sh`](https://github.com/Yedomon/Genome_Assembly_Fusarium_oxysporum_f.sp._sesami/blob/master/05.Assembly_quality_metrics/run_correctness.sh)




### Telomeric-repeats investigation


`python` [`FindTelomeres.py`](https://github.com/JanaSperschneider/FindTelomeres) `MR4003_pilon_4_mito_free.fasta > telomeres.results.txt`






### References

* FindTelomeres.py: A python script for identification of canonical telomeres. [Github page](https://github.com/JanaSperschneider/FindTelomeres)

* Gurevich A, Saveliev V, Vyahhi N, Tesler G (2013) QUAST: quality assessment tool for genome assemblies. Bioinformatics 29(8)1072–1075.[DOI](https://doi.org/10.1093/bioinformatics/btt086)
* Li H, Durbin R (2009) Fast and accurate short read alignment with Burrows–Wheeler transform. Bioinformatics 25(14):1754–1760. [DOI](https://doi.org/10.1093/bioinformatics/btp324)
* Li H, Handsaker B, Wysoker A, Fennell T, Ruan J, Homer N, Marth G, Abecasis G, Durbin R, 1000 Genome Project Data Processing Subgroup (2009) The Sequence Alignment/Map format and SAMtools. Bioinformatics 25(16):2078–2079. [DOI](https://doi.org/10.1093/bioinformatics/btp352)
* Okonechnikov K, Conesa A, García-Alcalde F (2016) Qualimap 2: advanced multi-sample quality control for high-throughput sequencing data. Bioinformatics 32(2):292–294.[DOI](https://doi.org/10.1093/bioinformatics/btv566)						 
* Simão FA, Waterhouse RM, Ioannidis P, Kriventseva EV, Zdobnov EM (2015) BUSCO: assessing genome assembly and annotation completeness with single-copy orthologs. Bioinformatics 31(19):3210–3212. [DOI](https://doi.org/10.1093/bioinformatics/btv351)
