# map_utils.R
library(sf)
library(rmapshaper)
library(tidycensus)
library(tidyverse)
library(here)
library(leaflet)

  ca_crs <- 4326
  well_colors <- c(
    "Active" = "#0747f7",
    "Plugged" = "yellow",
    "Abeyance" = "#f7cf07",
    "Abandoned" = "red",
    "Idle" = "#f7cf07",
    "New" = "#0747f7",
    "PluggedOnly" = "yellow",
    "Unknown" = "grey"
  )
  
  ca <- st_as_sf(maps::map("state", plot = FALSE, fill = TRUE)) %>%
    filter(ID == "california") %>%
    st_transform(ca_crs)
  
  wells <- sf::st_read(here::here("shinydashboard/data/proprietary/AllWells_gis/Wells_All.shp")) %>%
    st_transform(ca_crs) %>%
    dplyr::select(API, WellStatus, FieldName) %>%
    unique() %>%
    mutate(WellStatus = case_when(
      WellStatus %in% c("Active", "New") ~ "Active",
      WellStatus %in% c("PluggedOnly") ~ "Plugged",
      WellStatus %in% c("Abeyance") ~ "Idle",
      TRUE ~ WellStatus
    ))
  
data_coordinates <- st_coordinates(wells)

wells$longitude <- data_coordinates[,1]
wells$latitude <- data_coordinates[,2]