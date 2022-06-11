#!usr/bin/bash 

#Commands for DNA sequence count
wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa
grep -v "^>" DNA.fa | wc -c

#Commands for conda set-up
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sha256sum Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

#Installing softwares Fastqc, fastp and multiqc
sudo apt-get install fastqc
sudo apt-get install fastp
sudo apt-get install multiqc

#Downloading datasets
mkdir RAWREADS && cd RAWREADS
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R1.fastq.gz?raw=true -O ACBarrie_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/ACBarrie_R2.fastq.gz?raw=true -O ACBarrie_R2.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R1.fastq.gz?raw=true -O Alsen_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R2.fastq.gz?raw=true -O Alsen_R2.fastq.gz

#creating ouput folder
mkdir output

#Implementing fastqc
fastqc ACBarrie_R1.fastq.gz -o output/
fastqc ACBarrie_R2.fastq.gz -o output/
fastqc Alsen_R1.fastq.gz -o output/
fastqc Alsen_R2.fastq.gz -o output/

#Trimming adapter sequences using fastp
wget https://github.com/Omotoyosi-S/Hackbio-Tasks/blob/main/trim.sh
bash trim.sh
ls
mv qc_reads/ trimmedreads
cd trimmedreads/
ls
cd ..

#Merging quality control reads using multiqc
multiqc output/
ls
history
