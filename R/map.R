library(ggplot2)

lad_map <- function(){
  
  # Create main map
  ggplot(lad_df, aes(x = long, y = lat, group = group, fill = lat)) +
    geom_polygon(show.legend = FALSE) +
    theme_void() +
    coord_fixed()
  
}

