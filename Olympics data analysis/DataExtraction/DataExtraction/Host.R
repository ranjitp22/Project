library(rvest)
library(tidyverse)
library(tibble)

host <- read_html("https://en.wikipedia.org/wiki/List_of_Olympic_Games_host_cities") %>%
  html_table()

host <- host[[2]]
host <- host[, 3:4]
names(host) <- c("HostNation", "year")

save(host, file = "Host.Rdata")
