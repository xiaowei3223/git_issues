function(input, output, session) {
 
  
  #######################################################
  # 4. 选项值更新（设置输入值的选择） Alluvial Diagram----------
  #######################################################
  observe({
    
	req(input$al_dbname)
    #4.1 获取用户指定的数据库的基本信息----
    userdb <- input$al_dbname #用户选择的数据库
    source("Functions/basic_info.R")
    basic_info <- basic_info(userdb)

    #4.2 设置组别选项,组别设置成可多选----
    group_choices <- basic_info$groups
    updateSelectInput(session, "al_groups", choices = group_choices, selected = group_choices[1])

  })
  
  
  #############################################################################
  # 7. alluvial 图
  #############################################################################
  # 获取alluvial图的绘制数据
  alluvial.data <- reactive({
    req(input$al_dbname)
    req(input$al_groups)
    
    source("Functions/get_alluvial.data.R")
    get_alluvial.data(dbname = input$al_dbname, groups = input$al_groups)
  })
  
  # alluvial 图
  output$alluvial_plot <- render_parcats({
    nodes <- alluvial.data()
    req(nodes)
    p = alluvial_wide(nodes, id = nodeName, max_variables = ncol(nodes))
    parcats(p, marginal_histograms = TRUE, data_input = nodes, arrangement = "freeform")
  })
  
}

