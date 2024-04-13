server <- function(input,output) {
  source('../scratch/well_location.R')
  
  wellmap <- mapview(mapview(
    ca,
    layer.name = "California",
    alpha.regions = 0.5,
    homebutton = TRUE,
    layersControl = TRUE
  ) +
    mapview(
      active_wells,
      zcol = "WellStatus",
      crs = ca_crs,
      layer.name = "Active Wells",
      legend = TRUE,
      col.regions = well_colors["Active"],
      pointShape = 21,
      pointSize = 0.03,
      pointFill = "black"
    ) +
    mapview(
      plugged_wells,
      zcol = "WellStatus",
      crs = ca_crs,
      layer.name = "Plugged Wells",
      legend = TRUE,
      col.regions = well_colors["Plugged"],
      pointShape = 21,
      pointSize = 0.03,
      pointFill = "black"
    ) +
    mapview(
      unknown_wells,
      zcol = "WellStatus",
      crs = ca_crs,
      layer.name = "Unknown Wells",
      legend = TRUE,
      col.regions = well_colors["Unknown"],
      pointShape = 21,
      pointSize = 0.03,
      pointFill = "black")
  +
    mapview(
      canceled_wells,
      zcol = "WellStatus",
      crs = ca_crs,
      layer.name = "Abandoned Wells",
      legend = TRUE,
      col.regions = well_colors["Abandoned"],
      pointShape = 21,
      pointSize = 0.03,
      pointFill = "black"
    ))
  
  
  output$mapplot <- renderLeaflet({
    wellmap@map
  })
  
  
  
  
  
  
}