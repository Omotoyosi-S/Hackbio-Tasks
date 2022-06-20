#!usr/bin/bash
for sample in `cat mappinglist.txt`
do
        bamtools filter -in home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.recalibrate.bam -mapQuality "<=254 >" home/einstein/crick/Saba/raw_data/ref/Mapping/${sample}.refilter.bam
done
