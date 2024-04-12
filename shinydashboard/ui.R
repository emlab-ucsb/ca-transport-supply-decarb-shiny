#........................dashboardHeader.........................
header <- dashboardHeader(
  
  # title ----
  title = "Environmental and Social Impacts of Regulation on Oil Wells ",
  titleWidth = 400
  
) # END dashboardHeader

#........................dashboardSidebar........................
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

#..........................dashboardBody.........................
body <- dashboardBody()

#..................combine all in dashboardPage..................
dashboardPage(header, sidebar, body)