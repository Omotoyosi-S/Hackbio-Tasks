#!usr/bin/bash

#Commands for downloading data from zenodo 
mkdir raw_data && cd raw_data
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r1_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-N_231335_r2_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r1_chr5_12_17.fastq.gz
wget https://zenodo.org/record/2582555/files/SLGFSK-T_231336_r2_chr5_12_17.fastq.gz	

#Downloading reference sequence
wget https://zenodo.org/record/2582555/files/hg19.chr5_12_17.fa.gz

#Unzipping reference sequence 
gunzip hg19.chr5_12_17.fa.gz

#Bioconda, Fastqc and multiqc installation
conda install -c bioconda fastqc multiqc --yes

#Creating fastqc report directory
mkdir -p Fastqc_Reports

#Performing quality control on reads using fastqc
nano list.txt
nano qcreads.sh
bash qcreads.sh


#Trimming fastq data using trimmomatic
conda install -c bioconda trimmomatic --yes
mkdir trimmed_reads && cd trimmed_reads
mkdir -p Fastqc_results
cd ..
nano listtrim.txt
cat
nano trimmomatic.sh
bash trimmomatic.sh

#Installation of mapping tools 
conda install -y -c bioconda bwa
conda install -c bioconda samtools
conda install -c bioconda bamtools

#Indexing reference file 
mkdir ref 
mv hg19.chr5_12_17.fa.gz ref
bwa index hg19.chr5_12_17.fa 

#Performing alignment 
mkdir Mapping
bwa mem -R '@RG\tID:231335\tSM:Normal' /home/einstein/crick/Saba/raw_data/ref/hg19.chr5_12_17.fa /home/einstein/crick/Saba/raw_data/trimmed_reads/SLGFSK-N_231335_r1_paired.fq.gz \
      /home/einstein/crick/Saba/raw_data/trimmed_reads/SLGFSK-N_231335_r2_paired.fq.gz > Mapping/SLGFSK-N_231335.sam
bwa mem -R '@RG\tID:231336\tSM:Tumor' /home/einstein/crick/Saba/raw_data/ref/hg19.chr5_12_17.fa /home/einstein/crick/Saba/raw_data/trimmed_reads/SLGFSK-T_231336_r1_paired.fq.gz \
       /home/einstein/crick/Saba/raw_data/trimmed_reads/SLGFSK-T_231336_r2_paired.fq.gz > Mapping/SLGFSK-T_231336.sam	
       
#Conversion of sam file to bam file
nano mappinglist.txt
nano convert.sh
bash convert.sh

#Filtering BAM files
nano filterbam.sh
bash filterbam.sh
cd Mapping
ls

#viewing output
/crick/Saba/raw_data/ref/Mapping$ samtools flagstat SLGFSK-N_231335.sorted.bam
/crick/Saba/raw_data/ref/Mapping$ samtools flagstat SLGFSK-T_231336.sorted.bam

#Performing duplicate removal
samtools rmdup SLGFSK-N_231335.sorted.bam  SLGFSK-N_231335.rdup 
samtools rmdup SLGFSK-T_231336.sorted.bam  SLGFSK-T_231336.rdup

#Left align
nano leftalign.sh
bash leftalign.sh
ls Mapping

#Recalibrating
nano recalibrate.sh
bash recalibrate.sh

#refilter read mapping qualities
cd Mapping
/crick/Saba/raw_data/ref/Mapping$ bamtools filter -in SLGFSK-T_231336.recalibrate.bam -mapQuality "<=254" > SLGFSK-T_231336.refilter.bam
/crick/Saba/raw_data/ref/Mapping$ bamtools filter -in SLGFSK-N_231335.recalibrate.bam -mapQuality "<=254" > SLGFSK-N_231335.refilter.bam      
cd ..

#Variant calling and classification
mkdir Variants

#command for converting data to pileup
nano convert
