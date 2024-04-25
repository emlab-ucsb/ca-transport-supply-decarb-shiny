# active_data <- reactive({
#   wells %>% 
#     filter(WellStatus == 'Active')
# })
# 
# canceled_data <- reactive({
#   wells %>% 
#     filter(WellStatus == 'Canceled')
# })
# 
# idle_data <- reactive({
#   wells %>% 
#     filter(WellStatus == c('Idle','Abeyance'))
# })
# 
# plugged_data <- reactive({
#   wells %>% 
#     filter(WellStatus == c('Plugged',"PluggedOnly"))
# })
# 
# unknown_data <- reactive({
#   wells %>% 
#     filter(WellStatus == c('Unknown'))
# })
# 
# 
#   renderLeaflet({
#   
#   # initiate map 
#   basemap <- leaflet() %>% 
#     
#     
#     # adding tiles 
#     addProviderTiles(providers$Esri.WorldTerrain, group = 'ESRI Terrain',
#                      options = providerTileOptions(maxZoom = 100)) %>% 
#     
#     # adding mini map 
#     addMiniMap(toggleDisplay = TRUE) %>% 
#     
#     # setting view over california 
#     setView(lat = 37.568784,lng =  -120.464724, zoom = 5) %>% 
#     
#     addMarkers(data = active_data(),
#                lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#     
#     addMarkers(data = canceled_data(),
#                lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#     
#     addMarkers(data = idle_data(),
#                lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#     
#     addMarkers(data = plugged_data(),
#                lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#     
#     addMarkers(data = unknown_data(),
#                lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#     
#     addLegend(colors = c("#0b3142",
#                                   "#FFE900",
#                                   '#5B2333',
#                                   "#EF233C",
#                                   "#103900"),
#                                   labels = c("Active Wells",
#                                              "Canceled Wells",
#                                              "Idle Wells",
#                                              "Plugged Wells",
#                                              "Unknown Wells"),
#               position = 'bottomleft')
# })
#   
#   
#   
#   
#   
#   
#   #############
#   leaflet_map <- function(input){
#     
#     # filtering by well type
#     active_data <- reactive({
#       wells %>% 
#         filter(WellStatus == 'Active')
#     })
#     
#     canceled_data <- reactive({
#       wells %>% 
#         filter(WellStatus %in% input$well_types) %>% 
#         filter(WellStatus == 'Canceled')
#     })
#     
#     idle_data <- reactive({
#       wells %>% 
#         filter(WellStatus == c('Idle','Abeyance'))
#     })
#     
#     plugged_data <- reactive({
#       wells %>% 
#         filter(WellStatus == c('Plugged',"PluggedOnly"))
#     })
#     
#     unknown_data <- reactive({
#       wells %>% 
#         filter(WellStatus == c('Unknown'))
#     })
#     
#     
#     renderLeaflet({
#       
#       # initiate map 
#       basemap <- leaflet() %>% 
#         
#         
#         # adding tiles 
#         addProviderTiles(providers$Esri.WorldTerrain, group = 'ESRI Terrain',
#                          options = providerTileOptions(maxZoom = 100)) %>% 
#         
#         # adding mini map 
#         addMiniMap(toggleDisplay = TRUE) %>% 
#         
#         # setting view over california 
#         setView(lat = 37.568784,lng =  -120.464724, zoom = 5) %>% 
#         
#         addMarkers(data = active_data(),
#                    lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#         
#         addMarkers(data = canceled_data(),
#                    lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#         
#         addMarkers(data = idle_data(),
#                    lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#         
#         addMarkers(data = plugged_data(),
#                    lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#         
#         addMarkers(data = unknown_data(),
#                    lng = ~jitter(longitude, factor = 0.01), lat = ~jitter(latitude, factor = 0.01)) %>% 
#         
#         addLegend(colors = c("#0b3142",
#                                       "#FFE900",
#                                       '#5B2333',
#                                       "#EF233C",
#                                       "#103900"),
#                                       labels = c("Active Wells",
#                                                  "Canceled Wells",
#                                                  "Idle Wells",
#                                                  "Plugged Wells",
#                                                  "Unknown Wells"),
#                   position = 'bottomleft') 
#       
#       
#       
#       return(basemap)  
#       
#     }) # END render Leaflet 
#     
#     
#     
#     
#     
#     
#   } # END leaflet function