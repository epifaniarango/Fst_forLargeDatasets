# Fst for more than 100 populations

FST between populations is a common statistic in population genetics. PLINK(1) does not have a native function to calculate between population FST, and commonly used functions like smartpca in Eigensoft(https://github.com/chrchang/eigensoft/tree/master/POPGEN)doe snot run for dataset with more than 100 population. 
This R script uses the Weir and Cockerham Fst(2), implemented in the software PLINK(1) to calculate pairwise distance between populations. It accepts the input data as plink file format and extracts population information from the .fam file.


## Set up

I use conda for installing almost all programs (https://conda.io/projects/conda/en/latest/user-guide/install/index.html). 
Make sure that your conda environment has Plink(1) installed and is using R v.4. 
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
1. Weir, B. S. & Cockerham, C. C. Estimating F-Statistics for the Analysis of Population Structure. Evolution 38, 1358–1370 (1984).
2. Chang, C. C. et al. Second-generation PLINK: rising to the challenge of larger and richer datasets. GigaScience 4, (2015).


