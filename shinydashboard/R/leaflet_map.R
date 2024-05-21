leaflet_map <- function(input){
  
  county_picker <- reactive({
    wells %>% filter(CountyName %in% input$county_name) %>%
      filter(WellStatus %in% input$well_types)
  })
  
  renderLeaflet({
    pal <- colorFactor(c("#8B0000", "gray"), domain = c("Active", "Not Active"))
    # initiate map
    basemap <- leaflet() %>%
      addProviderTiles(providers$Esri.WorldStreetMap) %>%
      setView(lat = 37.568784,lng =  -120.464724, zoom = 7) %>%
      addCircleMarkers(data = county_picker(), radius = 0.55,    
                       color = ~pal(WellStatus),
                       fillOpacity = 0.7,
                       clusterOptions = markerClusterOptions()) %>%
      addPolygons(data = ca_counties, color = 'black',weight = 1,
                  popup = ~ paste0(
                    "<strong>Average yearly values from 2019-2024</strong><br>",
                    "County: ",CountyName,"<br>",
                    "PM2.5: ", round(pm25, 4), " μg/m³", "<br>",
                    "Percent of Disadvantaged Census Tracts: ", round(dac, 2),"%", "<br>",
                    "Population: ", formatC(round(pop, 0), big.mark = ",", format = "d") # Add commas to population
                  )) %>%
      
      addPolygons(data = buffer_3200, color = 'cornflowerblue') 

    # Create a custom legend
    legend_html <- sprintf(
      "<div style='background-color: white; padding: 10px; border-radius: 5px;'>
          <div style='display: flex; align-items: center; margin-bottom: 5px;'>
            <div style='width: 20px; height: 20px; background-color: cornflowerblue; margin-right: 5px;'></div>
            <span>3200 foot buffer surrounding sensitive areas</span>
          </div>
        </div>"
    )
    
    basemap <- addControl(map = basemap, html = legend_html, position = "topright")
    
    
    
  }) # END render Leaflet
  
}
