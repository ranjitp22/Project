beer <- read.csv("Data/BeerPrice.csv")
beer <- beer[, c(8, 24)]

names(beer) <- c("Nation", "BeerPrice")
# 500ml beer price in usd

save(beer, file = "beer.Rdata")
