library(tidyverse)
library(artpack)

theta <- seq(0,2*pi, l = 2000)
pal <- c("#941010", "#88256E", "#333D9D", "#1680AD", "#679334", "#E3A934", "#F26E0A")

#circle
circle <-
  tibble(x = cos(theta) * 2,
         y = sin(theta) * 2
         )

circle_n <- 100
circle_pal <- colorRampPalette(c(pal[1],"#000000"))(circle_n)
circle_trans <- seq(.1,5, l = circle_n)
circle_groups <- group_numbers(1:circle_n)
circle_width <- seq(.5,0, l = circle_n)
circle_alpha <- seq(.9,1, l = circle_n)
circle_line_alpha <- seq(.1,1, l = circle_n)
circle_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(circle_n)


circle_opts <- list(
  circle_pal, circle_trans, circle_groups, 
  circle_width, circle_alpha, circle_line_alpha, circle_line_color
)

df1 <-
  pmap(circle_opts, ~circle |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("circle_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() 


# Kidney
kidney <-
  tibble(x = cos(theta) * 1.6,
         y = sin(theta) * 1.6
  ) |>
  mutate(y = y + cos(x) +
           sample(seq(-.01,.01, l = 100)),
         x = x + sin(y) +
           sample(seq(-.01,.01, l = 100)))

kidney_n <- 100
kidney_pal <- colorRampPalette(c(pal[2],"#000000"))(kidney_n)
kidney_trans <- seq(.1,5, l = kidney_n)
kidney_groups <- str_pad(1:kidney_n, width = str_length(kidney_n) + 1, pad = 0)
kidney_width <- seq(.5,0, l = kidney_n)
kidney_alpha <- seq(.9,1, l = kidney_n)
kidney_line_alpha <- seq(.1,1, l = kidney_n)
kidney_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(kidney_n)


kidney_opts <- list(
  kidney_pal, kidney_trans, kidney_groups, 
  kidney_width, kidney_alpha, kidney_line_alpha, kidney_line_color
)

df2 <-
  pmap(kidney_opts, ~kidney |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("kidney_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() |>
  mutate(x = x + 15,
         y = y - 6) |>
  rotator(x,y,angle  = 100)


# Raindrop #
raindrop <-
  tibble(x = cos(theta)  * 1.4,
         y = sin(theta)  * 1.4
  ) |>
  mutate(y = y - cos(x) +
           sample(seq(-.01,.01, l = 100)),
         x = x * sin(y) +
           sample(seq(-.01,.01, l = 100)))

raindrop_n <- 100
raindrop_pal <- colorRampPalette(c(pal[3],"#000000"))(raindrop_n)
raindrop_trans <- seq(.1,5, l = raindrop_n)
raindrop_groups <- str_pad(1:raindrop_n, width = str_length(raindrop_n) + 1, pad = 0)
raindrop_width <- seq(.5,0, l = raindrop_n)
raindrop_alpha <- seq(.9,1, l = raindrop_n)
raindrop_line_alpha <- seq(.1,1, l = raindrop_n)
raindrop_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(raindrop_n)


raindrop_opts <- list(
  raindrop_pal, raindrop_trans, raindrop_groups, 
  raindrop_width, raindrop_alpha, raindrop_line_alpha, raindrop_line_color
)

df3 <-
  pmap(raindrop_opts, ~raindrop |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("raindrop_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() |>
  mutate(x = x + 40,
         y = y + 10) |>
  rotator(x,y, angle = 55)


# tilde #
tilde <-
  tibble(x = cos(theta) * 1.5 ,
         y = sin(theta) * 1.5
  ) |>
  mutate(y = y - tan(x) +
           sample(seq(-.01,.01, l = 100)),
         x = x + sin(y) +
           sample(seq(-.01,.01, l = 100)))
tilde_n <- 100
tilde_pal <- colorRampPalette(c(pal[4],"#000000"))(tilde_n)
tilde_trans <- seq(.1,5, l = tilde_n)
tilde_groups <- str_pad(1:tilde_n, width = str_length(tilde_n) + 1, pad = 0)
tilde_width <- seq(.5,0, l = tilde_n)
tilde_alpha <- seq(.9,1, l = tilde_n)
tilde_line_alpha <- seq(.1,1, l = tilde_n)
tilde_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(tilde_n)


tilde_opts <- list(
  tilde_pal, tilde_trans, tilde_groups, 
  tilde_width, tilde_alpha, tilde_line_alpha, tilde_line_color
)

df4 <-
  pmap(tilde_opts, ~tilde |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("tilde_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() |>
  mutate(x = x + 70,
         y = y + 3) |>
  rotator(x,y, angle = -70) |>
  mutate(x = x)


# Bullet Head #
bullethead <-
  tibble(x = cos(theta)  * 2.5,
         y = sin(theta)  * 2.5
  ) |>
  mutate(y = y * cos(y) +
           sample(seq(-.01,.01, l = 100)),
         x = x + cos(x) +
           sample(seq(-.01,.01, l = 100))) 

bullethead_n <- 100
bullethead_pal <- colorRampPalette(c(pal[5],"#000000"))(bullethead_n)
bullethead_trans <- seq(.1,5, l = bullethead_n)
bullethead_groups <- str_pad(1:bullethead_n, width = str_length(bullethead_n) + 1, pad = 0)
bullethead_width <- seq(.5,0, l = bullethead_n)
bullethead_alpha <- seq(.9,1, l = bullethead_n)
bullethead_line_alpha <- seq(.1,1, l = bullethead_n)
bullethead_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(bullethead_n)


bullethead_opts <- list(
  bullethead_pal, bullethead_trans, bullethead_groups, 
  bullethead_width, bullethead_alpha, bullethead_line_alpha, bullethead_line_color
)

df5 <-
  pmap(bullethead_opts, ~bullethead |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("bullethead_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() |>
  mutate(x = x + 75,
         y = y + 3) |>
  rotator(x,y,angle = -250) |>
  mutate(x = x + 25)


# goldfish #
goldfish <-
  tibble(x = cos(theta) * 1.9,
         y = sin(theta) * 1.9
  ) |>
  mutate(y = y + cospi(x) * sin(y) +
           (sample(seq(-.01,.01, l = 100))),
         x = sin(x) + cos(y) +
           sample(seq(-.01,.01, l = 100)))

goldfish_n <- 100
goldfish_pal <- colorRampPalette(c(pal[6],"#000000"))(goldfish_n)
goldfish_trans <- seq(.1,5, l = goldfish_n)
goldfish_groups <- str_pad(1:goldfish_n, width = str_length(goldfish_n) + 1, pad = 0)
goldfish_width <- seq(.5,0, l = goldfish_n)
goldfish_alpha <- seq(.9,1, l = goldfish_n)
goldfish_line_alpha <- seq(.1,1, l = goldfish_n)
goldfish_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(goldfish_n)


goldfish_opts <- list(
  goldfish_pal, goldfish_trans, goldfish_groups, 
  goldfish_width, goldfish_alpha, goldfish_line_alpha, goldfish_line_color
)

df6 <-
  pmap(goldfish_opts, ~goldfish |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("goldfish_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() |>
  mutate(x = x + 90,
         y = y + 3) |>
  rotator(x,y,angle = 230) |>
  mutate(x = x + 20)

# arrowhead #
arrowhead <-
  tibble(x = cos(theta) * 1.1,
         y = sin(theta) * 1.1
  ) |>
  mutate(y = y + cos(x) * sinpi(y) +
           (sample(seq(-.01,.01, l = 100))),
         x = tan(x) - cos(y) +
           sample(seq(-.01,.01, l = 100))) 

arrowhead_n <- 100
arrowhead_pal <- colorRampPalette(c(pal[7],"#000000"))(arrowhead_n)
arrowhead_trans <- seq(.1,5, l = arrowhead_n)
arrowhead_groups <- str_pad(1:arrowhead_n, width = str_length(arrowhead_n) + 1, pad = 0)
arrowhead_width <- seq(.5,0, l = arrowhead_n)
arrowhead_alpha <- seq(.9,1, l = arrowhead_n)
arrowhead_line_alpha <- seq(.1,1, l = arrowhead_n)
arrowhead_line_color <- colorRampPalette(c("#1a1a1a", "#000000"))(arrowhead_n)


arrowhead_opts <- list(
  arrowhead_pal, arrowhead_trans, arrowhead_groups, 
  arrowhead_width, arrowhead_alpha, arrowhead_line_alpha, arrowhead_line_color
)

df7 <-
  pmap(arrowhead_opts, ~arrowhead |>
         mutate(x = (x/..2) ,
                y = y/..2,
                fill = ..1,
                group = paste0("arrowhead_",..3),
                width = ..4,
                alpha = ..5,
                line_alpha = ..6,
                line_color = ..7)) |> list_rbind() |>
  mutate(x = x + 140,
         y = y + 3) |>
  rotator(x,y,angle = -60)



df1 |>
  ggplot(aes(x,y, group = group))+
  theme_void()+
  theme(plot.background = element_rect(fill = "#1a1a1a", color = NA))+
  geom_polygon(alpha = df1$alpha, fill = df1$fill)+
  geom_path( color = df1$line_color, linewidth = df1$width)+
  geom_polygon(data = df2, alpha = df2$alpha, fill = df2$fill)+
  geom_path(data = df2, color = df2$line_color, linewidth = df2$width)+
  geom_polygon(data = df3, alpha = df3$alpha, fill = df3$fill)+
  geom_path(data = df3, color = df3$line_color, linewidth = df3$width)+
  geom_polygon(data = df4, alpha = df4$alpha, fill = df4$fill)+
  geom_path(data = df4, color = df4$line_color, linewidth = df4$width)+
  geom_polygon(data = df5, alpha = df5$alpha, fill = df5$fill)+
  geom_path(data = df5, color = df5$line_color, linewidth = df5$width)+
  geom_polygon(data = df6, alpha = df6$alpha, fill = df6$fill)+
  geom_path(data = df6, color = df6$line_color, linewidth = df6$width)+
  geom_polygon(data = df7, alpha = df7$alpha, fill = df7$fill)+
  geom_path(data = df7, color = df7$line_color, linewidth = df7$width)+
  coord_equal(xlim = c(-5,140),
              ylim = c(-5,60))

ggsave(
  "images/background.png",
  width = 17.6,
  height = 11.25,
  device = "png",
  dpi = 300
)