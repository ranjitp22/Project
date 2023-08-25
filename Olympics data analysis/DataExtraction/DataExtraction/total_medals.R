### Data Extraction
## All time medals, country wise

library(rvest)
html <- read_html("https://en.wikipedia.org/wiki/All-time_Olympic_Games_medal_table")
tab <- html_table(html)

#Extracting country names
tab <- tab[[2]]

temp <- tab[,1]
temp <- temp[[1]]
countries <- temp[2:158]

# Total medals
tem <- tab[,13:16]
tem <- tem[2:158 , ]

total_medals <- data.frame(countries , tem)
colnames(total_medals) <- c("Nation","Gold" , "Silver" , "Bronze" , "Total")
total_medals <- total_medals[1:156,]

rm(html, tab, tem, countries, temp)

### Now cleaning the dataset

library(tidyverse)
library(dplyr)
library(tibble)

total_medals <- as.tibble(total_medals)

# Converting character columns to integer

temp <- lapply(total_medals[, 2:5], as.integer) %>% 
  as.data.frame()
total_medals <- cbind(total_medals[, 1], temp)

rm(temp)

# Need to change the nation names

for(i in 1:nrow(total_medals)){
  
  name <- total_medals[i, 1]
  name <- name %>% str_split("")
  name <- name[[1]]
  stop <- which(name == "(")-2
  total_medals[i, 1] <- total_medals[i, 1] %>% substr(start = 1, stop = stop)
}

total_medals$Nation <- total_medals$Nation %>% as.factor()

rm(i, name, stop)

save(total_medals, file = "total_medals.Rdata")
