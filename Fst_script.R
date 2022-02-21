#!/usr/bin/env Rscript



library(pacman)
pacman::p_load("foreach","doParallel")

args <- commandArgs(trailingOnly = TRUE)




#arguments 1.file 
bed = args[1]

#argument 2. cores
cores = as.numeric(args[2])

fam=read.table(paste(bed,".fam",sep = ""))



#create cluster file for Plink
clusters=fam[,c(1,2,1)]
write.table(clusters,"clusters.txt", quote = F, col.names = F, row.names = F)

pops=unique(fam$V1)


#combination of all pops without duplicates

expand.grid.unique <- function(x, y, include.equals=FALSE){
  x <- unique(x)
  y <- unique(y)
  g <- function(i){z <- setdiff(y, x[seq_len(i-include.equals)])
  if(length(z)) cbind(x[i], z, deparse.level=0)}
  do.call(rbind, lapply(seq_along(x), g))}




combinaciones=as.data.frame(expand.grid.unique(pops,pops)) 



# normal for loop
cat("normal for loop\n")




for (i in 1:cores) {
  cat(i, '\n')
}

cat("multithreaded for loop\n")

cl <- makeCluster(cores, outfile="")
registerDoParallel(cl)


dir.create("trash")
header= as.data.frame(matrix(nrow = 1,ncol = 3))
header[1,]=c("Pop1","Pop2","FST")
write.table(header, "fst.txt",quote = F,col.names = F,row.names = F)


foreach (i=1:nrow(combinaciones)) %do% {

  system(paste("plink --bfile ",bed," --allow-no-sex --keep-cluster-names ",combinaciones[i,1]," ",combinaciones[i,2]," --within clusters.txt --fst --out trash/fst.",combinaciones[i,1],"_",combinaciones[i,2],">log", sep = ""))
  system(paste("grep 'Weighted Fst estimate:' trash/fst.",combinaciones[i,1],"_",combinaciones[i,2],".log> trash/fst.",combinaciones[i,1],"_",combinaciones[i,2],sep = ""))

  fst = read.table(paste("trash/fst.",combinaciones[i,1],"_",combinaciones[i,2],sep = ""))
  vec=c(combinaciones[i,1],combinaciones[i,2],fst$V4)
  write(paste(vec[1], vec[2], vec[3],"\n", sep ='\t'),file="fst.txt",append=TRUE)
  
  system(paste("rm trash/fst.",combinaciones[i,1],"_",combinaciones[i,2],"*", sep=""))

  
}

stopCluster(cl)
system(paste("sed -i '/^$/d' fst.txt", sep=""))
system(paste("rm -rf trash", sep = ""))


