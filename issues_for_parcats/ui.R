
# #Interface for alluvial_diagram
source("UI/alluvial_diagram_for_UI.R")


#The whole web interface
navbarPage(title = "Time-Course DB Query",
           tabPanel("Alluvial Diagram"
                    ,alluvial_diagram_UI
                    )
           
)


