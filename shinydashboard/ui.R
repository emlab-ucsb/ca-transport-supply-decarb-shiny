# -------------- dashboard header
header <- dashboardHeader(title = 'Impacts of Oil Wells in \nCalifornia',
                          titleWidth = 450) # END dashboardHeader

# -------------- dashboard sidebar
sidebar <- dashboardSidebar(
  fresh::use_theme('shinydashboard-fresh-theme.css'),
  sidebarMenu(
    menuItem(
      text = ' Oil Well Explorer',
      tabName = 'explorer',
      icon = icon('location-crosshairs')
    ),
    menuItem(
      text = ' About this App',
      tabName = 'about',
      icon = icon('circle-info')
    ),
    menuItem(
      text = ' Why is this Important?',
      tabName = 'why',
      icon = icon('circle-question')
    ),
    menuItem(
      text = ' Statewide Impacts of SB 1137',
      tabName = 'impact',
      icon = icon('magnifying-glass-chart')
    ),
    menuItem(
      text = ' Research Methods',
      tabName = 'methods',
      icon = icon('microscope')
    )
  )
)

# ................. dashboardBody
body <- dashboardBody(
  fresh::use_theme('shinydashboard-fresh-theme.css'),
                      # tab items ------------
                      tabItems(
                        # welcome tabItem ---
                        # tabItem(tabName = 'welcome',
                        #         h1("Welcome to the Oil Well Impacts Dashboard", style = 'text-align: center;'),
                        #         h4("Senate Bill 1137 is an important piece of legislation that would prevent new oil 
                        #            and gas wells from being constructed within 3,200 feet of hospitals, schools, dwellings, and 
                        #            other kinds of sensitive locations in California. On this page, you can select a county of interest to get a sense of where the setback buffer would lie in your community, 
                        #            as well as seeing where active wells may be located around you.")
                        #         ),# END first tab item
                        
                        # About tabItem
                        
                        tabItem(tabName = 'about',
                                column(width = 10,
                                       box(width = NULL,
                                           tags$head(
                                             tags$style(
                                               HTML(".box-body { font-size: 18px; }")
                                             )
                                           ),
                                           "This shiny app was built, in part, to provide Californians a way of
               visualizing the social and environmental impacts of Senate Bill 1137.
               
               California has an ambitious goal to achieve carbon neutrality by 2045,
               yet it persists in the production of oil and gas, driven by its historical
               legacy as a significant petroleum producer. Senate Bill (SB) 1137 is a key piece
               of legislation that aims to regulate oil and gas infrastructure and reduce emissions.
               
               A provision in the law mandates a 3,200 foot minimum distance for new oil and gas
               structures from sensitive areas such as residential areas, schools, and healthcare
               facilities. The law was signed, but the oil industry successfully lobbied to
               move it to a referendum vote in November 2024. Now, the fate of SB 1137 depends on
               public approval, but there is a lack of data-driven analysis of the impacts of the proposed rule to inform the vote."
                                       ))
                        )
                      ,
                        
                        tabItem(
                          tabName = 'explorer',
                          fluidRow(
                            style = 'margin-left: 50px; margin-right: 50px;', # Add margins to create space
                            h1("Welcome to the Oil Well Impacts Dashboard", style = 'text-align: center;'),
                            h4("Senate Bill 1137 is an important piece of legislation that would prevent new oil and gas wells from being constructed within 3,200 feet of hospitals, schools, dwellings, and other kinds of sensitive locations in California. On this page, you can select a county of interest to get a sense of where the setback buffer would lie in your community, as well as seeing where active wells may be located around you.", 
                               style = 'text-align: justify; line-height:1.5; font-size:20px;')),
                          fluidRow(
                                  column(
                                    width = 4,
                                    box(width = NULL,
                                      pickerInput(
                                      inputId = "county_name",
                                      label = tags$div(style = 'font-size: 20px;',
                                                       "\nFind county in California: "),
                                      choices = unique(wells$CountyName),
                                       selected = c("Kern")),
                                      multiple = FALSE,
                                    prettyCheckboxGroup(
                                      inputId = "well_types",
                                      label = tags$div(style = 'font-size: 20px;',
                                                       "Select well type:"),
                                      choices = unique(wells$WellStatus),
                                      selected = c("Active"))),
                                    
                                    # box(width = 10,
                                    
                                      HTML("<div style =\"font-size: 20px;\"> <strong> Q </strong> : What's an active well? An <strong> active </strong> well is an oil well with continuous oil extraction. Whereas a non-active oil well includes wells that have not been extracting oil for more than six months.  
                                        <br><br>According to the California Public Utilities Commission,<strong> disadvantaged communities </strong> are areas in California that face economic,
                                        health, and environmental burdens. These burdens can include poverty, high unemployment, and air and water pollution. A Disadvantaged Community (DAC) in California can be 
                                        defined as a community with an annual median household income less than 80% of the state's annual median household income. <br><br>In 2012,  the US Environmental Protection
                                        Agency revised the nation's air quality standards in which the annual PM 2.5 exposure is <strong> 12 micrograms per cubic meter (µg/m3)</strong>. </div>
                                        "
                                    )),
                                  # leaflet output
                                  column(
                                    width = 8,
                                    fluidPage(
                                      leafletOutput(outputId = 'map', height = "100vh") %>%
                                        withSpinner(type = 6, color = "#4287f5")
                                    ))) # ---END fluidPage
                                  ) #-------END Column
                                ,
                        tabItem(tabName = 'methods',
                                fluidPage(
                                  fluidRow(
                                    column(
                                      width = 12,
                                      align = 'center',
                                      
                                      h3("Research Methods and Findings "),
                                      fluidRow(
                                        column(6, align = 'center', img(src = 'pred_actual_new_wells_yoy.png', height = 'auto', width = "80%")
                                          
                                        )
                                      )
                                    )
                                  )
                                  
                                  
                                  
                                  
                                  
                                ) # ------ END fluidPage
                                
                                ), # -----------END methods tabItem
                        tabItem(tabName = 'impact',
                                fluidPage(
                                  fluidRow(
                                    # static valueBox
                                    valueBox(paste0("$", 960, ' million USD'), "Avoided climate damage in million USD", icon = icon("smog"), color = 'lime'),
                                    valueBox(paste0("$", 660, ' million USD'), "Averted mortality cost in million USD", icon = icon("notes-medical"), color = 'maroon'),
                                    valueBox(paste0(200,"\nmillion"), "Reduced production in barrels of oil", icon = icon("oil-well"), color = 'aqua')
                                  ),
                                  
                                  fluidRow(
                                    column(
                                      width = 12,
                                      align = 'center',
                                    
                                 h3("Results From our Analysis"))), # --- END h3 
                                 fluidRow(
                                   column(
                                     width = 12,
                                     align = "center",
                                     fluidRow(
                                       column(6, align = "center", img(src = "mortality_plot.png", height = "auto", width = "80%"))),
                                     
                                     fluidRow(
                                       column(6, align = "center", img(src = "compensation_plot.png", height = "auto", width = "80%")),
                                       column(6, align = "center", img(src = "production_plot.png", height = "auto", width = "80%"))
                                     )
                                   )
                                 ) # --------END fluidrow
                                    
                                )# --- END fluidPage
                                
                                
                                
                                ) # ---- END impact tab
                        
                        
                      ))                       
                        


# ................. combining all in dashboardPage
ui <- dashboardPage(title = 'Oil Wells in California', header, sidebar, body)


# make circle markers smaller
