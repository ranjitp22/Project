plot2_silver <- function(dat){
  
  # dat : dataset used to plot
  
  p2_silver <- ggplot(dat, aes(y = fct_reorder(Nation, Silver, .desc = F), x = Silver))+
    geom_segment(aes(y = fct_reorder(Nation, Silver, .desc = F),
                     yend = fct_reorder(Nation, Silver, .desc = F),
                     x = 0,
                     xend = Silver),
                 color = "grey50",
                 lwd = 2)+
    geom_point(color = "grey28", size = 12, alpha=0.6, pch = 16)+
    geom_text(aes(label = Silver), color = 'white', size = 3)+
    theme_light()+
    theme(
      plot.title = element_text(size = 30,
                                face = "bold",
                                color = 'grey28',
                                hjust = 0.5,
                                lineheight = 1.2),
      axis.text = element_text(size = 15,
                               face = "bold"),
      panel.grid.major.x = element_blank(),
      axis.ticks.y = element_blank(),
      panel.border = element_blank(),
      axis.title = element_text(face = "bold",
                                size = 20)
    )+
    labs(x = "Number of Silver Medals",
         y = "Nation",
         title = "Race of Nations for Silver")
  
  p2_silver
}