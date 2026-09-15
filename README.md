# Microarray Analysis of Bladder Cancer Cells

## Overview

This project presents a bioinformatics workflow for the analysis of **Affymetrix microarray gene expression data** from bladder cancer cells.

The analysis is based on the publicly available **GSE256292** dataset from the NCBI Gene Expression Omnibus (GEO) database.

The main goal of this project was to develop practical experience with microarray data analysis, including data preprocessing, normalization, differential expression analysis, quality assessment, and visualization.

This project was also created as part of my ongoing development in **bioinformatics, genomics, and cancer research**.

------------------------------------------------------------------------

## Dataset

- **GEO accession:** GSE256292

- **Platform:** Affymetrix Human Genome U133 Plus 2.0 Array

- **Samples:** 6

- **Experimental groups:**

  - 3 Normal T24 cells
  - 3 T24 cells treated with MAP30

The raw Affymetrix CEL files were obtained from the GEO database.

The platform annotation file used in the analysis can be downloaded from the corresponding GSM page on the NCBI Gene Expression Omnibus (GEO) database.

------------------------------------------------------------------------

## Analysis Workflow

The project follows the general workflow below:

``` text
Raw Affymetrix CEL files
        ↓
Quality control
        ↓
RMA normalization
        ↓
Probe annotation
        ↓
Gene-level data processing
        ↓
Differential expression analysis
        ↓
Visualization
        ↓
Biological interpretation
```

The main analyses include:

- Raw expression data quality assessment
- RMA normalization
- Probe-to-gene annotation
- Removal of duplicated gene symbols
- Differential expression analysis using `limma`
- Volcano plot
- Principal Component Analysis (PCA)
- Gene expression heatmap
- Sample correlation heatmap
- Boxplot visualization of array expression

------------------------------------------------------------------------

## Repository Structure

``` text
microarray-bladder-cancer-analysis/
├── data/
│   └── data_unique.csv
├── scripts/
├── figures/
├── results/
│   ├── results.csv
│   └── top_genes.csv
├── README.md
└── .gitignore
```

### Directory Description

- **`data/`** — processed expression data used in the analysis.
- **`scripts/`** — R scripts used to perform the analysis.
- **`figures/`** — generated plots and visualizations.
- **`results/`** — differential expression results and selected top genes.
- **`README.md`** — overview and documentation of the project.

For detailed information about each analysis step and the corresponding R scripts, please see the **`scripts/README.md`** file.

------------------------------------------------------------------------

## Main Results

The differential expression analysis was performed using the `limma` package.

The main output includes:

- Complete differential expression results
- Top-ranked genes
- Array expression boxplot
- Volcano plot
- PCA plot
- Heatmap of the top genes
- Sample correlation heatmap

The figures generated during the analysis are available in the `figures/` directory, while numerical results are available in the `results/` directory.

------------------------------------------------------------------------

## Main R Packages

The analysis uses several R and Bioconductor packages, including:

- `GEOquery`
- `affy`
- `limma`
- `ggplot2`
- `pheatmap`
- `gplots`
- `EnhancedVolcano`

------------------------------------------------------------------------

## Reproducibility

The analysis was performed in R using publicly available microarray data.

The R scripts used to perform the individual analysis steps are provided in the `scripts/` directory.

Detailed explanations of the workflow, inputs, methods, settings, outputs, and interpretation for each script are provided in:

``` text
scripts/README.md
```

Users interested in reproducing or extending the analysis are encouraged to follow the scripts in sequence and review the corresponding documentation.

------------------------------------------------------------------------

## Acknowledgements

I would like to sincerely thank **Dr. Ehsan Keramati** for his fantastic course on microarray analysis and for generously sharing his knowledge and experience in this field. His course was an important part of my learning process while working on this project.

Educational content by Dr. Ehsan Keramati (mostly in Persian language):

**EKgenetics:** [https://www.youtube.com/\@EKgenetics](https://www.youtube.com/@EKgenetics){.uri}

I would also like to express my sincere appreciation to **ChatGPT** for its help and support throughout this project, particularly with understanding concepts, troubleshooting, editing files, improving documentation, and organizing the project for GitHub.

------------------------------------------------------------------------

## Disclaimer

This project is intended for **educational and portfolio purposes** and represents a learning exercise in bioinformatics and microarray data analysis.

The analyses and results presented here should not be interpreted as clinical findings or medical recommendations.

------------------------------------------------------------------------

## Summary

Together, this project demonstrates a complete introductory workflow for **Affymetrix microarray data processing, differential expression analysis, quality assessment, and visualization**.

This project represents one step in my ongoing journey toward developing practical skills in **bioinformatics, genomics, and cancer research**.
