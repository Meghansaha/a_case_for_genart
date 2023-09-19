#=============================================================================#
# R Example - CityScape--------------------------------------------------------
#=============================================================================#

# Library Load-ins-------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(artpack)

# Let's make: a "cityscape" with a sky, moon, and buildings

# Data for the sky-------------------------------------------------------------
df_sky <- 
  tibble(
    x = 0,
    xend = 4,
    y = seq(0,3, length = 100),
    yend = y,
    color = art_pals("sunnyside", 100),
    linewidth = 10
  )

# Data for the moon------------------------------------------------------------
df_moon <- tibble(
  x = 2,
  y = 1.5,
  size = 100,
  fill = "#f0e4bb",
  color = "#000000"
)

# Data for the buildings-------------------------------------------------------
df_buildings <- tibble(
  x = 0:4,
  xend = x,
  y = 0,
  yend = sample(seq(.5,2, l = 10), 5, replace = TRUE),
  color = "#000000", 
  linewidth = 60
)

# Plot Creation----------------------------------------------------------------
df_sky |>
  ggplot(aes(x,y, xend = xend, yend = yend)) +
  theme_void() +
  coord_cartesian(
    xlim = c(0,4),
    ylim = c(0,3),
    expand = FALSE
  ) +
  geom_segment(
    color = df_sky$color,
    linewidth = df_sky$linewidth
  ) +
  geom_point(
    data = df_moon, aes(x,y),
    color = df_moon$color,
    fill = df_moon$fill,
    size = df_moon$size,
    shape = 21,
    stroke = .5,
    inherit.aes = FALSE
  ) +
  geom_segment(
    data = df_buildings,
    color = df_buildings$color,
    linewidth = df_buildings$linewidth
  )
