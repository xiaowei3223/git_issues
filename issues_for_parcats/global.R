#################################################
# 在这个文件的所有变量，都能用于server.R和ui.R
#################################################
library(shiny) #shiny包必用
library(tidyverse) #使用read_csv来读取文件
library(dplyr) #用于数据库查询操作和数据的整理
library(easyalluvial) # 用于alluvial作图的
library(parcats) # 用于alluvial作图的

# 默认情况下，shiny只允许上传的文件不超过5MB
# 如果需要更改shiny上传文件的大小限制，使用shiny.maxRequestSize option. 
# options(shiny.maxRequestSize = 30*1024^2)
# 表示允许上传的文件不超过30MB
options(shiny.maxRequestSize = 500*1024^2)


# 获取所有数据库的名称，如果上传新的数据后，将会更新这个变量。更新这个变量使用<<- 来赋予全局变量的
all_db_names <- unlist(strsplit(list.files("data/databases/user_data/"), ".sqlite"))