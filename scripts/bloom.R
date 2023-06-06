library(tidyverse)
theta <- seq(0,2*pi, l = 100)
xlim = c(0,10)
ylim = c(0,10)
n <- 4

radi <- seq(2,.1, l = n)
linetype <- seq(3,1, l = n)
alpha <- seq(.5,1, l =n)
subgroups <- paste0("inner-",paste0("0",1:n))
linewidth <- seq(.2,.4,l=n)
x_shifts <- c(0, sample(seq(0,.2, l = n-1)))
y_shifts <- c(0, sample(seq(0,.2, l = n-1)))
border_color <- c("#000000",rep(NA,n-1))

main_circle_opts <- list(radi,
                         linetype,
                         alpha,
                         subgroups,
                         linewidth,
                         x_shifts,
                         y_shifts,
                         border_color)

main_circle <- pmap(main_circle_opts, ~tibble(x = cos(theta) * ..1,
                                              y = sin(theta) * ..1,
                                              group = paste0("circle_",..4),
                                              alpha = ..3,
                                              linetype = ..2,
                                              linewidth = ..5,
                                              color = ..8
) |> mutate(group = fct_inorder(group),
            x = x + ..6,
            y = y + ..7)
) |> list_rbind()

xy_grid <- tibble(x = seq(0,100, by = max(radi) - 1),
                  y = x) |>
  expand.grid()

pattern_n <- nrow(xy_grid)
pal <- colorRampPalette(c("#F6BF07", "#F67C21", "#ED155A", "#F61867","#1D0B35"))(pattern_n)
pattern_colors <- map(sample(pal), ~colorRampPalette(c(.x,sample(pal,1)))(nrow(main_circle)))
radi_mod <- sample(seq(.05,5, l = pattern_n))
pattern_lst <- list(1:pattern_n,
                    pattern_colors,
                    xy_grid$x,
                    xy_grid$y,
                    radi_mod)


final <- pmap(pattern_lst, ~main_circle |>
                mutate(fills = ..2,
                       x = (x + ..3)*..5,
                       y = (y + ..4)*..5,
                       group = paste0(group,"group_00",..1),
                       group = fct_inorder(group),
                       x = jitter(x, amount = 30),
                       y = jitter(y, amount = 30)),
              ) |> list_rbind()



final |>
  ggplot(aes(x,y, group = group))+
  theme_void()+
  theme(plot.background =  element_rect(fill = "#000000"))+
  geom_polygon(fill = final$fills,
               linetype = final$linetype,
               linewidth = final$linewidth,
               color = NA,
               alpha = final$alpha) +
  coord_equal(xlim = xlim,
              ylim = ylim,
              expand = FALSE)