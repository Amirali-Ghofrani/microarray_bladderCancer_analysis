
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")

data <- read.csv(
  file.path(data_dir, "final_data.csv"),
  header = TRUE
)

head(data)


### Preparing the proper data frame for limma:

# limma requires numeric expression data.
# Therefore, gene names should be stored as row names
# rather than in the first column.

# Gene names should also be unique.
# Omit "Null" and "---" values.
data <- data[data$X != "Null" & data$X != "---", ]

dim(data)


# Aggregate repetitive genes to obtain unique rows.
# For genes appearing more than once, the mean expression
# value is calculated for each sample.
data_unique <- aggregate(
  . ~ X,
  data = data,
  FUN = mean
)


# Apply gene names as row names and remove the first column
# containing gene names for the final limma analysis.
rownames(data_unique) <- data_unique[, 1]

limma_data <- data_unique[, 2:ncol(data_unique)]


# Import limma:
library(limma)





















