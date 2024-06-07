# Impact of Oil Wells in California Interactive Dashboard

UCSB Master of Environmental Data Science Project Team Members: Mariam Garcia, Haejin Kim, and Maxwell Patterson

This interactive dashboard is submitted in partial satisfaction of the requirements for the degree of Master of Environmental Data Science for the Bren School of Environmental Science & Management.


## Contents
There are four main pages of the interactive dashboard: 'Oil well Explorer','About','Statewide Impacts of SB 1137', and 'Research Methods'.

An overview of each page follows:

*Oil Well Explorer*

The Oil Well Explorer contains a brief description of SB 1137, providing hard-hitting information in an interpretable manner. The main component of this page is reactivity. There are two pickerInputs, one for California County and one for Well Type. The 58 California Counties are listed in the first pickerInput, and the Well Types were consolidated into two types: Active and non-Active. After the user picks both inputs, a reactive Leaflet map will appear on the user's right-hand side. It will display all of California, with black borders representing the county lines. This map also includes a cornflower blue layer representing a 3,200 foot buffer around sensitive areas. The Leaflet map used was WorldStreetMap, so that users are able to easily identify areas of interest. Moreover, the Leaflet map will also include a pop-up message that includes county-specific information: County Name, % Reduction in PM 2.5 if SB 1137 is implemented, % of Disadvantaged Communtiies, and Population. 

![first-page](https://github.com/capstone-freshcair/freshcair-shiny/assets/105567684/0f4b1f56-8f12-4d94-8534-cbf12854da7b)


*About*

This page includes a brief overview about the health impacts associated with well activity. This page is meant to give the user a deeper understanding of the importance of SB 1137. This page also includes helpful context about what fossil fuel racism is, and how disadvantaged communities have often  faced the unequal distribution of the harmful effects associated with well activity.

![second-page](https://github.com/capstone-freshcair/freshcair-shiny/assets/105567684/2c68dcc0-25c2-4f0e-b1f6-a0f88c57df9a)


*Statewide Impacts of SB 1137*
This page includes a summary of findings associated with the additional setback scenario. This page also hosts three digestible visualizations showing different implications of the setback policy. It is important to note that these values are projections from the years 2020-2045. Two of the three visualizations are `geom_point()` graphs comparing the impacts of SB 1137 with other supply side policies: excise taxes and carbon taxes. The last visualization is a projection of the amount of oil produced, with two lines representing two different scenarios: SB 1137 and Business as Usual (BAU).

![third-page](https://github.com/capstone-freshcair/freshcair-shiny/assets/105567684/747abefe-ca75-4b41-b2d9-7feb78fdfcb5)

*Research Methods*
This page houses technical justifications for the approaches and selections made for the predictive models the freshCAir team decided to use for predicting the number of new wells and oil production. Visualizations on this page demonstrate the comparison between the existing Poisson model the client provided and the random forest model the freshCAir team crafted. This page also includes explanations of metrics used to assess performance and parameters used to craft the model.

![fourth-page](https://github.com/capstone-freshcair/freshcair-shiny/assets/105567684/4ba6d8b7-7bf4-4d5e-8eb5-95b4ce945542)




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
## Disclaimer
This capstone project was completed as a requirement for the Master of Environmental Data Science program at the Bren School of Environmental Science & Management, University of California, Santa Barbara. The data used for generating the visuals in the dashboard was made by updating the existing workflow by adding the 3,200 foot setback scenario. 


## Authors
Mariam Garcia {mkgarcia@ucsb.edu}

Haejin Kim  {haejin_kim@ucsb.edu}

Maxwell Patterson {maxwellpatterson@ucsb.edu}

## Clients
Lucas Boyd, Executive Director, The 2035 Initiative {lucasboyd@ucsb.edu}

Tracey Mangin, Senior Project Scientist, emLab, {tmangin@ucsb.edu}
