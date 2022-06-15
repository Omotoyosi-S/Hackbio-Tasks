#!usr/bin/bash

#Commands for downloading data from zenodo 
mkdir raw_data && cd raw_data
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r1_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r2_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r1_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r2_chr5_12_17.fastq.gz	

#Downloading reference sequence
wget https://zenodo.org/record/2582555/files/hg19.chr5_12_17.fa.gz

#Bioconda, Fastqc and multiqc installation
conda install -c bioconda fastqc multiqc --yes

#Creating fastqc report directory
mkdir -p Fastqc_Reports

#Performing quality control on reads using fastqc
