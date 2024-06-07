# Impact of Oil Wells in California Interactive Dashboard

UCSB Master of Environmental Data Science Project Team Members: Mariam Garcia, Haejin Kim, and Maxwell Patterson

This interactive dashboard is submitted in partial satisfaction of the requirements for the degree of Master of Environmental Data Science for the Bren School of Environmental Science & Management.


## Contents
There are four main pages of the interactive dashboard: 'Oil well Explorer','About','Statewide Impacts of SB 1137', and 'Research Methods'.

An overview of each page follows:

*Oil Well Explorer*

The Oil Well Explorer contains a brief description of SB 1137, providing hard-hitting information in an interpretable manner. The main component of this page is reactivity. There are two pickerInputs, one for California County and one for Well Type. The 58 California Counties are listed in the first pickerInput, and the Well Types were consolidated into two types: Active and non-Active. After the user picks both inputs, a reactive Leaflet map will appear on the user's right-hand side. It will display all of California, with black borders representing the county lines. This map also includes a cornflower blue layer representing a 3,200 foot buffer around sensitive areas. The Leaflet map used was WorldStreetMap, so that users are able to easily identify areas of interest. 
The data used for generating the visuals in the dashboard was made by updating the existing workflow by adding the 3,200 foot setback scenario. 

This is the file structure of the `shinydashboard` content:


```bash
├── data
│   ├── buffer_3200ft.shp
│   ├── county_health_results.csv
│   ├── datagenerated-buffer_3200ft.dbf
│   ├── datagenerated-buffer_3200ft.prj
│   ├── datagenerated-buffer_3200ft.shp
│   ├── datagenerated-buffer_3200ft.shx
│   ├── proprietary
│   │   └── AllWells_gis
│   │       ├── Wells_All.dbf
│   │       ├── Wells_All.prj
│   │       ├── Wells_All.sbn
│   │       ├── Wells_All.sbx
│   │       ├── Wells_All.shp
│   │       ├── Wells_All.shp.xml
│   │       └── Wells_All.shx
│   └── subset_county_hs_results.csv
├── global.R
├── R
│   ├── leaflet_map.R
│   └── well_location.R
├── server.R
├── ui.R
└── www
    ├── 2035-logo.png
    ├── BrenLogo-FullColor-RGB-transparent.png
    ├── ca-oil-prod.png
    ├── dac-emp.png
    ├── dac-mort.png
    ├── mortality_plot.png
    ├── oil-well-comp.png
    ├── oilwell.jpg
    ├── oil-well-prod.png
    ├── pred-wells.png
    ├── shinydashboard-fresh-theme.css
    ├── shiny-fresh-theme.css
    └── styles.css
```
