
#how to install GEOquery library:
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GEOquery")


# adding GEOquery after installation:
library(GEOquery)

# setting working directory:
setwd("D:/bioinformatics/microarray_bladderCancer_analysis/")
getwd()         # returns the working directory 


