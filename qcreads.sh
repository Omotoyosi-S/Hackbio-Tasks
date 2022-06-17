#!usr/bin/bash
for sample in `cat list.txt`
do
        fastqc ${sample}*.fastq.gz -o Fastqc_Reports
done

multiqc Fastqc_Reports -o Fastqc_Reports
