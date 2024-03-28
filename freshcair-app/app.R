# load packages ----
library(shiny)

# user interface ----
ui <- fluidPage(
  # app title-----
  tags$h1('The Effects of Increasing a Well Setback Distance'),
  
  # app subtitle---
  h4(strong('Visualizing the Impacts of SB 1137'))
)

# server instructions ----
server <- function(input, output) {}

# combine UI & server into an app ----
shinyApp(ui = ui, server = server)
