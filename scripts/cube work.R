# Title Image #
width = 1690
height = 1080

library(tidyverse)
library(artpack)
library(showtext)

font_add_google("Archivo Narrow")
font_add_google("Archivo Black")
showtext_auto()


start_x <- 0
start_y <- 0
dist <- 4

start <- tibble(x = start_x,
                y = start_y)

end_x = -dist * cos(30 * (180/pi))
end_y = -dist * sin(30 * (180/pi))

end <- tibble(x = end_x,
              y = end_y)

line_1 <- rbind(start, end)
line_2 <- tail(line_1,1) |>
  add_row(x = tail(line_1,1)$x,
          y = tail(line_1,1)$y + dist)
line_3 <- line_1 |>
  mutate(y = y + 4) |>
  arrange(desc(x))
line_4 <- head(line_1,1) |>
  add_row(x = head(line_1,1)$x,
          y = head(line_1,1)$y + dist)

cube_side <- rbind(line_1,
                 line_2,
                 line_3,
                 line_4) |>
  mutate(group = "right")


cube_side2 <- rbind(cube_side,
                    cube_side |>
  mutate(x = -x,
         group = "left")
  )



cube_top_setup <- cube_side2 |>
  mutate(grab = case_when(x == min(x) & y == max(y) ~ TRUE,
                          x == max(x) & y == max(y) ~ TRUE,
                          x == 0 & y != 0 ~ TRUE,
                          TRUE ~ FALSE)) |>
  filter(grab) |>
  select(-c(grab, group)) |>
  distinct()

cube_top <- rbind(cube_top_setup |> add_row(x = 0, y = max(cube_top_setup$y) * 1.25),
                  head(cube_top_setup,1)
                  ) |>
  mutate(group = "top")

final_cube <- rbind(cube_side2, cube_top)



final_cube |>
  ggplot(aes(x,y, group = group))+
  geom_path(size = 2, linetype = 2, color = "red")+
  geom_text(aes(-3, 4, label = left_text), inherit.aes = FALSE, family = "Archivo Narrow", size = 20, angle = 0)+
  geom_point()+
  coord_equal()

