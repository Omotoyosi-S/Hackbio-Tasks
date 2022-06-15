#!usr/bin/bash

#Commands for echo name task
nano toyosi.sh
echo "$Omotoyosi Saba"
echo "$Omotoyosi"
echo "$Saba"

#Commands for story one
mkdir SABA
mkdir Biocomputing && cd Biocomputing
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna
mv wildtype.fna ../SABA/
ls
rm wildtype.gbk.1
cd ..
cd SABA
grep "tatatata" wildtype.fna
grep "tatatata" wildtype.fna > mutantfile.fna
clear
history

#Commands for story two
sudo apt-get install figlet
figlet Omotoyosi
cd ..
mkdir compare
cd compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz
gunzip unix_intro_data.tar.gz
tar xvf unix_intro_data.tar
ls
cd seqmonk_genomes/
ls
cd Saccharomyces\ cerevisiae/
cd EF4/
grep "rRNA" Mito.dat
cpMito.dat ~/Compare
cp Mito.dat ~/Compare
ls
nano Mito.dat
cd ..
cd FastQ_Data/
wc -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
wc -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz > totallines
history

#Link to stories
echo "https://docs.google.com/document/d/1nhWYGu9oZ2AtMFkuqQX949nvHULAtuPdTcwcKZ02MMA/edit?usp=sharing"
echo "https://docs.google.com/document/d/1l8YCJSxV3U09d0u2XjMuPWTsrB0CR6YhNh11tCkipqE/edit?usp=sharing"
