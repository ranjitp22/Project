# Given a country plot the distribution of height

plot_age <- function(temp, nation){
  
  ggplot(temp, aes(x = Age, fill = Sex))+
    theme_classic()+
    scale_fill_brewer(palette = "Spectral")+
    geom_histogram(col = "black",
                   size = .2)+
    labs(x = "Age(years)",
         y = "Count",
         title = "Distribution of Age",
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


  
