#!usr/bin/bash
for sample in `cat mappinglist.txt`
do

        samtools view -@ 20 -S -b /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.sam | samtools sort -@ 32 > Mapping/${sample}.sorted.bam

        samtools index /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.sorted.bam
done
