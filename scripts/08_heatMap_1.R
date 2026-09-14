
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
figures_dir <- file.path(prj_dir, "figures")


### Heatmap:

library(pheatmap)

# Install and load the gplots package if needed.
if (!requireNamespace("gplots", quietly = TRUE)) {
  install.packages("gplots")
}

library(gplots)


## Drawing a heatmap from the top 100 genes:

# Load the expression data for the top 100 genes.
data <- read.csv(
  file.path(data_dir, "top_genes.csv")
)

# Set gene names as row names.
rownames(data) <- data[, 1]

# Remove the first column containing gene names.
data <- data[, -1]


# Create the heatmap.
heat_plot_1 <- pheatmap(
  data,
  color = greenred(256),
  fontsize = 8,
  cellwidth = 160,
  cellheight = 12,
  angle_col = 45,
  main = "Top Genes",
  fontsize_row = 12,
  fontsize_col = 15
)


# Save the heatmap as a PNG file.
png(
  file.path(figures_dir, "03_Heatmap for Top 100 Genes.png"),
  width = 1500,
  height = 1500
)

heat_plot_1

dev.off()

