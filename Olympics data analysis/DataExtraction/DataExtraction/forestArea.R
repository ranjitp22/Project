load("Data/forest.Rdata")

## Need to clean the dataset

data_forest$forest_area <- as.numeric(data_forest$forest_area)

save(data_forest, file = "forestArea.Rdata")
