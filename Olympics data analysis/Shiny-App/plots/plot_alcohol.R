plot_alcohol <- function(){
  ggplot(dat, aes(y = Total, x = alchol_consum))+
    geom_point()+
    geom_smooth(method = lm,se = F,
                col = "cyan")+
    labs(y = "Total Number of Medals",
         x = "Per Capita Alchol Consumption")+
    theme(
      plot.title = element_text(size = 25,
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
      axis.ticks.y = element_blank()
    )
}
