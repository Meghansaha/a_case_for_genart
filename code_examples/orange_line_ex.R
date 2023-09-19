#============================================================================#
#R Example - Single, Orange, Line---------------------------------------------
#============================================================================#

# Library Load-in-------------------------------------
library(ggplot2)
library(dplyr)

# Image Options---------------------------------------
#Set the color
orange_hex <- "#FFBB58"

#Set the width
chonk <- 10

# Data Creation----------------------------------------
line <-
  tibble(x = 1:4,
         y = 1,
         color = orange_hex,
         linewidth = chonk
  )

# Plot Creation and View-------------------------------
line |>
  ggplot(aes(x,y)) +
  geom_path(
    color = line$color,
    linewidth = line$linewidth
  ) +
  coord_equal(
    ylim = c(0,3),
    xlim = c(0,4)
  )
