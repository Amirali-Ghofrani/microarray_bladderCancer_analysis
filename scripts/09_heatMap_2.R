
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
figures_dir <- file.path(prj_dir, "figures")


### Correlation Heatmap:

library(pheatmap)
library(gplots)


# Load the expression data.
data <- read.csv(
  file.path(data_dir, "data_unique.csv")
)

# Set gene names as row names.
rownames(data) <- data[, 1]

# Remove the first column containing gene names.
data <- data[, -1]


# Calculate pairwise correlations between samples
# and create the correlation heatmap.
heat_plot_2 <- pheatmap(
  cor(data),
  main = "GSM RMA Correlations",
  color = redgreen(256),
  cellwidth = 160,
  cellheight = 160,
  fontsize = 17
)


# Save the correlation heatmap as a PNG file.
png(
  file.path(figures_dir, "Correlation_Heatmap.png"),
  width = 1500,
  height = 1500
)

heat_plot_2

dev.off()

