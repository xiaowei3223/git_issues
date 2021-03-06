#############################################################################
# title: basic_info
# target: 用来获取特定数据库中groups、timepoints、geneID_type、weights的最小值和最大值 
# input: 用户设定的数据库名称
# output: list。包含groups、timepoints、geneID_type、weights的最小值和最大值 
# author: xiaowei
# time: August 8, 2021
#############################################################################
basic_info <- function(userdb){
  suppressPackageStartupMessages(library(dplyr))
  suppressPackageStartupMessages(library(dbplyr))
  
  # 连接数据库
  source("Functions/connect_userdb.R")
  rel.db <- connect_userdb(userdb)
  x <- list()
  # 获取所有groups
  x[["groups"]] <- tbl(rel.db, "design") %>% pull(group) %>% unique()
  # 获取所有时间点
  x[["timepoints"]] <- tbl(rel.db, "design") %>% pull(timepoint) %>% unique() %>% sort()
  # 获取exprs、edges、nodes基因ID的类型
  x[["geneID_type"]] <- tbl(rel.db, "geneID_type") %>% pull(type)  
  # 获取weight的最小值和最大值
  # 最小值
  x[["weights"]][1] <- tbl(rel.db, "edges") %>% pull(weight) %>% min()
  # 最大值
  x[["weights"]][2] <- tbl(rel.db, "edges") %>% pull(weight) %>% max()
  
  return(x)
}




# userdb = "copd.db"
# basic_info(userdb)
