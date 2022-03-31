rm(list=ls())

library(showtext)
library(plotrix)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

product_c <- read.table("data/product_click.log")
product_click <- product_c[,1]

# 문제 1

click_days <- table(as.POSIXlt(paste(substr(product_click,1,4),'-',substr(product_click,5,6),'-',substr(product_click,7,8),sep=''))$wday)
names(click_days) <- c('월요일','화요일','수요일','목요일','금요일','토요일')



par(mfrow=c(1, 2))
plot(click_days,
     main="요일별 클릭 수",
     ylim=c(0, 300),
     ylab="",
     col="orange",
     type="o",
     lwd=4,
     family="cat",
     cex.main=2.5)
barplot(click_days,
        main="요일별 클릭 수",
        ylim=c(0, 300),
        col=topo.colors(6),
        family='cat',
        cex.main=2.5)

dev.copy(png, "output/clicklog4.png")
dev.off()


# 문제 2

review <- read.csv("movie_reviews3.csv")
point <- review$vpoint

png(filename="output/clicklog5.png", height=400, width=1000, bg="white")

par(mfrow=c(1, 3))
hist(point,
     main='영화 평점 히스토그램(auto)',
     family='maple',
     xlab="평점",
     ylab="평가자수",
     col=heat.colors(10))
hist(point,
     main='영화 평점 히스토그램(1~5,6~10)',
     breaks=2,
     xlab="평점",
     ylab="평가자수",
     family='maple',
     col=cm.colors(2))
hist(point,
     main='영화 평점 히스토그램(1~5,6,7,8,9,10)',
     freq=T,
     breaks=c(1,5,6,7,8,9,10),
     ylim=c(0,500),
     xlab="평점",
     ylab="평가자수",
     family='maple',
     col.main='red')

dev.off()


# 문제 3

one <- read.csv("data/one.csv")


par(mfrow=c(1, 1))
boxplot(one$X1인가구~one$구별,
        col.main='orange',
        axes=FALSE,
        ann=FALSE,
        col=cm.colors(25))
axis(1, at=1:25, lab=names(table(one$구별)), family="maple", las=2) 
axis(2, at=seq(0,10000,2000), family="maple", las=2) 
title(main="구별 1인가구", col.main="orange", family="maple", cex.main=2)
box()

dev.copy(png, "output/clicklog6.png")
dev.off()










