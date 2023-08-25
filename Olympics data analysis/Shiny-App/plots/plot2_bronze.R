plot2_bronze <- function(dat){
  
  # dat : dataset used to plot
  
  p2_bronze <- ggplot(dat, aes(y = fct_reorder(Nation, Bronze, .desc = F), x = Bronze))+
    geom_segment(aes(y = fct_reorder(Nation, Bronze, .desc = F),
                     yend = fct_reorder(Nation, Bronze, .desc = F),
                     x = 0,
                     xend = Bronze),
                 color = "#cd7f32",
                 lwd = 2)+
    geom_point(color = "#a46628", size = 12, alpha=0.6, pch = 16)+
    geom_text(aes(label = Bronze), color = 'white', size = 3)+
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
    labs(x = "Number of Bronze Medals",
         y = "Nation",
         title = "Race of Nations for Bronze")
  
  p2_bronze
}