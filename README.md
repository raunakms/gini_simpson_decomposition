# Gini-Simpson Decomposition
This script is useful for calculating Gini-Simpson Decomposition implemented in R. Gini-Simpson Decomposition is also known as "Fractionalization".
<br/><br/>

## Usage
- Gini-Simpson Decomposition 
  - Use `get_GiniSimpson_Decomposition()` function to get the within group (in-class), between group (out-class), and overall group Gini-Simpson index.

```sh
get_GiniSimpson_Decomposition(dat)
```

#### Input parameter
- `dat` : R dataframe or matrix containing the input data of Group and Features. Groups, for which the Gini-Simpson indices are calculated, are arranged in rows and the Features in columns.

#### Output
- The function `get_GiniSimpson_Decomposition` generates output of the following in form of a R-list.
  - `GS_overall`  : Overall Gini-Simpson Index
  - `GS_within`   : Within group Gini-Simpson Index Decomposition
  - `GS_between`  : Between group Gini-Simpson Index Decomposition
<br/><br/>

## Demo script
```sh
# LOAD DATA --- 
dat <- matrix(c(15,40,20,30), byrow = TRUE, nrow = 2)

### GINI-SIMPSON DECOMPOSITION ---
source("gini_simpson_decomposition.R")
get_GiniSimpson_Decomposition(dat)
```
