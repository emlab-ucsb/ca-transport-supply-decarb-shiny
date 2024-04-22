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
# GGPLOT THEME -----------------

font_add_google(name = 'Nunito', family = 'nunito')
font_add_google(name = 'Mulish', family = 'mulish')
font_add_google(name = 'Catamaran', family = 'catamaran')
myCustomTheme <- function(){
  theme(axis.text = element_text(family = 'mulish', size = 12),
        plot.title = element_text(family = 'mulish', size = 16))
  
  
  
  
  
  
}