# server functions ---
server <- function(input, output){
  
  # well data --------
  source('scratch/well_location.R')
  
  wells_df <- reactive({
    wells
    
    
  })
  
  
  # build leaflet map ----
  
  output$well_output
  
  
  
  
  
  
}
