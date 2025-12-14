# Assignments for Week 02

## 1. Tell us a bit about the organism.
Caenorhabditis elegans (commonly known as C. elegans) is a free-living, transparent nematode worm widely used as a model organism in biological research. It measures about 1 millimeter in length and feeds on bacteria in soil environments.
## 2. How many sequence regions (chromosomes) does the file contain? Does that match with the expectation for this organism?

```
wget https://ftp.ensembl.org/pub/current_gff3/caenorhabditis_elegans/Caenorhabditis_elegans.WBcel235.115.gff3.gz

gunzip Caenorhabditis_elegans.WBcel235.115.gff3.gz

cat Caenorhabditis_elegans.WBcel235.115.gff3 | grep 'sequence-region' | wc -l
```
7


 Yes. It matches the expectation, the organism has 6 nuclear chromosomes (I, II, III, IV, V, and X) plus mitochondrial DNA (MtDNA), totaling 7 sequence regions.
## 3. How many features does the file contain?
```
cat Caenorhabditis_elegans.WBcel235.115.gff3 | grep -v '#' > elegans.gff3
cat elegans.gff3 | wc -l
```
639601

## 4. How many genes are listed for this organism?
```
cat elegans.gff3 | cut -f 3 | sort-uniq-count-rank | grep -w 'gene'
```
19985	gene

## 5. Is there a feature type that you may have not heard about before? What is the feature and how is it defined? (If there is no such feature, pick a common feature.)

I have not heard about piRNA. 
piRNA stands for PIWI-interacting RNA. It is a class of small non-coding RNA molecules (typically 24-31 nucleotides long) that primarily function in germline cells. They interact with PIWI family Argonaute proteins to mediate RNA interference (RNAi) pathways, particularly for silencing transposons (jumping genes) and maintaining genomic stability.

## 6. What are the top-ten most annotated feature types (column 3) across the genome?
```
cat elegans.gff3 | cut -f 3 | sort-uniq-count-rank | head -n 10
```
263117	exon
215849	CDS
31865	mRNA
27371	five_prime_UTR
26331	three_prime_UTR
24813	ncRNA_gene
19985	gene
15363	piRNA
8440	ncRNA
2165	pseudogenic_transcript

## 7. Having analyzed this GFF file, does it seem like a complete and well-annotated organism?
Yes. It contains the expected sequence regions with large numbers of features. I think that's because C.elegans is a widely used model species in biology.

## 8. Share any other insights you might note.
I think it's a good idea to start with something small and simple when learning new skills.