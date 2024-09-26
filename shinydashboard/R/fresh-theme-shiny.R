# load libraries ----
library(fresh)

# create theme ----
create_theme(
  
  # change "light-blue"/"primary" color
  adminlte_color(
    light_blue = "#003660" # dark blue
  ),
  
  # dashboardBody styling (includes boxes)
  adminlte_global(
    content_bg = "#DCE1E5" # blush pink
  ),

  # dashboardSidebar styling
  adminlte_sidebar(
    width = "400px", 
    dark_bg = "#DAE6E6", # light blue
    dark_hover_bg = "#9CBEBE", # magenta
    dark_color = "#011627" 
    # red
  ),

  
  output_file = "/capstone/freshcair/freshcair-shiny/shinydashboard/www/shinydashboard-fresh-theme.css" # generate css file & save to www/
)

