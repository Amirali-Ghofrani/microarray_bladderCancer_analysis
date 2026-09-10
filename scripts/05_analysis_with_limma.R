
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


# Defining our sample groups:
# 3 samples are Normal and 3 samples are Treated.
Groups <- c(
  "Normal", "Normal", "Normal",
  "Treated", "Treated", "Treated"
)

# Create the design matrix without an intercept.
# Each group gets its own column.
Design <- model.matrix(~ 0 + factor(Groups))

# Rename the design matrix columns.
colnames(Design) <- c("Normal", "Treated")


# Fitting our linear model using limma:
# This fits a linear model to the expression data
# based on the experimental design.
fit_data <- lmFit(
  limma_data,
  design = Design
)


# Defining the contrast:
# We want to compare gene expression between the
# Normal and Treated groups.
#
# "Normal - Treated" means:
# Positive logFC -> higher expression in Normal
# Negative logFC -> higher expression in Treated.
cont <- makeContrasts(
  contrasts = "Normal - Treated",
  levels = Design
)

# Apply the specified contrast to the fitted model.
fit_data_2 <- contrasts.fit(
  fit = fit_data,
  contrasts = cont
)


# Empirical Bayes moderation:
# eBayes applies empirical Bayes moderation to the
# standard errors of the estimated log-fold changes.
# This improves the stability of the statistical tests,
# especially when the number of samples is small.
fit_data_3 <- eBayes(
  fit_data_2,
  0.01
)


# Generate the final differential expression results:
# adjust = "fdr" applies false discovery rate correction
# for multiple testing.
#
# sort.by = "B" sorts the genes according to the B-statistic,
# which represents the log-odds that a gene is differentially
# expressed.
#
# number = Inf returns results for all genes.
Result <- topTable(
  fit_data_3,
  adjust = "fdr",
  sort.by = "B",
  number = Inf
)


### Identifying the top 100 genes from the results
# These genes will be used for further plotting.

rownames(Result)[1:100]

# Extract the expression data for the top 100 genes.
top_genes <- limma_data[rownames(Result)[1:100], ]

# Save the top 100 genes as a CSV file.
write.csv(
  top_genes,
  file.path(data_dir, "top_genes.csv")
)








