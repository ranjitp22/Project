## Scrapping year wise medal data

library(rvest)
library(tibble)
a <- "https://en.wikipedia.org/wiki/"
b <- "_Summer_Olympics_medal_table"

# Extracting medals for 1896

html <- read_html("https://en.wikipedia.org/wiki/1896_Summer_Olympics_medal_table")
tab <- html_table(html)
tab <- tab[[2]]
year <- 1896
tab <- cbind.data.frame(tab , year)
tab <- tab[1:dim(tab)[1]-1 , ]


year_wise_medals <- tab

## 1900 to 1912
year <- 1900
while(year <= 1912)
{
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  tab <- html_table(html)
  tab <- tab[[2]]
  tab <- tab[1:dim(tab)[1]-1 , ]
 
  tab <- cbind.data.frame(tab , year)
  year = year + 4
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
}

## Olympics didn't happen in 1916 due to WW1

## 1920 to 1932
year <- 1920
while(year <= 1932)
{
 
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  tab <- html_table(html)
  tab <- tab[[2]]
  tab <- tab[1:dim(tab)[1]-1 , ]
  
  tab <- cbind.data.frame(tab , year)
  year = year + 4
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
}

## 1936 
year <- 1936

link <- paste(a,year,b, sep = "")
html <- read_html(link)
tab <- html_table(html)
tab <- tab[[3]]
tab <- tab[1:dim(tab)[1]-1 , ]
  
tab <- cbind.data.frame(tab , year)
year = year + 4
  
year_wise_medals <- rbind.data.frame(year_wise_medals , tab)


## 1948 
year <- 1948

link <- paste(a,year,b, sep = "")
html <- read_html(link)
tab <- html_table(html)
tab <- tab[[3]]
tab <- tab[1:dim(tab)[1]-1 , ]

tab <- cbind.data.frame(tab , year)
year = year + 4

year_wise_medals <- rbind.data.frame(year_wise_medals , tab)


## 1952 to 1956
year <- 1952
while(year <= 1956)
{
  
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  tab <- html_table(html)
  tab <- tab[[2]]
  tab <- tab[1:dim(tab)[1]-1 , ]
  
  tab <- cbind.data.frame(tab , year)
  year = year + 4
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
}

## 1960
year <- 1960

  
link <- paste(a,year,b, sep = "")
html <- read_html(link)
tab <- html_table(html)
tab <- tab[[3]]
tab <- tab[1:dim(tab)[1]-1 , ]

tab <- cbind.data.frame(tab , year)
year = year + 4

year_wise_medals <- rbind.data.frame(year_wise_medals , tab)


## 1964 to 1972
year <- 1964
while(year <= 1972)
{
  
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  tab <- html_table(html)
  tab <- tab[[2]]
  tab <- tab[1:dim(tab)[1]-1 , ]
  
  tab <- cbind.data.frame(tab , year)
  year = year + 4
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
}


## 1976
year <- 1976

link <- paste(a,year,b, sep = "")
html <- read_html(link)
tab <- html_table(html)
tab <- tab[[3]]
tab <- tab[1:dim(tab)[1]-1 , ]
colnames(tab)[2] <- "Nation"

tab <- cbind.data.frame(tab , year)
year = year + 4

year_wise_medals <- rbind.data.frame(year_wise_medals , tab)



## 1980 to 1984
year <- 1980
while(year <= 1984)
{
  
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  tab <- html_table(html)
  tab <- tab[[3]]
  tab <- tab[1:dim(tab)[1]-1 , ]
  
  tab <- cbind.data.frame(tab , year)
  year = year + 4
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
}


## 1988
year <- 1988
link <- paste(a,year,b, sep = "")
html <- read_html(link)
tab <- html_table(html)
tab <- tab[[2]]
tab <- tab[1:dim(tab)[1]-1 , ]
colnames(tab)[2] <- "Nation"

tab <- cbind.data.frame(tab , year)
year = year + 4

year_wise_medals <- rbind.data.frame(year_wise_medals , tab)

## 1992 to 2004
year <- 1992
while(year <= 2004)
{
  
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  
  tab <- html_table(html)
  tab <- tab[[3]]
  tab <- tab[1:dim(tab)[1]-1 , ]
  
  tab <- cbind.data.frame(tab , year)
  
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
  year = year + 4
}

## 2004 to 2020
year <- 2004
while(year <= 2020)
{
  
  link <- paste(a,year,b, sep = "")
  html <- read_html(link)
  
  tab <- html_table(html)
  tab <- tab[[3]]
  colnames(tab)[2] <- "Nation"
  tab <- tab[1:dim(tab)[1]-1 , ]
  
  tab <- cbind.data.frame(tab , year)
  
  
  year_wise_medals <- rbind.data.frame(year_wise_medals , tab)
  year = year + 4
}

## Adding another column corresponding to the host country

#


save(year_wise_medals , file = "year_wise_medals.Rdata")


