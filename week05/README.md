# Assignments for Week 05
## Group 1: Ebola paper
## Continue from last week:
### Review the scientific publication you studied previously.
the paper: https://www.science.org/doi/full/10.1126/science.1259657
### Identify the BioProject and SRR accession numbers for the sequencing data associated with the publication.
Sequence data are available at NCBI (NCBI BioGroup: PRJNA257197)
Search PRJNA257197: https://www.ncbi.nlm.nih.gov/sra/?term=PRJNA257197, we can get 891 SRA experiments.
## Write a Bash script:
### Reuse and expand your code from last week.
### Create a bash shell script with the code from last week.
### Add commands to download at least one sequencing dataset using the SRR number(s).
### Download only a subset of the data that would provide approximately 10x genome coverage. Briefly explain how you estimated the amount of data needed for 10x coverage.

refer to week05.sh

## Quality assessment:

### Generate basic statistics on the downloaded reads (e.g., number of reads, total bases, average read length).
```
seqkit stats *.fastq
```
file                format  type  num_seqs  sum_len  min_len  avg_len  max_len
SRR1972976_1.fastq  FASTQ   DNA        938   94,738      101      101      101
SRR1972976_2.fastq  FASTQ   DNA        938   94,738      101      101      101

Genome of Zaire ebolavirus: 18959
Coverage: (94738+94738) / 18959 = 9.99X
So we got approximately 10x genome coverage.
### Run FASTQC on the downloaded data to generate a quality report.
```
fastqc *.fastq
```
### Evaluate the FASTQC report and summarize your findings.
The first 50 bp of the subset reads have a reliable quality score. The second 50 bp are of poor quality with Q score less than Q20. 
### Perform any necessary quality control steps (e.g., trimming, filtering) and briefly describe your process.
```
fastp --cut_tail -i SRR1972976_1.fastq -I SRR1972976_2.fastq -o SRR1972976_1.trim.fq -O SRR1972976_2.trim.fq
```
Read1 before filtering:
total reads: 938
total bases: 94738
Q20 bases: 74295(78.4215%)
Q30 bases: 67730(71.4919%)

Read2 before filtering:
total reads: 938
total bases: 94738
Q20 bases: 54617(57.6506%)
Q30 bases: 47907(50.5679%)

Read1 after filtering:
total reads: 722
total bases: 58079
Q20 bases: 56505(97.2899%)
Q30 bases: 51418(88.5311%)

Read2 after filtering:
total reads: 722
total bases: 53007
Q20 bases: 50844(95.9194%)
Q30 bases: 44760(84.4417%)

## Compare sequencing platforms:
### Search the SRA for another dataset for the same genome, but generated using a different sequencing platform (e.g., if original data was Illumina select PacBio or Oxford Nanopore).
For the SRA accession number SRR1972976, there is only illumina data. So I searched for other data using the keyword "Zaire ebolavirus" and found this Oxford Nanopore data: ERR1248115.
After downloading a subset of the data(same reads number as illumina data), I ran seqkit and found the average read length is 581.2, which means I downloaded a much larger subsets. To keep the coverage same as previous data, I deleted this data and redownloaded with a smaller read number by calculating: 18959 * 10 / 581.2 = 326
```
fastq-dump -X 326 -F --outdir subset_reads --split-files ERR1248115
```
### Briefly compare the quality or characteristics of the datasets from the two platforms.
```
fastqc ERR1248115_1.fastq
```
Nanopore data showed a much lower quality, as all positions having a Q-score below 20. However the read length is much longer.