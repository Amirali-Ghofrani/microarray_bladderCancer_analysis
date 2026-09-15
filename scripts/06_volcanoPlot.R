
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
figures_dir <- file.path(prj_dir, "figures")

results_dir <- file.path(
  prj_dir,"results"
)



### Volcano plot:

# Install and load EnhancedVolcano.
BiocManager::install("EnhancedVolcano")
library(EnhancedVolcano)


# Volcano plots are created using the differential expression
# results, particularly log2 fold change and adjusted p-values.
data <- read.csv(
  file.path(results_dir, "results.csv")
)

# Rename the first two columns for easier use.
colnames(data)[1] <- "Gene"
colnames(data)[2] <- "log2FoldChange"

colnames(data)


# Create the volcano plot.
my_volcano <- EnhancedVolcano(
  data,
  lab = data$Gene,
  x = "log2FoldChange",
  y = "adj.P.Val",
  title = "Microarray Volcano",
  pCutoff = 0.05,
  FCcutoff = 2,
  pointSize = 1.0,
  labSize = 6.0
)

my_volcano


# Save the volcano plot as a PNG file.
ggsave(
  file.path(figures_dir, "enhanced_volcano.png"),
  plot = my_volcano,
  width = 9,
  height = 10
)


