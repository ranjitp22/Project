load("Data/Host.Rdata")
load("Data/year_wise_medals.Rdata")

dat_year <- merge(x = year_wise_medals, y = host, all.x = T, by = 'year')

# Need to clean the names of the Nation


for(i in 1:nrow(dat_year)){
  name <- dat_year[i, 3] %>% str_split("")
  name <- name[[1]]
  
  if(sum(name == "(")){
    stop <- which(name == "(")-2
    dat_year[i, 3] <- dat_year[i, 3] %>% substr(1, stop)
  }
}

save(dat_year, file = "FinalYearWiseMedals.Rdata")

