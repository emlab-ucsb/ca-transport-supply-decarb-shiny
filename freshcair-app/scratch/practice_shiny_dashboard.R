#..................... SETUP ................


# load packages
library(tidyverse)
library(leaflet)


#............. PRACTICE VIZ ...................
leaflet() %>% 
  
  # add tiles
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  
  # setting view over California
  setView(lat = 36.778259, lng = -119.417931, zoom = 5) %>% 
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) %>% 
  
  # add markers
  addMarkers(data = )
