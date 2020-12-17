# Tools used:

* blastn v2.2.30


## Running

### Step 01: Download the nt database from ncbi

```
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nt.gz && gunzip nt.gz

```


### Step 02: Index the database 

```

makeblastdb -in nt.fa -dbtype nucl

```

### Step 03: Blast run


```
blastn -query Fusarium_oxysporum_fsp_sesami.fasta -db nt.fa -out contamination.results.txt -outfmt 6 

```
