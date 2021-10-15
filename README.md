# Fst for more than 100 populations

The available softwares to calculate Fst do not allow more than 100 populations. Here there is a simple Rscript to overcome this problem:


## Set up

I use conde for installing almost all programs (https://conda.io/projects/conda/en/latest/user-guide/install/index.html). 
Make sure that either your conda environment have plink installed and is using R v.4. 
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
Hope it works! Email me for any doubt (epifaniarango@gmail.com)


