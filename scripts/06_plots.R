
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
figures_dir <- file.path(prj_dir, "figures")

### Volcano plots:
BiocManager::install("EnhancedVolcano")
library(EnhancedVolcano)

# we always draw our volcano plots using the results data(adj. p values and logFC):
data <- read.csv(file.path(data_dir, "results.csv"))
colnames(data)[1] <- "Gene"
colnames(data)[2] <- "log2FoldChange"
colnames(data)

my_volcano <- EnhancedVolcano(data,
                  lab = data$Gene,
                  x = "log2FoldChange",
                  y = "adj.P.Val",
                  title = "Microarray Volcano",
                  pCutoff = 0.05,
                  FCcutoff = 2,
                  pointSize = 1.0,
                  labSize = 6.0)
my_volcano

ggsave(file.path(figures_dir, "enhanced_volcano.png"), 
       plot = my_volcano,
       width = 9,
       height = 10)

######################################


