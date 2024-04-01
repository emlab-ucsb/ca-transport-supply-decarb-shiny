# user interface -----
ui <- ui <- navbarPage(
  
  title = " Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           "California has an ambitious goal to achieve carbon neutrality by 2045, yet it persists in the production of oil and gas, driven by its historical legacy as a significant petroleum producer. Senate Bill (SB) 1137 is a key piece of legislation that aims to regulate oil and gas infrastructure and reduce emissions. A provision in the law mandates a 3,200 foot minimum distance for new oil and gas structures from sensitive areas such as residential areas, schools, and healthcare facilities. The law was signed, but the oil industry successfully lobbied to move it to a referendum vote in November 2024. Now, the fate of SB 1137 depends on public approval, but there is a lack of data-driven analysis of the impacts of the proposed rule to inform the vote." # REPLACE THIS WITH CONTENT
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title =  "Explore the Data",
           
           "inputs and outputs will live here" # REPLACE THIS WITH CONTENT
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbarPage