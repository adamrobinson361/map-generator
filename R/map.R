library(ggplot2)
library(magrittr)
library(dplyr)

lad_map <- function(dataset, match_col, fill_col){
  
  lad_df %>%
    left_join(dataset, by = c("id" = match_col)) %>%
    ggplot(aes_string(x = "long", y = "lat", group = "group", fill = fill_col)) +
      geom_polygon(show.legend = FALSE) +
      theme_void() +
      coord_fixed()
  
}
