lit <- read.csv('Data-Init/Literacy_rate.csv')

lit <- lit %>% rename(Literacy=Literacy_rate...,
                      pop = Population)

dat <- merge(x = total_medals, y = lit, all.x = T, by = "Nation") #156 rows
dat <- merge(x = dat,y =  tab, all.x = T, by = "Nation")
dat <- merge(x = dat, y = bmi, all.x = T, by = "Nation")
dat <- merge(x = dat, y = alchol, all.x = T, by = "Nation")
dat <- merge(x = dat, y = data_ind, all.x = T, by = "Nation")
dat <- merge(x = dat, y = beer, all.x = T, by = "Nation")
dat <- merge(x = dat, y = data_forest, all.x = T, by = "Nation")
dat <- merge(x = dat, y = data_ind, all.x = T, by = 'Nation')
dat <- merge(x = dat, y = beer, all.x = T, by = "Nation")
dat <- merge(x = dat, y = unemployment_rate, all.x = T, by = "Nation")
dat <- merge(x = dat, y = suicide, all.x = T, by = "Nation")
  
dat <- na.omit(dat) # Deleted null rows 101rows left
cor(dat$Total, dat$Literacy)  # 0.264846(useless)
cor(dat$Total, dat$pop) # 0.2072138(useless)
cor(dat$Total, dat$lifeExp) # 0.4131061(weak correlation)
cor(dat$Total, dat$BMI) # -0.01914213(useless)
cor(dat$Total, dat$alchol_consum) # 0.3863792
cor(dat$Total, dat$indepedence) # -0.322616
cor(dat$Total, dat$BeerPrice) # 0.3479655
cor(dat$Total, dat$forest_area) # 0.101641
cor(dat$Total, dat$suicide_rate) # 0.1870489
cor(dat$Total, dat$`unemployment_rate(%)`) # -0.2284803


p <- ggplot(dat, aes(x = tot_norm, y = indepedence))+
  geom_point()+
  geom_smooth(method = "lm", se = T)

q <- ggplot(dat, aes(x = Total, y = indepedence))+
  geom_point()+
  geom_smooth(method = "lm", se = T)

fig <- ggarrange(p, q, labels = c("tot_norm", "Total"))

save(dat, file = "finalTotalMedals.Rdata")

