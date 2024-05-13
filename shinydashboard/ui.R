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
                                h1("Welcome to the Oil Well Impacts Dashboard"),
                                h4("Senate Bill 1137 is an important piece of legislation that would prevent new oil 
                                   and gas wells from being constructed within 3,200 feet of hospitals, schools, dwellings, and 
                                   other kinds of sensitive locations in California. On this page, you can enter your address or
                                   select your location to get a sense of where the setback buffer would lie in your community, 
                                   as well as seeing where active wells may be located around you.")),# END first tab item
                        
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
                                      label = "\nFind county in California: ",
                                      choices = unique(wells$CountyName),
                                      selected = c("Kern"),
                                      multiple = TRUE),
                                    pickerInput(
                                      inputId = "well_types",
                                      label = "Select Well Types:",
                                      choices = unique(wells$WellStatus),
                                      selected = c("Active"),
                                      multiple = TRUE),
                                    
                                    # box(width = 10,
                                    
                                        "Definition of active oil well vs. non active and subcategories\n and public health exposure levels for pm25"
                                    )),
                                  # leaflet output
                                  column(
                                    width = 8,
                                    fluidPage(
                                      leafletOutput(outputId = 'map', height = "100vh") %>%
                                        withSpinner(type = 1, color = "#4287f5")
                                    ) # ---END fluidPage
                                  ) #-------END Column
                                ))
                                
                        ))


# ................. combining all in dashboardPage
ui <- dashboardPage(title = 'Oil Wells in California', header, sidebar, body, skin = 'green')


# make circle markers smaller
