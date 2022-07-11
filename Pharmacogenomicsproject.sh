#!Usr/bin/bash
cd project3
mkdir Saba && cd Saba
mkdir Dataset

#Downloading dataset
wget https://github.com/HackBio-Internship/public_datasets/blob/14972eaf11c4c172fdcd5e686da02a720655cca7/Asia_HLA_Distribution/complete_1000_genomes_sample_list_.tsv
wget https://github.com/HackBio-Internship/public_datasets/blob/main/Asia_HLA_Distribution/binary_plink_file/asia.bed.gz?raw=true -O asia.bed.gz
wget https://github.com/HackBio-Internship/public_datasets/blob/main/Asia_HLA_Distribution/binary_plink_file/asia.bim?raw=true -O asia.bim
wget https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Asia_HLA_Distribution/binary_plink_file/asia.fam

#Unzipping asia.bed.gz file using gunzip
gunzip asia.bed.gz

#Generating egeinvalues
plink --bfile asia --pca --chr-set 36 no-xy

#Moving files from server to local PC
scp -P 10193 -r einstein@6.tcp.eu.ngrok.io:/home/einstein/project3/Saba/ $PWD

#setting directory in Renv
getwd()
#setting directory
setwd("/Users/omotoyosisaba/Saba/Dataset")
#Checking to see if directory is set
getwd()


#saving info from file into an output file
pca1 <- read.table("/Users/omotoyosisaba/Saba/Dataset/plink.eigenvec",sep=" ", header=F)


install.packages("ggplot2")
library("ggplot2")

ggplot(data=pca1, aes(V3,V4)) + geom_point()

data <- read.table("/Users/omotoyosisaba/Saba/Dataset/complete_1000_genomes_sample_list_.tsv", sep = "\t", header = TRUE)

head(metadata)

merge_data <- merge(x= pca1,y= metadata, by.x = "V2" , by.y = "Sample.name", all = F )

ggplot(data=merge_data, aes(V3,V4, color = Population.name)) + geom_point()
ggplot(data=merge_data, aes(V3,V4, color = Population.code)) + geom_point()

#Create a LD pruned set of markers (first step)
plink --bfile asia --indep-pairwise 1000 10 0.01 --out prune1

#Calculate identity by descent score on the pruned marker list
plink --bfile asia --extract prune1.prune.in --genome --out ibs1

#Cluster individuals into homogeneous groups and perform multidimensional scaling analysis 
plink --bfile asia --read-genome ibs1.genome --cluster --ppc 1e-3 --cc --mds-plot 2 --out strat1 


#Visualizing MDS analysis using ggplot in R studio
mdsdata <- read.table ("strat1.mds" , header = TRUE ) 
ggplot(data=merged_mds, aes(C1,C2, color = Population.code)) + geom_point() + ggtitle ("Multidimensional Scaling Analysis")
