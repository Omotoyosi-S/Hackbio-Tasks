#!usr/bin/bash
for sample in `cat mappinglist.txt`
do
        samtools view -q 1 -f 0x2 -F 0x8 -b /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.sorted.bam > /home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.filtered1.bam
done
