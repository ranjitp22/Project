library(tidyverse)
library(rvest)
library(tibble)

html <- read_html("https://en.wikipedia.org/wiki/List_of_countries_by_life_expectancy")

tab <- html %>% html_table()
tab <- tab[[1]]

tab <- as.tibble(tab) %>% na.omit()
tab <- tab[ ,1:2]
names(tab) <- c("Nation", "lifeExp")

save(tab, file = "LifeExp.Rdata")

rm(html)
