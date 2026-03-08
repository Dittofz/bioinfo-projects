# Set the error handling and trace
set -uex
# Download the genome data for the given accession
ACCESSION="GCF_000848505.1"
# SRA_ACCESSION
SRA_ACCESSION="SRR1972976"


# - ALL DEFINTIONS ARE ABOVE - ALL ACTIONS ARE BELOW -
# Download the genome data for the given accession if it does not already exist
if [ ! -f ${ACCESSION}.zip ]; then
    datasets download genome accession $ACCESSION --include gff3
    # rename the downloaded zip file to the given accession name
    mv ncbi_dataset.zip ${ACCESSION}.zip
fi

# Unzip the downloaded file
unzip -n ${ACCESSION}.zip

# open the data directory for the given accession
cd ncbi_dataset/data/${ACCESSION}/
# determine the genome size from the gff file
GENOME_SIZE=$(awk '$3 == "region" {print $5}' *.gff | head -n 1)
echo "Genome size: ${GENOME_SIZE}"
# based on the genome size, download a subset of the SRA data for the given accession that is approximately 10x coverage
# calculate the number of bases needed for 10x coverage
BASES_NEEDED=$((GENOME_SIZE * 10))
echo "Bases needed for 10x coverage: ${BASES_NEEDED}"
# given that the data was sequenced using Illumina HiSeq 2500, we can assume that the read length is 150 bp and the data is paired-end, so we need to download enough reads to get 10x coverage
# After downloading the data, we found the read length is atcually 101 bp, so we will use 101 bp as the read length for our calculations
READS_NEEDED=$((BASES_NEEDED / 101 / 2))
echo "Reads needed for 10x coverage: ${READS_NEEDED}"
# make a directory for the SRA data
mkdir -p subset_reads
# download the SRA data for the given accession using fastq-dump, specifying the number of reads to download
fastq-dump -X ${READS_NEEDED} -F --outdir subset_reads --split-files ${SRA_ACCESSION}


