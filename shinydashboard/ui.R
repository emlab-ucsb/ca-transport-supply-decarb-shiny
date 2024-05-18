# -------------- dashboard header
header <- dashboardHeader(title = 'Impacts of Oil Wells in \nCalifornia',
                          titleWidth = 450) # END dashboardHeader

# -------------- dashboard sidebar
sidebar <- dashboardSidebar(# sideBar Menu----
                            sidebarMenu(
                              menuItem(
                                text = ' Welcome',
                                tabName = 'welcome',
                                icon = icon('star')
                              ),
                              menuItem(
                                text = 'About this App',
                                tabName = 'about',
                                icon = icon('circle-info')
                              ),
                              menuItem(
                                text = ' Why is this Important?',
                                tabName = 'why',
                                icon = icon('circle-question')
                              ),
                              menuItem(
                                text = 'Statewide Impacts of SB 1137',
                                tabName = 'impact',
                                icon = icon('magnifying-glass-chart')
                              ),
                              menuItem(
                                text = ' Oil Well Explorer',
                                tabName = 'explorer',
                                icon = icon('location-crosshairs')
                              )
                              
                            ))

# ................. dashboardBody
body <- dashboardBody(
                      # tab items ------------
                      tabItems(
                        # welcome tabItem ---
                        tabItem(tabName = 'welcome',
                                h1("Welcome to the Oil Well Impacts Dashboard", style = 'text-align: center;'),
                                h4("Senate Bill 1137 is an important piece of legislation that would prevent new oil 
                                   and gas wells from being constructed within 3,200 feet of hospitals, schools, dwellings, and 
                                   other kinds of sensitive locations in California. On this page, you can select a county of interest to get a sense of where the setback buffer would lie in your community, 
                                   as well as seeing where active wells may be located around you.")
                                ),# END first tab item
                        
                        # About tabItem
                        tabItem(tabName = 'about', 
                                column(width = 10,
                                       box(width = NULL,"This shiny app was built, in part, to provide Californians a way of 
                                    visualizing the social and environmental impacts of Senate Bill 1137.
                                    California has an ambitious goal to achieve carbon neutrality by 2045,
                                    yet it persists in the production of oil and gas, driven by its historical 
                                    legacy as a significant petroleum producer. Senate Bill (SB) 1137 is a key piece
                                    of legislation that aims to regulate oil and gas infrastructure and reduce emissions.
                                    A provision in the law mandates a 3,200 foot minimum distance for new oil and gas
                                    structures from sensitive areas such as residential areas, schools, and healthcare 
                                    facilities. The law was signed, but the oil industry successfully lobbied to
                                    move it to a referendum vote in November 2024. Now, the fate of SB 1137 depends on
                                    public approval, but there is a lack of data-driven analysis of the impacts of the proposed rule to inform the vote."))),
                        
                        tabItem(tabName = 'explorer',
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
                                      multiple = FALSE),
                                    prettyCheckboxGroup(
                                      inputId = "well_types",
                                      label = tags$div(style = 'font-size: 20px;',
                                                       "Select well type:"),
                                      choices = unique(wells$WellStatus),
                                      selected = c("Active")),
                                    
                                    # box(width = 10,
                                    
                                      HTML("<div style =\"font-size: 14px;\"> Q : What's an active well? Definition of active oil well vs. non active and subcategories\n and public health exposure levels for pm25\n 
                                        <br><br>According to the California Public Utilities Commission,<strong> disadvantaged communities </strong> are areas in California that face economic,
                                        health, and environmental burdens. These burdens can include poverty, high unemployment, and air and water pollution. A Disadvantaged Community (DAC) in California can be 
                                        defined as a community with an annual median household income less than 80% of the state's annual median household income. <br><br>In 2012,  the US Environmental Protection
                                        Agency revised the nation's air quality standardss in which the annual PM 2.5 exposure is <strong> 12 micrograms per cubic meter (µg/m3)</strong>. </div>
                                        "
                                    )),
                                  # leaflet output
                                  column(
                                    width = 8,
                                    fluidPage(
                                      leafletOutput(outputId = 'map', height = "100vh") %>%
                                        withSpinner(type = 1, color = "#4287f5")
                                    )) # ---END fluidPage
                                  ) #-------END Column
                                ),
                        tabItem(tabName = 'impact',
                                fluidPage(
                                  
                                  
                                    
                                )# --- END fluidPage
                                
                                
                                
                                ) # ---- END impact tab
                        
                        )
                                
                        )


# ................. combining all in dashboardPage
ui <- dashboardPage(title = 'Oil Wells in California', header, sidebar, body, skin = 'green')


# make circle markers smaller
