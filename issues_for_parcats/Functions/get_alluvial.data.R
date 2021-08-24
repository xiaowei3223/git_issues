# dbname <- "my_data"
# groups <- "COPD_smoker"

get_alluvial.data <- function(dbname, groups){
  
  source("Functions/connect_userdb.R")
  dbcon <- connect_userdb(dbname)
  nodes <- tbl(dbcon, "nodes") %>% filter(group == groups) %>% select(nodeName, timepoint, module) %>%
    collect() %>% 
    as.data.frame() %>%
    distinct()
  
  timepoints <- sort(unique(nodes$timepoint))
  # 将数组转换成依据时间来分布的列
  nodes <- tidyr::spread(nodes, timepoint, module) %>% relocate(nodeName, all_of(timepoints))
  return(nodes)
}

