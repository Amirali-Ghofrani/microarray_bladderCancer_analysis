# ============================================================
# Download GSE256292 supplementary files using GEOquery
# ============================================================


# ------------------------------------------------------------
# 1. Install and load GEOquery
# ------------------------------------------------------------

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

if (!requireNamespace("GEOquery", quietly = TRUE)) {
  BiocManager::install("GEOquery")
}

library(GEOquery)


# ------------------------------------------------------------
# 2. Define project directories
# ------------------------------------------------------------

project_dir <- dirname(getwd())

data_dir <- file.path(
  project_dir,
  "data"
)

gse_dir <- file.path(
  data_dir,
  "GSE256292"
)

# ------------------------------------------------------------
# 3. Create data directory
# ------------------------------------------------------------

dir.create(
  data_dir,
  showWarnings = FALSE
)

dir.create(
  gse_dir,
  showWarnings = FALSE
)


# ------------------------------------------------------------
# 4. Download GSE256292
# ------------------------------------------------------------

get_my_GSE <- getGEOSuppFiles(
  "GSE256292",
  baseDir = data_dir
)


# ------------------------------------------------------------
# 5. Check downloaded files
# ------------------------------------------------------------


list.files(
  gse_dir,
  recursive = TRUE
)