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
# GGPLOT THEME -----------------

font_add_google(name = 'Nunito', family = 'nunito')
font_add_google(name = 'Mulish', family = 'mulish')
font_add_google(name = 'Catamaran', family = 'catamaran')
myCustomTheme <- function(){
  theme(axis.text = element_text(family = 'mulish', size = 12),
        plot.title = element_text(family = 'mulish', size = 16))
  
  
}


# reading in the data 
ca_crs <- 4326

wells <- sf::st_read(here::here("shinydashboard/data/proprietary/AllWells_gis/Wells_All.shp")) %>%
  st_transform(ca_crs) %>%
  dplyr::select(API, WellStatus, FieldName) %>%
  unique() %>%
  mutate(WellStatus = case_when(
    WellStatus %in% c("Active", "New") ~ "Active",
    WellStatus %in% c("PluggedOnly","Plugged") ~ "Plugged",
    WellStatus %in% c("Abeyance") ~ "Idle",
    TRUE ~ WellStatus
  ))


data_coordinates <- st_coordinates(wells)

wells$longitude <- data_coordinates[,1]

wells$latitude <- data_coordinates[,2]
