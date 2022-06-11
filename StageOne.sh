#!usr/bin/bash 

#Commands for DNA sequence count
wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa
grep -v "^>" DNA.fa | wc -c

#Commands for conda set-up
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sha256sum Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
