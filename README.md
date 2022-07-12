# Hackbio-Tasks 
This is a 5 week long intensive biocomputing worshkop where we'd be exploring bash scripting basics for bio-data analysis
# Stage zero tasks
This stage involved learning basic bash commands like mkdir for creating new directories, rm for deleting files, **rmdir** for deleting directories, grep for pattern matching and cat for viewing file content. The file HackBioStageZero.sh is the result of this stage.
# Stage one tasks
Stage one involved the usage of bash basics to solve simple bio-data problems. I performed genome sequence analysis using software like fastqc for quality control , fastp for trimming adapter sequences and multiqc for merging quality control reports. All of this was done in the miniconda environment as we were introduced to conda usage. The result of this stage is StageOne.sh
# Stage two tasks
In this task called "standing on the shoulder of giants", we replicate a previous workflow that identifies germline and somatic variants. Using 
the Linux pipeline, I was able to perform qc reads on the raw data, trim adapter sequences using Trimmomatic, map sequences against the reference using BWA tools and so much more.
# Stage three task ( Final Pharmacogenomics project )
Stage three, the final task of the hackbio workshop. In this task, my project explored the pharmacogenomics of HLA variants within 4 different Asian populations. The HLA loci are some of the most genetically variable loci in mammals, hence, this project aims to compare the HLA variants in 4 different Asian population groups - Dai (CDX), Han (CHB), and Southern Han Chinese (CHS) and Vietnamese (KHV). Using PCA, Plink command, and Multidimensional scaling analysis (MDA), we were able to decompose the complex population structure, cluster individuals into homogenous groups and perform MDA. The results from this analysis infers possible biological implications associated with the identified Asian HLA variants particularly in drug response. You can get the details of this project https://docs.google.com/document/d/10tFcxPWGC89nrvHv0YNqcJjGfwG5G7Hu4JdpywFYnXc/edit?usp=sharing
