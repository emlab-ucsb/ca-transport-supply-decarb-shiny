leaflet_map <- function(input){

# filtering by well type

  
  wells_picker <- reactive({
    wells %>% 
      filter(WellStatus %in% input$well_types)
  }) 
  
  
  renderLeaflet({
    
    # initiate map 
    basemap <- leaflet() %>% 
      
      
      # adding tiles 
      addProviderTiles(providers$Esri.WorldTerrain, group = 'ESRI Terrain',
                  options = providerTileOptions(maxZoom = 100)) %>% 
      # 
      # # adding mini map
       addMiniMap(toggleDisplay = TRUE) %>%
      # 
      # # setting view over california
       setView(lat = 37.568784,lng =  -120.464724, zoom = 5) %>%
      # 
      addCircleMarkers(data = wells_picker(),
                       lng = ~longitude, lat = ~latitude)


    
  }) # END render Leaflet
  

    

  
 # END leaflet function
}

