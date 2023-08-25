plot_height <- function(temp, nation){
  
  ggplot(temp, aes(x = Height, fill = Sex))+
    theme_classic()+
    scale_fill_brewer()+
    geom_histogram(col = "black",
                   size = .2)+
    labs(x = "Height(in cms)",
         y = "Count",
         title = "Distribution of Height",
         subtitle = nation)+
    theme(
      plot.title = element_text(size = 30,
                                face = "bold",
                                color = 'grey28',
                                hjust = 0.5,
                                lineheight = 0.5),
      plot.subtitle = element_text(size = 20,
                                   face = "bold",
                                   color = 'grey28'),
      axis.text = element_text(size = 15,
                               face = "bold"),
      axis.title = element_text(face = "bold",
                                size = 20),
      panel.grid.major.x = element_blank(),
      axis.ticks.y = element_blank()
    )
}