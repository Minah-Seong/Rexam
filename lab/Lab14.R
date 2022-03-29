library(showtext)
library(plotrix)
showtext_auto() 
font_add(family = "dog", regular = "fonts/THEdog.ttf")

product_c <- read.table("data/product_click.log")


# 문제 1

product_click <- table(product_c[,2])
clicklog1 <- barplot(product_click, main="세로바 그래프 실습", xlab="상품ID", 
             ylab="클릭수", col=terrain.colors(10), col.main='red',family="dog")


# 문제 2

