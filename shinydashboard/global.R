# load libraries ---
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
library(tigris)
library(dplyr)
library(htmltools)
library(leafpop)
library(glue)
library(fresh)
library(bslib)
library(here)
#library(geoloc)
# GGPLOT THEME -----------------

font_add_google(name = 'Nunito', family = 'nunito')
font_add_google(name = 'Mulish', family = 'mulish')
font_add_google(name = 'Catamaran', family = 'catamaran')
myCustomTheme <- function(){
  theme(axis.text = element_text(family = 'mulish', size = 12),
        plot.title = element_text(family = 'mulish', size = 16))}


# reading in the data 
ca_crs <- 4326

wells <- sf::st_read('/capstone/freshcair/freshcair-shiny/shinydashboard/data/proprietary/AllWells_gis/Wells_All.shp') %>%
  st_transform(ca_crs) %>%
  dplyr::select(API, WellStatus, FieldName, CountyName) %>%
  unique() %>%
  mutate(WellStatus = case_when(
    WellStatus %in% c("Active", "New") ~ "Active",
    WellStatus %in% c("Plugged","Idle","Canceled","Unknown","PluggedOnly","Abeyance") ~ "Not Active"
  )) %>%
  ungroup()


data_coordinates <- st_coordinates(wells)

wells$longitude <- data_coordinates[,1]
wells$latitude <- data_coordinates[,2]


subset_county_hs_results <- read_csv("/capstone/freshcair/freshcair-shiny/shinydashboard/data/subset_county_hs_results.csv")


county_health_results <- read_csv(here::here('shinydashboard/data/county_health_results.csv')) %>% 
  mutate(perc_diff = ((total_pm25_change_pct - bau_pm25_change_pct )/ bau_pm25_change_pct) * 100)


no_setback_county_results <- subset_county_hs_results %>% 
  filter(scen_id == "reference case-no_setback-no quota-price floor-no ccs-low innovation-no tax-1") %>% 
  filter(year < 2024)


summary_county_stats <- no_setback_county_results %>% 
  group_by(county) %>% 
  summarize(mean_pm = mean(total_pm25),
            dac = mean(dac_share),
            pop = mean(pop)) 


ca_counties <- counties(state = "CA", cb = TRUE, resolution = "500k") %>% 
  st_transform(ca_crs) %>%
  rename(CountyName = NAME) %>%
  select(-STATEFP, -COUNTYFP, -COUNTYNS, -AFFGEOID, -GEOID, -NAMELSAD, -STUSPS, -STATE_NAME, -LSAD, -ALAND, -AWATER) %>% 
  arrange(CountyName)

geometry <- ca_counties %>% 
  arrange(CountyName)

summary_county_stats$geometry <- geometry$geometry

summary_county_sf <- st_as_sf(summary_county_stats) %>% 
  rename(CountyName = county)


# joining the summary statistics with the county data



ca_counties$pm25 <- summary_county_sf$mean_pm

ca_counties$dac <- summary_county_sf$dac

ca_counties$pop <- summary_county_sf$pop

ca_counties$diffpm <- county_health_results$perc_diff
ca_counties <- ca_counties %>% 
  mutate(dac = dac * 100)

# reading in well buffer shapefile

buffer_3200 <- sf::st_read("/capstone/freshcair/freshcair-shiny/shinydashboard/data/datagenerated-buffer_3200ft.shp")

buffer_3200 <- buffer_3200 %>% 
  st_transform(ca_crs)

