install.packages("BiocManager")
library(BiocManager)

BiocManager::install("affy")
library(affy)

project_dir = dirname(getwd())
data_dir = file.path(project_dir, "data")
cel_files_dir = file.path(data_dir, "raw_data")

str(cel_files_dir)
my_cel_files <- ReadAffy(celfile.path = cel_files_dir)
data = exprs(my_cel_files)
