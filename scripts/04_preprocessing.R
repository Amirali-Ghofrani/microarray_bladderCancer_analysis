### Practical code examples for data preprocessing:


prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
cel_files_dir <- file.path(data_dir, "raw_data")

library(affy)

my_cel_files <- ReadAffy(celfile.path = cel_files_dir)
data <- exprs(my_cel_files)

head(data)

# General shape of our data
hist(data, breaks = 500, xlim = c(0, 1000))
hist(data, breaks = 5000, xlim = c(0, 500))

### an example for filtering:
# Filter genes based on their expression level
data_filtered <- data[which(rowSums(data) < 100)]
# Rows with a total gene expression less than 100

data_filtered_2 <- data[which(rowMeans(data) > 5)]
# Rows with a mean gene expression greater than 5



# Using the sum() function
sum(data == 0)
# Number of zero values in the entire dataset

sum(data <= 40)
# Number of values equal to or less than 40 in the entire dataset



### Data normalization

# RMA:
# The RMA function normalizes the data and transforms the data
# to log2 values.

norm_data_with_rma <- affy::rma(my_cel_files)

rma_df <- exprs(norm_data_with_rma)

head(rma_df, 10)

hist(rma_df)
boxplot(rma_df)


# Note:
# RMA also removes control probes and retains the probes
# associated with the measured genes.

dim(rma_df)


# Using normalized RMA data as the final data
final_data <- rma_df











