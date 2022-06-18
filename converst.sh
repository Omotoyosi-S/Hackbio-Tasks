#!usr/bin/bash
for sample in `cat mappinglist.txt`
do
        Convert SAM to BAM and sort it
        samtools view -@ 20 -S -b /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.sam | samtools sort -@ 32 > Mapping/${sample}.sorted.bam

        Index BAM file
        samtools index /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.sorted.bam
done
