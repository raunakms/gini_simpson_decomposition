#dat <- matrix(c(15,40,20,30), byrow = TRUE, nrow = 2)

### LOAD DATA ---
dat <- read.delim(file.path("data.tsv"), header=TRUE, stringsAsFactors=FALSE, row.names=1)

### GINI-SIMPSON DECOMPOSITION ---
source("gini_simpson_decomposition.R")
list.gsd <- get_GiniSimpson_Decomposition(dat)
