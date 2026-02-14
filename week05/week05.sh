# Set the error handling and trace
set -uex
# Download the genome data for the given accession
ACCESSION=GCF_000848505.1

# - ALL DEFINTIONS ARE ABOVE - ALL ACTIONS ARE BELOW -

datasets download genome accession $ACCESSION --include genome,gff3,gtf

unzip -n ncbi_dataset.zip