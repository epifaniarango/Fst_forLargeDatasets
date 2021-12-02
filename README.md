# Fst for more than 100 populations

The available softwares to calculate Fst do not allow more than 100 populations. We used Weir and Cockerham Fst(1) with the software PLINK(2) is calculated with Here there is a simple Rscript to overcome this problem:


## Set up

I use conda for installing almost all programs (https://conda.io/projects/conda/en/latest/user-guide/install/index.html). 
Make sure that your conda environment has plink(1) installed and is using R v.4. 
Also make sure that you have the Pacman library installed in R!

## Ready to run!

On the same folder where you have your plink files in binary format (bed, bim and fam), download the Rcode and run it like this: 

```
Rscript Fst_script.R My_PlinkFile_Name #Cores 
``` 

The code will run along the unique names that you have on the populations name on your fam file (column 1)

My_PlinkFile_Name: Name of your plink files without extensions. Ex: If your files are called Dataset1.bed, Dataset1.bim and Dataset1.fam and you want to use 6 cores for the calculation. Run it like this:


```
Rscript Fst_script.R Dataset1 6 
``` 

The running time will depend on the numbers of populations and the cores that you have available. At the end you will get a final text file with the name Fst.txt with all the Fst combinations
Hope it works! Email me for any doubt (epifaniarango@gmail.com).


# Bibliografy
1. Chang, C. C. et al. Second-generation PLINK: rising to the challenge of larger and richer datasets. GigaScience 4, (2015).

2.Weir, B. S. & Cockerham, C. C. Estimating F-Statistics for the Analysis of Population Structure. Evolution 38, 1358–1370 (1984).
