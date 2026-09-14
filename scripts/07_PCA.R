
prj_dir <- dirname(getwd())
data_dir <- file.path(prj_dir, "data")
figures_dir <- file.path(prj_dir, "figures")
cel_files_dir <- file.path(data_dir, "raw_data")


### PCA:

library(affy)
library(ggplot2)

my_cel_files <- ReadAffy(
  celfile.path = cel_files_dir
)

data <- exprs(my_cel_files)

head(data)
colnames(data)


# Define the groups for the six samples:
# 3 Normal T24 cells and 3 T24 cells treated with MAP30.
Group <- c(
  rep("Normal T24 cells", time = 3),
  rep("T24 cells treated with MAP30", time = 3)
)

length(Group)


# Create a metadata data frame containing the sample names
# and their corresponding groups.
metadata <- data.frame(
  colnames(data),
  Group
)

View(metadata)


# Log2 transformation is used here to reduce the effect of
# very large expression values and make the data more suitable
# for PCA.
#
# Other normalization methods, such as RMA, can also be used.
norm_data <- log2(data + 1)


## Drawing PCA:

# Perform principal component analysis (PCA).
pc <- prcomp(norm_data)


# Extract the first three principal components and
# add the sample group information.
pc_rotation <- data.frame(
  pc$rotation[, 1:3],
  Group
)

View(pc_rotation)


# Create the PCA plot using PC1 and PC2.
pca_plot <- ggplot(
  pc_rotation,
  aes(PC1, PC2, color = Group)
) +
  geom_point(size = 3)

pca_plot


# Save the PCA plot as a PNG file.
ggsave(file.path(figures_dir,"PCA_plot.png"),
       plot = pca_plot,
       width = 9,
       height = 10
)
