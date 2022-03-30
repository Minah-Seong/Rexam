rm(list=ls())

library(showtext)
library(plotrix)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")

product_c <- read.table("data/product_click.log")


# 문제 1

ctime <- product_c[,1]
click_time <- table(as.numeric(substr(ctime,1,8)))
d.click_time <- data.frame(click_time)[,1]
n.click_time <- data.frame(click_time)[,2]
click_days <- NULL
for(i in d.click_time){
  click_days <- c(click_days, paste(substr(i,1,4),'-',substr(i,5,6),'-',substr(i,7,8),sep=''))
}
click_weekdays <- weekdays(as.POSIXct(click_days))
data.frame(click_weekdays, n.click_time)


# 문제 2

getwd()
review <- read.csv("movie_reviews3.csv")
point <- review$vpoint

table(point)
