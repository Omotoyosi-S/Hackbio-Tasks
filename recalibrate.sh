#!usr/bin/bash
for sample in `cat mappinglist.txt`
do
        samtools calmd -@ 32 -b /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.leftAlign.bam /home/einstein/crick/Saba/raw_data/ref/hg19.chr5_12_17.fa > /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.recalibrate.bam
done
