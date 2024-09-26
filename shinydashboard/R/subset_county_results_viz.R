county_results <- function(input){
  filtered_state_results <- subset_state_results %>% 
    filter(year > 2023) %>% 
    group_by(setback_scenario)
  

# plotting each setback scenario and coloring accordingly
  
  # emissions
ggplot(data = filtered_state_results, aes(x = year, y = total_state_ghg_kgCO2, color = setback_scenario))+
  geom_point()+
  scale_color_manual(name = "Setback",
                     values = c("#5A7D7C", "#FF6700", "#D1CA98", "#1D3557", "#885053"),
                     labels = c("No Setback", "1000", "2500", "3200", "5280"))


ggplot(data = filtered_state_results, aes(x = year, y = mortality_level, color = setback_scenario))+
  geom_point()+
  scale_color_manual(name = "Setback",
                     values = c("#5A7D7C", "#FF6700", "#D1CA98", "#1D3557", "#885053"),
                     labels = c("No 
                                Setback", "1000", "2500", "3200", "5280"))+
  labs(title = 'Predicted Mortality Level with Respect to Setback Scenario',
       x = 'Year',
       y = 'Mortality Level ')
}