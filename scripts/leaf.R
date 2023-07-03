# Title Image #
width = 1690
height = 1080

library(tidyverse)
library(artpack)

color_pal <- c("#AF3918", "#A3154B",  "#512F8C", "#1480AF",  "#599134", "#E3A934")

shader <- "#000000"

theta <- seq(0,2*pi, l = 1000)

xlim <- c(0,15)
ylim <- c(0,10)

leaf_thing <- tibble(x = cos(theta) + c(seq(0,10, l = 500), seq(10,0, l = 500)) ,
                 y = sin(theta) - c(seq(0,6, l = 500), seq(6,0, l = 500)) 
                 ) 
                 

sizes <- seq(1,5, l = 100)
color_pal1 <- colorRampPalette(c(color_pal[5],shader))(length(sizes))
leaf_df <- map2(sizes, color_pal1, ~leaf_thing |>
                  mutate(group = paste0("leaf_0",.y),
                         fill = .y,
                         x = (x * .x) ,
                         y = (y * .x))) |> list_rbind() 
# |>
#   mutate(x = x * sin(theta*y),
#          y = y * cos(theta*x))


leaf_df |>
  ggplot(aes(x,y, group = group))+
  geom_polygon(fill = leaf_df$fill,
               color = "#000000",
               size = .1,
               position = position_jitter(width = .1, height = .1)) +
  coord_polar()
