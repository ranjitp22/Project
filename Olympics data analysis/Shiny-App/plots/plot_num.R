plot_num <- function(data){
  
  # Recode year of Winter Games after 1992 to match the next Summer Games
  # Thus, "Year" now applies to the Olympiad in which each Olympics occurred 
  original <- c(1994,1998,2002,2006,2010,2014)
  new <- c(1996,2000,2004,2008,2012,2016)
  for (i in 1:length(original)) {
    data$Year <- gsub(original[i], new[i], data$Year)
  }
  data$Year <- as.integer(data$Year)
  
  # Table counting number of athletes by Year and Sex
  counts_sex <- data %>% group_by(Year, Sex) %>%
    summarize(Athletes = length(unique(ID)))
  counts_sex$Year <- as.integer(counts_sex$Year)
  
  # Plot number of male/female athletes vs time
  ggplot(counts_sex, aes(x=Year, y=Athletes, group=Sex, color=Sex)) +
    geom_point(size=2) +
    geom_line()  +
    transition_reveal(Year)+
    scale_color_manual(values=c("darkblue","red")) +
    labs(title = "Number of male and female Olympians over time") +
    theme(plot.title = element_text(hjust = 0.5))
  
}