# Title Image #
width = 1690
height = 1080

library(tidyverse)
library(artpack)

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
                 line_4)

angles <- c(0,120,120)
test <- rotator(cube_side, angle = 120, anchor = "center")

cube_side |>
  ggplot(aes(x,y))+
  geom_path(size = 2, linetype = 2, color = "red")+
  geom_path(data = test, size = 2, linetype = 2, color = "purple")+
  geom_point()+
  coord_equal()

