# ============================================================
# Affymetrix Microarray Analysis
# GSE256292
# ============================================================


# ------------------------------------------------------------
# 1. Install and load required packages
# ------------------------------------------------------------

install.packages("BiocManager")
library(BiocManager)

BiocManager::install("affy")
library(affy)


# ------------------------------------------------------------
# 2. Define project directories
# ------------------------------------------------------------

# Get the project root directory.
# The R script is assumed to be run from the "scripts" directory.

project_dir <- dirname(getwd())

# Define the directory containing the project data.
data_dir <- file.path(
  project_dir,
  "data"
)

# Define the directory containing the raw Affymetrix CEL files.
cel_files_dir <- file.path(
  data_dir,
  "raw_data"
)


# ------------------------------------------------------------
# 3. Read Affymetrix CEL files
# ------------------------------------------------------------

# Check the path to the CEL files.
str(cel_files_dir)

# Read all CEL files from the specified directory.
my_cel_files <- ReadAffy(
  celfile.path = cel_files_dir
)


# ------------------------------------------------------------
# 4. Inspect raw expression data
# ------------------------------------------------------------

# Extract the raw probe-level expression matrix.
raw_expression <- exprs(my_cel_files)

# Display the first 10 rows of the expression matrix.
head(raw_expression, 10)

# Check the maximum raw expression intensity.
max(raw_expression)


# ------------------------------------------------------------
# 5. Visual quality control
# ------------------------------------------------------------

# Display the spatial image of the first array.
image(
  my_cel_files[1]
)


# ------------------------------------------------------------
# 6. RNA degradation assessment
# ------------------------------------------------------------

# Assess RNA degradation across the arrays.
my_RNA_DEG <- AffyRNAdeg(
  my_cel_files
)

# Plot the RNA degradation profiles.
plotAffyRNAdeg(
  my_RNA_DEG
)


# ------------------------------------------------------------
# 7. Boxplots of expression distributions
# ------------------------------------------------------------

# Boxplot of raw, unnormalized probe-level expression.
# This is used to inspect the expression distributions
# before normalization.
boxplot(
  raw_expression,
  main = "Raw Expression Before Normalization",
  las = 2
)

# Boxplot using the AffyBatch object.
# This provides an overview of the array-level expression
# distributions.
boxplot(
  my_cel_files,
  main = "Affymetrix Array Expression"
)


# ------------------------------------------------------------
# 8. Histograms of expression values
# ------------------------------------------------------------

# Plot the distribution of expression intensities.
hist(
  my_cel_files,
  main = "Distribution of Expression Values",
  xlab = "Expression intensity",
  ylab = "Frequency"
)
