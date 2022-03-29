rm(list=ls())

library(showtext)
library(plotrix)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")

product_c <- read.table("data/product_click.log")



# 문제 1

product_click <- table(product_c[,2])
clicklog1 <- barplot(product_click, main="세로바 그래프 실습", xlab="상품ID", 
             ylab="클릭수", col=terrain.colors(10), col.main='red',family="dog")

dev.copy(png, "output/clicklog1.png") 
dev.off()


# 문제 2

ctime <- product_c[,1]
click_time <- table(as.numeric(substr(ctime,9,10)))
n.click_time <- data.frame(click_time)[,2]
result <- NULL
xnames <- NULL
for (i in 0:length(n.click_time)){
  lastnum <- n.click_time[i+1]
  if (is.na(lastnum)){
    lastnum <- 0
  }
  result <- c(result, n.click_time[i]+lastnum)
  xnames <- c(xnames, paste(i,'~',i+1))
}
xnames <- c(xnames, paste(length(xnames),'~',length(xnames)+1))
xnames <- xnames[-7:-8]
str(result)
str(xnames)


pie(result, col=rainbow(20), main='파이그래프 실습', labels=xnames, 
    col.main='blue', cex.main=2, family="dog")

dev.copy(png, "output/clicklog2.png") 
dev.off()


# 문제 3

성적 <- read.table("data/성적.txt", header=TRUE)
성적$성명 <- c('길동', '둘리', '또치', '도우너', '희동', '듀크', '턱시', '토토로', '올라프', '우디')
score <- 성적[3:5]


barplot(t(score), main='학생별 점수', names.arg=성적$성명, col=cm.colors(3), col.main='magenta', cex.main=2.2, family="dog")
legend(11,30, names(score), cex=0.8, fill=cm.colors(3))

dev.copy(png, "output/clicklog3.png") 
dev.off()
