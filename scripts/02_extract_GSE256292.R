# ============================================================
# Extract GSE256292 raw data
# ============================================================


# ------------------------------------------------------------
# 1. Set project directories
# ------------------------------------------------------------

project_dir <- dirname(getwd())

gse_dir <- file.path(
  project_dir,
  "data",
  "GSE256292"
)

raw_data_dir <- file.path(
  project_dir,
  "data",
  "raw_data"
)


# ------------------------------------------------------------
# 2. Create extraction directory
# ------------------------------------------------------------

dir.create(
  raw_data_dir,
  showWarnings = FALSE
)


# ------------------------------------------------------------
# 3. Extract the RAW tar archive
# ------------------------------------------------------------

untar(
  file.path(
    gse_dir,
    "GSE256292_RAW.tar"
  ),
  exdir = raw_data_dir
)


# ------------------------------------------------------------
# 4. Check extracted files
# ------------------------------------------------------------

list.files(
  raw_data_dir,
  recursive = TRUE
)