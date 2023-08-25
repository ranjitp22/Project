plot_indep <- function(){
  ggplot(dat, aes(y = Total, x = Indep_year))+
    geom_point()+
    geom_smooth(method = lm,se = F,
                col = "yellow")+
    labs(y = "Total Number of Medals",
         x = "Year of Independence")+
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
      axis.ticks.y = element_blank()
    )
}
