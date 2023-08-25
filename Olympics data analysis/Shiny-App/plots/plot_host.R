plot_host <- function(dat, bias, nation){
  
  p1 <- ggplot(dat, aes(y = Total, x = year))+
    geom_line(col = 'black')+
    geom_point(color = 'cyan',
               size = 6,
               pch = 16,
               alpha = 0.8)+
    geom_point(aes(x = year, y = Total),
               col = "cyan",
               size = 12,
               pch = 16,
               data = bias)+
    geom_label(label = "Host", size = 6, data = bias, alpha = 0.6)+
    theme_light()+
    labs(x = "Year",
         y = "Total Number of Medals",
         title = "Evolution of Medals",
         subtitle = paste("(", nation, ")"))+
    theme(
      plot.title = element_text(size = 30,
                                face = "bold",
                                color = 'grey28',
                                hjust = 0.5,
                                lineheight = 0.5),
      plot.subtitle = element_text(size = 20,
                                   face = "bold",
                                   color = 'grey28'),
      axis.text = element_text(size = 20,
                               face = "bold"),
      axis.title = element_text(face = "bold",
                                size = 20),
      panel.grid.major.x = element_blank(),
      axis.ticks.y = element_blank(),
      panel.border = element_blank()
    )+
    coord_cartesian(xlim = c(1896, 2020))+
    scale_x_continuous(breaks = seq(1896, 2020, 31))
  
  p1
}