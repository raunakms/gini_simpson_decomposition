###: ginisim_overall() ---
ginisim_overall <- function(dat){
  # s = 1 - SUM_j [ (n_j/n)^2 ]
  
  # GET GROUP AND ITEM TOTAL ---
  n_i <- rowSums(dat)
  n_j <- colSums(dat)
  n <- sum(n_i)
  
  # SUMMATION ---
  list_j <- list()
  for(j in 1:length(n_j)){
    list_j[[j]] <- (n_j[j]/n)^2
  }
  
  # OVERALL --
  s <- 1 - do.call(sum, list_j)
  
  return(s)
}

###: ginisim_within() ---
ginisim_within <- function(dat){
  # s_w = 1 - SUM_i [ (n_i/n) * SUM_j [(n_ij/n_i)^2] ] 
  
  # GET GROUP AND ITEM TOTAL ---
  n_i <- rowSums(dat)
  n_j <- colSums(dat)
  n <- sum(n_i)
  
  # ITERATE FOR ROW ---
  list_x <- list()
  for(i in 1:length(n_i)){
    x_i <- n_i[i]/n
    
    # ITERATE FOR COLUMN ---
    list_y <- list()
    for(j in 1:length(n_j)){
      n_ij <- dat[i,j]
      list_y[[j]] <- (n_ij/n_i[i])^2
    }
    
    list_x[[i]] <- x_i * do.call(sum, list_y)
  }
  
  # WITHIN ---
  s_w <- do.call(sum, list_x)
  
  return(s_w)
}


### FUNCTION: ginisim_between() ---
ginisim_between <- function(s_overall, s_within){
  s_b <- s_overall - s_within
  return(s_b)
}

### FUNCTION: ginisim_between() ---
get_GiniSimpson_Decomposition <- function(dat){
  s <- ginisim_overall(dat)
  s_w <- ginisim_within(dat)
  s_b <- ginisim_between(s_overall=s, s_within=s_w)
  
  # OUTPUT ---
  list.output <- list(GS_overall=s, 
                      GS_within=s_w, 
                      GS_between=s_b)
  
  return(list.output)  
}

