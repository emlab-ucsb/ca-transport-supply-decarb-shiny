# -------------- dashboard header
header <- dashboardHeader(title = 'Impacts of Oil Wells in \nCalifornia',
                          titleWidth = 300) # END dashboardHeader

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
body <- dashboardBody(# tab items ------------
                      tabItems(
                        # welcome tabItem ---
                        tabItem(tabName = 'welcome',
                                h1("Welcome to the Oil Well Impacts Dashboard")),
                        # END first tab item
                        
                        # About tabItem
                        tabItem(tabName = 'about',
                                column(
                                  width = 10,
                                  box(
                                    width = NULL,
                                    "This shiny app was built, in part, to provide Californians a way of visualizing the social and environmental impacts of Senate Bill 1137. California has an ambitious goal to achieve carbon neutrality by 2045, yet it persists in the production of oil and gas, driven by its historical legacy as a significant petroleum producer. Senate Bill (SB) 1137 is a key piece of legislation that aims to regulate oil and gas infrastructure and reduce emissions. A provision in the law mandates a 3,200 foot minimum distance for new oil and gas structures from sensitive areas such as residential areas, schools, and healthcare facilities. The law was signed, but the oil industry successfully lobbied to move it to a referendum vote in November 2024. Now, the fate of SB 1137 depends on public approval, but there is a lack of data-driven analysis of the impacts of the proposed rule to inform the vote."
                                  )
                                )),
                        # end About
                        
                        # Why tabItem
                        tabItem(tabName = 'why',
                                # Add your content for the 'Why' tab here),
                                # end Why
                                
                                # Explorer tabItem
                                tabItem(tabName = 'explorer',
                                        fluidRow(
                                          column(
                                            width = 4,
                                            pickerInput(
                                              inputId = "well_types",
                                              label = "Select Well Types:",
                                              choices = unique(wells$WellStatus),
                                              selected = c("Active"),
                                              multiple = TRUE
                                            )
                                          ),
                                          # leaflet output
                                          column(
                                            width = 12,
                                            fluidPage(
                                              leafletOutput(outputId = 'well_map_output') %>%
                                                withSpinner(type = 1, color = "#4287f5"),
                                              sidebarPanel(
                                                "",
                                                textInput("zipcode", label = "Enter your zipcode.", value = 98125)
                                              ),
                                              h2("Where am I?"),
                                              tags$p("Click the button to get your location"),
                                              geoloc::button_geoloc("myBtn")
                                              
                                            )
                                          )
                                        )) # end Explorer
                        ) # end tabItems) # end dashboard body
                        
                        # ................. combining all in dashboardPage
                        ui <-
                          dashboardPage(title = 'Oil Wells in California', header, sidebar, body)
                        
                        
                        # make circle markers smaller
                        