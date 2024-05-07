library(shiny)
library(shinyWidgets)
library(tidyverse)
library(showtext)
library(sysfonts)
library(ggplot2)
library(shiny)
library(shinydashboard)
library(leaflet)
library(shinycssloaders)
library(sf)
library(rgdal)
library(tigris)


# reading in the data 
ca_crs <- 4326

wells <- sf::st_read(here::here("shinydashboard/data/proprietary/AllWells_gis/Wells_All.shp")) %>%
  st_transform(ca_crs) %>%
  unique() %>%
  mutate(WellStatus = case_when(
    WellStatus %in% c("Active", "New") ~ "Active",
    WellStatus %in% c("PluggedOnly","Plugged") ~ "Plugged",
    WellStatus %in% c("Abeyance") ~ "Idle",
    TRUE ~ WellStatus
  ))


ca_counties <- counties(state = "CA", cb = TRUE, resolution = "500k") %>% 
  st_transform(ca_crs) %>%
  rename(CountyName = NAME) %>%
  select(-STATEFP, -COUNTYFP, -COUNTYNS, -AFFGEOID, -GEOID, -NAMELSAD, -STUSPS, -STATE_NAME, -LSAD, -ALAND, -AWATER)

ca_counties_sf <- st_as_sf(ca_counties)
ca_counties_df <- as.data.frame(ca_counties_sf)
wells_sf <- st_as_sf(wells)
wells_df <- as.data.frame(wells_sf)

data_coordinates2 <- st_coordinates(ca_counties)

ca_counties$longitude <- data_coordinates2[,1]
ca_counties$latitude <- data_coordinates2[,2]
# Assuming CountyName is a common attribute in both data frames
a <- left_join(wells_df, ca_counties_df, by = "CountyName")

a_new <- a %>% 
  select(-geometry.x) %>% 
  rename(geometry = geometry.y) %>% 
  rename(longitude = Longitude) %>% 
  rename(latitude = Latitude)

a_new_sf <- st_as_sf(a_new)

wells_sf_orange <- wells_sf %>% 
  filter(CountyName == 'Orange') %>% 
  filter(WellStatus == 'Active')

orange_county <- ca_counties %>% 
  filter(CountyName == 'Orange')
#-----  leaflet map

leaflet() %>%
  addProviderTiles(providers$Esri.WorldTerrain, group = 'ESRI Terrain',
                   options = providerTileOptions(maxZoom = 100)) %>% 
  setView(lat = 37.568784,lng =  -120.464724, zoom = 6) %>% 
  addCircleMarkers(data = wells_sf_orange, radius = 0.75) %>% # wells_sf_orange is a point object 
  addPolygons(data = orange_county ,fill = 'blue') %>%  # addPolygons has to be a sfc Multipolygon object. 
  addPolygons(data = ca_counties, color = 'cornflowerblue')
