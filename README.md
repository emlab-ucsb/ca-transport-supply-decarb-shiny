# Impact of Oil Wells in California Interactive Dashboard

UCSB Master of Environmental Data Science Project Team Members: Mariam Garcia, Haejin Kim, and Maxwell Patterson

This interactive dashboard is submitted in partial satisfaction of the requirements for the degree of Master of Environmental Data Science for the Bren School of Environmental Science & Management.


### Contents
The data used for generating the visuals in the dashboard was made by updating the existing workflow by adding the 3,200 foot setback scenario. 

This is the file structure of the `shinydashboard` content:


.
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
├── global1.R
├── global.R
├── R
│   ├── leaflet_map.R
│   └── well_location.R
├── server1.R
├── server.R
├── ui1.R
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
