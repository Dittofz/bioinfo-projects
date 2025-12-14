# Assignments for Week 02

## 1. Tell us a bit about the organism.
Caenorhabditis elegans (commonly known as C. elegans) is a free-living, transparent nematode worm widely used as a model organism in biological research. It measures about 1 millimeter in length and feeds on bacteria in soil environments.
## 2. How many sequence regions (chromosomes) does the file contain? Does that match with the expectation for this organism?

```
wget https://ftp.ensembl.org/pub/current_gff3/caenorhabditis_elegans/Caenorhabditis_elegans.WBcel235.115.gff3.gz

gunzip Caenorhabditis_elegans.WBcel235.115.gff3.gz

cat Caenorhabditis_elegans.WBcel235.115.gff3 | grep 'sequence-region' | wc -l

7

```
 Yes. It matches the expectation, the organism has 6 nuclear chromosomes (I, II, III, IV, V, and X) plus mitochondrial DNA (MtDNA), totaling 7 sequence regions.
## 3. How many features does the file contain?
```
cat Caenorhabditis_elegans.WBcel235.115.gff3 | grep -v '#' > elegans.gff3
cat elegans.gff3 | wc -l
639601

```

## 4. How many genes are listed for this organism?
```
cat elegans.gff3 | cut -f 3 | sort-uniq-count-rank | grep -w 'gene'
19985	gene
```