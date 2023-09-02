# Library Load-In====
library(tidyverse) # For everything data
library(artpack) # For art tools

## Number of points data wanted====
n <- 10000

## Randomly sampled angles
theta <- seq(sample(-500:500,1), sample(-500:500,1), length = n) 

## Circle's radius
r = 1:n

## Placing everything into a dataset====
data <- tibble(
  x = cos(theta)*r,
  y = sin(theta)*r,
  color = art_pals("rainbow",n)
)

# Pulling it all together====
data |>
  ggplot(aes(x = x, y = y))+
  geom_path(color = data$color,
            position = position_jitter(width = 20, height = 10),
            linewidth = sample(seq(0,5, l = n)))+
  theme_void()+
  theme(panel.background = element_rect(fill = "black"))+
  coord_equal()