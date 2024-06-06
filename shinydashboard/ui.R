# -------------- dashboard header
header <- dashboardHeader(title = 'Impacts of Oil Wells in \nCalifornia',
                          tags$li(a(href = 'https://www.2035initiative.com/',
                                              img(src = '2035-logo.png',
                                                  title = "Company Home", height = "30px"),
                                              style = "padding-top:10px; padding-bottom:10px;"),
                                            class = "dropdown"),
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
    tabItem(tabName = 'about',
            fluidRow(
              h1('Introduction', style = 'text-align: center;'),
              tags$head(
                tags$style(
                  HTML(".content { font-size: 20px; padding: 0 20px; }")
                )
              ),
              div(class = "content",
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
              )
            ),
            fluidRow(
              column(12, align = "center",
                     img(src = "oilwell.jpg", height = 300),
                     div(style = "text-align: center; font-size: 10px; margin-top: 10px;",
                         "PBS SoCal"
                     )
              )
            ),
            fluidRow(
              h1("Why is this Important?", style = 'text-align:center;'),
              tags$head(
                tags$style(
                  HTML(".content { font-size: 20px; padding: 0 20px; }")
                )
              ),
              div(class = 'content',
                  HTML("SB 1137 is a step towards preventing further harm on disadvantaged communities. Research in environmental justice has concluded time and time
             again that pollution and public health hazards have disproportionately affected Black, Brown, indigenous, and poor communities (Donaghy 2023). Stationary sources of
             harmful air pollution, like oil wells, have increased harmful exposure to chemicals linked to fossil fuel activity and has in turn, led to premature deaths, reportings of asthma and 
             exacerbations of existing respiratory conditions, as well as preterm birth. Disadvantaged communities throughout the US continue to face the unequal distribution of the 
             harmful effects associated with well activity. This is what is known as <strong>fossil fuel racism</strong>, the disproportionate effects  of 
             climate change, fossil fuel extraction, transportation, processing, and consumption on Black, Brown, Indigenous and poor populations.
                       Neighborhood oil has been proven to be harmful towards communities nearby because oil well operations rely on the use of harmful chemicals for
                       oil extraction. They release harmful chemicals like Volatile Organic Compounds, rely on hundreds of chemicals to extract fossil fuels and maintain well
                       sites, including many known to cause hormone disruption, reproductive and developmental harm, as well as increase one's risk to cancer. A study in Science Advances
                       found that long term exposure to one additional unit of Particulate Matter 2.5 (PM 2.5) increases the risk of death from COVID-19 by <strong> 11% </strong>.")
              )
            )
    ),
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
                                        Agency revised the nation's air quality standards in which the annual PM 2.5 exposure is <strong> 12 micrograms per cubic meter (µg/m3)</strong>. <br><br>Although non-active wells are currently not producing any oil, its existence still carries an impact on its surroundings They can leak oil, gas, and other toxic chemicals into surrounding air, soil or groundwater (Cox III et al. 2023). Non active wells pose as a threat to surrounding air and water quality as they remain open holes left unattended. <strong> Orphaned wells </strong>, wells that are no longer producing and have no owner, pose serious environmental risks as they can leak oil and other pollutants, causing air and water contamination if left unsealed.</div>
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
                                      
                                      h2("Research Methods and Findings "),
                                      h3("How the Setback Impacts the Number of New Wells"),
                                      fluidRow(column(
                                        12,
                                        align = "left",
                                        HTML(
                                          "
                 <div style='border: 1px solid #ddd; padding: 10px;'>
                   <p>The introduction of setbacks, specifically the 3,200-foot setback mandated by Senate Bill 1137, significantly influences the number of new oil wells predicted in California. Setbacks are regulatory distances that prevent the drilling of new oil wells near sensitive areas such as schools, hospitals, and residential communities. This policy aims to reduce the harmful health and environmental effects associated with oil and gas extraction, especially in disadvantaged communities.
<br><br>    To understand the impact of setbacks on new well predictions, the setback distances were incorporated into predictive models for well entry and exit. The setback effectively reduces the number of viable locations where new wells can be drilled. Consequently, this results in a decline in the number of new wells projected over time. By implementing the setback, the model forecasts fewer new wells because the restricted areas encompass significant portions of potential drilling sites. Note that the model assumes that wells are equally likely to be drilled at any point within an oil field.
<br><br>    Historical data and spatial analysis were examined to map out the regions affected by the setback distances. The analysis revealed that the 3,200-foot setback covers many areas previously available for drilling. By overlaying this spatial data with historical well locations, the impact of the setback on future drilling activities was simulated. The predictive models, adjusted to account for these new restrictions, consistently showed a decrease in the number of new wells over the forecast period from 2020 to 2045.
<br><br>    This reduction is particularly pronounced in urban and suburban regions where sensitive receptors are more densely located. The setback policy not only reduces the number of new wells but also has broader implications for environmental justice, as it helps to mitigate the adverse health impacts on communities living near oil extraction sites.
.</p>

                 </div>
               "
                                        )
                                      )),
                                      h3("Machine Learning Development"),
                                      fluidRow(column(
                                        12,
                                        align = 'left',
                                        HTML(
                                          "
                      <div style='border: 1px solid #ddd; padding: 10px;'>
                   <p> Machine learning played a crucial role in enhancing the predictive accuracy of oil well operations and outcomes. Traditional methods, like Poisson regression, were initially used to estimate the number of new and exiting wells. However, 
                                          these methods have limitations, especially in capturing complex, nonlinear relationships in the data. 
                                          To overcome these limitations, machine learning models, specifically Random Forest regression,
                                          were developed to provide more robust predictions. 
                                          <br><br> <strong> Data Collection and Preparation: </strong> The models were trained on historical data from 1977 to 2019, which included features such as oil prices, capital expenditures (CapEx), operational expenditures (OpEx), depletion rates, and field-specific information. 
                                          The historical Brent oil prices were adjusted to present dollar terms to ensure consistency in the data. 
                                          <br><br> <strong> Model Selection: </strong> Random Forest regression was chosen due to its ability to handle complex interactions and nonlinearities in the data. 
                                          This ensemble learning method aggregates the predictions from multiple decision trees,
                                          reducing the risk of overfitting and improving generalization.
                                          <br><br> <strong> Model Training: </strong> The Random Forest model was trained with 500 trees and 4 randomly selected features at each split (mtry = 4).
                                          The training process involved using the historical data to learn patterns and relationships between 
                                          the input features and the target variable (number of new wells). The model's performance was evaluated using metrics
                                          like Root Mean Squared Error (RMSE), which measures the average magnitude of the prediction errors.

</p> </div>"
                                        )
                                      ))
                                      
                                      
                                      
                                      
                                      
                                      ,
                                      fluidRow(
                                        column(12, align = 'center', img(src = 'pred-wells.png', height = 'auto', width = "80%")
                                          
                                        )
                                      ),
                                      fluidRow(
                                        column(12,
                                               align = 'left',
                                               HTML(" <div style='border: 1px solid #ddd; padding: 10px;'>
                                                                <p> 
                                                               <br> <strong> Comparison with Poisson Models: </strong>The Random Forest model demonstrated superior predictive
                                                               power compared to the Poisson model. It captured larger shifts and trends in the number of new wells, reflecting the
                                                               dynamic nature of the oil industry. This was evident in the model's ability to accurately predict new well counts during
                                                               periods of significant changes in oil prices and operational costs. 
                                                    <br> <strong> Implementation: </strong> The trained Random Forest model was integrated into the existing workflow to predict the number of
                                                    new and exiting wells under various scenarios, including the implementation of the 3,200-foot setback. The model provided more nuanced and accurate projections, 
                                                    offering better insights into the long-term impacts of the setback policy on oil production and associated environmental and economic outcomes. <br><br>
 </p> </div>"                                                                                                     ))),
                                      fluidRow(
                                        column(12, align = 'center', img(src = 'oil-well-comp.png', height = 'auto', width = '80%'))
                                      ),
                                      fluidRow(
                                        column(12,
                                               align = 'left',
                                               HTML(" <div style='border: 1px solid #ddd; padding: 10px;'>
                                                                <p> 
                                                              	This figure shows the predictions of total new wells by Random Forest and Poisson models compared to the actual historical data from 1977 to 2019. The Random Forest model, which was trained with 500 trees and 4 randomly selected features at each split (mtry = 4), captures larger shifts and trends than the Poisson model, which is more conservative and does not fluctuate as much as the Random Forest. The ensemble nature of the Random Forest model allows it to capture complex nonlinear relationships between the predictor variables and the response, making it a powerful tool for modeling well entries. The Poisson model provides more conservative estimates, reflecting its tendency to predict fewer new wells overall, and often underestimated the peaks seen in the true data. This comparison highlights the strengths 
                                                              	and limitations of each modeling approach in capturing the dynamics of well entries over time. <br> <br>
 </p> </div>"                                                                                                     ))),
                                      fluidRow(
                                        column(12,
                                               align = 'center',img(src = 'oil-well-prod.png', height = 'auto',width = '80%'))
                                      ),
                                      fluidRow(
                                        column(12,
                                               align = 'left',
                                               HTML(" <div style='border: 1px solid #ddd; padding: 10px;'>
                                                                <p> 
                                                              	This plot compares the predictive power of the Poisson and Random Forest models under two policy scenarios: no setback and a 3,200 foot setback on new wells. The production for the Random Forest model is slightly lower after about 2028 because it predicts fewer new wells starting around this time, and also more well exits over the entire forecasted period. This suggests that the Random Forest model may be more sensitive to changes in the input features over time, capturing the combined effect of reduced new well development and increased well abandonment on total production. The Poisson model, on the other hand, shows a more gradual decline in production, likely due to its more conservative estimates of new well entries and exits. The impact of the 3,200 foot setback is more pronounced in the Random Forest model, as the gap between the two scenarios is larger compared to the Poisson model. 

 </p> </div>"                                                                                                     )))
                                    )
                                  )
      
                                ) # ------ END fluidPage
                                
                                ), # -----------------------------------END methods tabItem
                        tabItem(
                          tabName = 'impact',
                                fluidPage(
                                  tags$style(
                                    HTML("
        .custom-fluid-row {
          margin-top: 50px; /* Adjust the value as needed */
        }
      ")
                                  ),
                                  fluidRow(
                                    class = "custom-fluid-row",
                                    # static valueBox
                                    valueBox(paste0("$", 960, ' million'), "Avoided climate damage in million USD", icon = icon("smog"), color = 'lime'),
                                    valueBox(paste0("$", 660, ' million'), "Averted mortality cost in million USD", icon = icon("notes-medical"), color = 'maroon'),
                                    valueBox(paste0(200,"\nmillion"), "Reduced production in barrels of oil", icon = icon("oil-well"), color = 'aqua')
                                  ),
                                  fluidRow(
                                    column(12, align = 'center',
                                           HTML("
      <p style='font-size: 14px;'><em>Please note: these are estimated values for the years 2020 to 2045.</em></p>
    "))
                                  ),
                                  
                                  fluidRow(
                                    column(
                                      width = 12,
                                      align = 'center',
                                    
                                 h2("Results From our Analysis"))), # --- END h3 
                                 fluidRow(
                                   column(
                                     width = 12,
                                     align = "center",
                                     fluidRow(
                                       class = 'custom-fluid-row',
                                       column(6, align = "center", img(src = "dac-mort.png", height = "auto", width = "80%")),
                                       column(6, align = "left", 
                                              HTML("
                 <div style='border: 1px solid #ddd; padding: 10px;'>
                   <p>The three policies with greenhouse gas reduction targets for 2045 that are represented in the scatter plot show the potential health advantages for underprivileged areas.
                   When it comes to health benefits, the setback policy regularly outperforms the carbon and excise tax policies.
                   The 3,200-foot setback scenario has a significantly higher proportion of deaths that are saved, as indicated by the third gray dot from the left.
                   The setback policy's health advantages slowly start to decline and become more in line with tax policies as setback distances and reduction targets rise. 
                   This plot emphasizes how setback policies, particularly those with moderate distances and aims, could protect underprivileged neighborhoods.</p>

                 </div>
               "))
                                       ),
                                     
                                     fluidRow(
                                       class = 'custom-fluid-row',
                                       column(6, align = "center", img(src = "dac-emp.png", height = "auto", width = "80%")),
                                       column(6, align = 'left',
                                              HTML("
                                    <div style='border: 1px solid #ddd; padding: 10px;'>
                     <p>This plot shows the share of lost worker compensation experienced by disadvantaged communities (DACs) 
                     under different policy scenarios aimed at achieving 2045 greenhouse gas emission reduction targets.
                     The y-axis represents the share of lost worker compensation for DACs, and the x-axis indicates the stringency 
                     of the 2045 GHG emissions targets. DACs experience a consistently lower share of lost worker compensation under
                     setback policies compared to excise and carbon taxes. Notably, the third gray point from the left represents the
                     new 3,200 foot setback distance, where the share of lost worker compensation for DACs is lower than under other policies. 
                     DACs benefit from a lower share of economic impacts under setback policies.</p>

                 </div>
"))),
                                    fluidRow(
                                      class = 'custom-fluid-row',
                                      column(6, align = "center", img(src = "ca-oil-prod.png", height = "auto", width = "80%")),
                                     
                                    
                                      column(6, align = 'left',
                                             HTML("
                                      <div style='border: 1px solid #ddd; padding: 10px;'>
                     <p>The figure illustrates the projected impact of a 3,200 foot setback policy on California’s oil production compared to a business-as-usual (BAU) scenario. 
                     The setback line demonstrates the policy’s increasing effectiveness over time due to its cumulative effect on reducing the number of new wells drilled each year.
                     As fewer new wells are added annually under the setback scenario, the overall oil production decreases more significantly with each passing year compared to the BAU scenario.
                     This compounding effect highlights the long-term benefits of implementing a setback policy, as the reduction in new well drilling will lead to a decrease in oil production over 
                     the course of the forecasted period of 2020 to 2045. By visualizing these trajectories, policymakers and stakeholders can better understand the potential of setback policies to reduce 
                     oil production.
</p>

                 </div>              
                                                  
                                                  
                                                  ")))
                                    )
                                   )
                                 ) # --------END fluidrow
                                    
                                )# --- END fluidPage
                                
                                
                                
                                ) # ---- END impact tab
                        
                        
                      )                 
                        


# ................. combining all in dashboardPage
ui <- dashboardPage(title = 'Oil Wells in California', header, sidebar, body)


# make circle markers smaller
