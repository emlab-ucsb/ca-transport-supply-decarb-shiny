# user interface -----
ui <- ui <- navbarPage(
  
  title = "Impact of SB 1137",
  
  # (Page 1) intro tabPanel ----
  tabPanel(title = "About this App",
           
           fluidRow(
             column(1),
             column(10,
                    tags$h1("Data Explorer!"),
                    tags$br(),
                    tags$h4("Why did we build this app?"),
                    tags$p("This shiny app was built, in part, to provide Californians a way of visualizing the social and environmental impacts of Senate Bill 1137. California has an ambitious goal to achieve carbon neutrality by 2045, yet it persists in the production of oil and gas, driven by its historical legacy as a significant petroleum producer. Senate Bill (SB) 1137 is a key piece of legislation that aims to regulate oil and gas infrastructure and reduce emissions. A provision in the law mandates a 3,200 foot minimum distance for new oil and gas structures from sensitive areas such as residential areas, schools, and healthcare facilities. The law was signed, but the oil industry successfully lobbied to move it to a referendum vote in November 2024. Now, the fate of SB 1137 depends on public approval, but there is a lack of data-driven analysis of the impacts of the proposed rule to inform the vote."),
                    tags$br(),
                    tags$h4("Where's the data?"),
                    tags$p("Most of the data used in this project is publicly available via the",
                           tags$strong("emLab's GitHub repository and Zenodo files"), tags$a(href = 'https://zenodo.org/records/7742803'))
             ),
             column(1)
           ), # END fluidRow
           
           hr()
  ),
  # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title =  "Explore the Data",
           
           # sidebar Layout
           sidebarLayout(
             
             # sidebar panel
             sidebarPanel(
               
               # well type input
               pickerInput(inputId = 'well_type_input', label = 'Select well type(s):',
                           choices = c('Idle', 'Active','Abandoned'),
                           selected = c('Active'),
                           options = pickerOptions(actionsBox = TRUE),
                           multiple = TRUE),
               
               # slider input for distance from well (1,000 ft; 2,500 ft; 3,200 ft; 1 mile)
               sliderInput(inputId = 'distance', label = 'Select distance (feet)',
                           value = 2500, max = 5280, min = 1000)
               
             ),
             # mainPanel
             mainPanel(
               plotOutput(outputId = 'map')
             )
           )
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbarPage