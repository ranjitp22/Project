alchol <- datar
rm(datar)

# Cleaning the data

names(alchol) <- c("Nation", "alchol_consum")
alchol$alchol_consum <- as.numeric(alchol$alchol_consum)

#alchol_consumption is litres per year

save(alchol, file = "alcohol.Rdata")
