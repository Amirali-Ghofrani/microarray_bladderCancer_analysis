# Analysis Scripts

## 01. Download GEO Supplementary Files

### Overview

This script downloads the supplementary files associated with **GEO Series GSE256292** using the Bioconductor `GEOquery` package.

The downloaded files are stored in the project's `data/GSE256292/` directory and will be used in subsequent steps of the microarray analysis.

### Dataset

- **GEO accession:** GSE256292

- **Data source:** NCBI Gene Expression Omnibus (GEO)

- **Download method:** `GEOquery::getGEOSuppFiles()`

### Requirements

The script requires:

- R

- Bioconductor

- `GEOquery`

The script automatically checks whether `BiocManager` and `GEOquery` are installed and installs them if necessary.

### Project Structure

The project is organized as follows:

microarray-bladder-cancer-analysis/ ├── data/ │ └── GSE256292/ ├── scripts/ ├── figures/ ├── results/ ├── README.md └── .gitignore

The `data/GSE256292/` directory is created automatically if it does not already exist.

### Workflow

The script performs the following steps:

1.  Checks for and installs `BiocManager` if necessary.

2.  Checks for and installs `GEOquery` if necessary.

3.  Loads the `GEOquery` package.

4.  Defines the project and data directories.

5.  Creates the required directories.

6.  Downloads the supplementary files for GSE256292 from GEO.

7.  Lists the downloaded files to confirm successful retrieval.

### Output

The downloaded GEO supplementary files are stored in:

```         
data/GSE256292/ 
```

The exact files depend on the supplementary files available for GSE256292 at the time of download.

### Reproducibility

This script retrieves the data directly from the NCBI GEO database using the GEO accession number `GSE256292`.

Running the script again may download or overwrite files depending on the behavior of `GEOquery` and the existing contents of the data directory.
