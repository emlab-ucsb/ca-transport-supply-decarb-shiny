server <- function(input,output,session) {

  output$map1 <- renderLeaflet({
    wells_filtered <- wells[wells$WellStatus %in% input$well_types1,]
    
    output$well_map_output <- renderLeaflet({
      
      leaflet() %>% 
        addProviderTiles(providers$Esri.WorldImagery) %>% 
        
        setView(lng = 36.7783, lat = 119.4179) %>% 
        
        addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>% 
        
        addMarkers(data = wells_filtered(),
                   lng = wells_filtered()$longitude, lat = wells_filtered()$latitude,
                   popup = paste("Well Type:", wells_filtered()$WellStatus))
    })
  })
}



