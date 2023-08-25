library(tidyverse)
library(rvest)
library(tibble)

bmi <- read_html("https://en.wikipedia.org/wiki/List_of_countries_by_body_mass_index") %>% 
  html_table()

bmi <- bmi[[1]] %>% as.tibble()
bmi <- bmi[ , 1:2]
names(bmi) <- c("Nation", "BMI")

## Cleaning the dataset
#changing the names of the nation

for(i in 1:nrow(bmi)){
  
  len <- str_length(bmi[i, 1])
  bmi[i, 1] <- bmi[i, 1] %>% substr(1, len-2)
}
rm(len, i)

bmi[17, 1] = 'Bahamas'

#Need to change the data type of bmi

bmi$BMI <- as.numeric(bmi$BMI)
## 

save(bmi, file = "BMI.Rdata")
