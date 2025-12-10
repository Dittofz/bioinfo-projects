
# Assignment for Week 01

#Answers go here

conda activate bioinfo
samtools --version
samtools 1.21
Using htslib 1.21
Copyright (C) 2024 Genome Research Ltd.

#create a nested directory structure
mkdir -p edu/a/b/c/d

#Show commands that create files in different directories 
touch ./file1.txt
touch ./edu/file2.txt

#Show how to use relative and absolute paths
#relative path
cd edu/
#absolute path
cd ~/github/bioinfo-projects/week01/

git add .
git commit -m "submit assignment for week 01"
git push
