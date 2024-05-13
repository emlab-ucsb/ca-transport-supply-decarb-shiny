# # load libraries ---
# library(shiny)
# library(shinyWidgets)
# library(tidyverse)
# library(showtext)
# library(sysfonts)
# library(ggplot2)
# library(shiny)
# library(shinydashboard)
# library(leaflet)
# library(shinycssloaders)
# library(sf)
# library(tigris)
# library(dplyr)
# #library(geoloc)
# # GGPLOT THEME -----------------
# 
# font_add_google(name = 'Nunito', family = 'nunito')
# font_add_google(name = 'Mulish', family = 'mulish')
# font_add_google(name = 'Catamaran', family = 'catamaran')
# myCustomTheme <- function(){
#   theme(axis.text = element_text(family = 'mulish', size = 12),
#         plot.title = element_text(family = 'mulish', size = 16))}
# 
# 
# # reading in the data 
# ca_crs <- 4326
# 
# wells <- sf::st_read("/Users/haejinkim/Documents/freshcair-shiny/shinydashboard/data/proprietary/AllWells_gis/Wells_All.shp") %>%
#   st_transform(ca_crs) %>%
#   dplyr::select(API, WellStatus, FieldName, CountyName) %>%
#   unique() %>%
#   mutate(WellStatus = case_when(
#     WellStatus %in% c("Active", "New") ~ "Active",
#     WellStatus %in% c("PluggedOnly","Plugged") ~ "Plugged",
#     WellStatus %in% c("Abeyance") ~ "Idle",
#     TRUE ~ WellStatus
#   )) %>%
#   ungroup()
# 
# #ca_counties <- counties(state = "CA", cb = TRUE, resolution = "500k") %>% 
# #  st_transform(ca_crs) %>%
# #  rename(CountyName = NAME) %>%
# #  select(-STATEFP, -COUNTYFP, -COUNTYNS, -AFFGEOID, -GEOID, -NAMELSAD, -STUSPS, -STATE_NAME, -LSAD, -ALAND, -AWATER)
# 
# # ca_counties_sf <- st_as_sf(ca_counties)
# # ca_counties_df <- as.data.frame(ca_counties_sf)
# # wells_sf <- st_as_sf(wells)
# # wells_df <- as.data.frame(wells_sf)
# # # Assuming CountyName is a common attribute in both data frames
# # a <- left_join(wells_df, ca_counties_df, by = "CountyName")
# # 
# # select(-geometry.x)
# # well_data <- a %>% 
# #   select(API:geometry.x) %>% 
# #   rename(geometry = geometry.x)
# # 
# # county_data <- a %>% 
# #   select(-geometry.x) %>% 
# #   rename(geometry = geometry.y)
# # 
# # well_sf_comp <- st_as_sf(well_data)
# # 
# # county_sf_comp <- st_as_sf(county_data)
# data_coordinates <- st_coordinates(wells)
# 
# wells$longitude <- data_coordinates[,1]
# wells$latitude <- data_coordinates[,2]
# 
