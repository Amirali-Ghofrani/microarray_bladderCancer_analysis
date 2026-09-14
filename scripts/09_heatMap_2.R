
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
figures_dir <- file.path(prj_dir, "figures")


### Correlation Heatmap:

library(pheatmap)
library(gplots)

data <- read.csv(
  file.path(data_dir, "data_unique.csv"))

rownames(data) <- data[, 1]
data <- data[, -1]


heat_plot_2 <- pheatmap(cor(data), main = "GSM RMA Correlations",
                           color = redgreen(256), cellwidth = 160,
                           cellheight = 160,
                           fontsize = 17)
png( file.path(figures_dir, "04_Correlation_Heatmap.png"),
     width = 1500,
     height = 1500
)
heat_plot_2
dev.off()