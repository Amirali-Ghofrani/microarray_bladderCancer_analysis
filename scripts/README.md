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

## 02. Extract GSE256292 Raw Data

### Overview

This script extracts the raw data files from the `GSE256292_RAW.tar` archive downloaded in the previous step.

The extracted files are stored in the project's `data/raw_data/` directory and are used for the downstream microarray analysis.

### Input

The script uses the following archive:

``` text
data/GSE256292/GSE256292_RAW.tar
```

This archive contains the raw microarray data associated with the GSE256292 dataset.

### Workflow

The script performs the following steps:

1.  Defines the project and dataset directories.
2.  Defines the directory for the extracted raw data.
3.  Creates the `data/raw_data/` directory if it does not already exist.
4.  Extracts the `GSE256292_RAW.tar` archive using `untar()`.
5.  Lists the extracted files to confirm successful extraction.

### Output

The extracted raw files are stored in:

``` text
data/raw_data/
```

These files are used in the subsequent preprocessing and quality-control steps of the analysis.

## 03. Affymetrix Raw Data Processing and Quality Control

### Overview

This script reads the raw Affymetrix CEL files from the GSE256292 dataset and performs initial quality-control analyses before normalization.

The script uses the `affy` Bioconductor package to import the CEL files and inspect their probe-level expression data.

### Requirements

The script requires:

- R

- Bioconductor

- `affy`

- `BiocManager`

The required packages are installed and loaded at the beginning of the script.

### Input

The script reads the raw Affymetrix CEL files stored in:

```         
data/raw_data/ 
```

These files were extracted from the GEO supplementary data archive in the previous step.

### Workflow

The script performs the following steps:

1.  Installs and loads the required Bioconductor packages.

2.  Defines the project and raw data directories.

3.  Reads the Affymetrix CEL files using `ReadAffy()`.

4.  Extracts the raw probe-level expression matrix using `exprs()`.

5.  Inspects the raw expression values.

6.  Visualizes the spatial distribution of the first array.

7.  Assesses RNA degradation across the arrays using `AffyRNAdeg()`.

8.  Generates RNA degradation plots.

9.  Generates boxplots to examine expression distributions before normalization.

10. Generates a histogram of the raw expression intensity distribution.

### Quality Control

Several complementary quality-control approaches are used:

#### Array Image

The spatial image of the first array is examined to identify potential spatial artifacts or technical abnormalities.

#### RNA Degradation

`AffyRNAdeg()` is used to assess RNA degradation across the arrays by examining the relationship between probe position and signal intensity.

#### Boxplots

Boxplots are used to compare the distribution of probe-level expression values across arrays before normalization.

#### Histogram

The histogram provides an overview of the distribution of raw expression intensities.

### Output

This script primarily produces quality-control plots for visual inspection.

## 04. Data Preprocessing, Normalization, and Gene Annotation

### Overview

This script demonstrates the main preprocessing steps applied to the Affymetrix microarray data before differential expression analysis.

The workflow includes inspection of raw expression values, basic filtering examples, RMA normalization, gene annotation, and preparation of the final expression matrix for downstream analysis.

### Input

The script uses:

- Raw Affymetrix CEL files from:

```         
data/raw_data/ 
```

- The platform annotation file:

```         
data/annotation_GPL15207-17536.csv 
```

- Note: The platform annotation file can be downloaded from the corresponding GSM page on the NCBI Gene Expression Omnibus (GEO) database.

### Workflow

The script performs the following steps:

1.  Defines the project and raw data directories.

2.  Reads the Affymetrix CEL files using `ReadAffy()`.

3.  Extracts the raw probe-level expression matrix.

4.  Inspects the distribution of raw expression values using histograms.

5.  Demonstrates basic expression-based filtering.

6.  Counts zero and low-intensity expression values.

7.  Performs RMA normalization.

8.  Inspects the normalized expression matrix using histograms and boxplots.

9.  Loads the platform annotation file.

10. Matches the normalized expression data with gene annotation information.

11. Extracts gene symbols from the annotation file.

12. Assigns gene symbols as row names of the normalized expression matrix.

13. Saves the resulting expression matrix for use in downstream analysis.

### Expression Filtering

Basic filtering examples are included to demonstrate how expression values can be used to select rows from an expression matrix.

These filtering operations are **practical examples** rather than the final filtering strategy used for the differential expression analysis.

### RMA Normalization

Robust Multi-array Average (RMA) normalization is applied using the `affy` package.

RMA performs:

- Background correction

- Quantile normalization

- Probe-level summarization

The resulting expression values are on a log2 scale.

The normalized expression matrix is stored in:

```         
final_data 
```

### Gene Annotation

The platform annotation file is used to associate the probe identifiers in the normalized expression matrix with gene symbols.

Gene symbols are assigned as the row names of the final expression matrix.

Rows without a corresponding gene symbol are assigned the value:

```         
Null 
```

### Output

The final normalized and annotated expression matrix is saved as:

```         
data/final_data.csv 
```

This file is used as the input for the subsequent differential expression analysis.

### Important Note

The filtering commands in this script are included as practical examples for learning data preprocessing. They should not be interpreted as the definitive filtering criteria for this dataset.
