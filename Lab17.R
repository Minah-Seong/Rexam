library(dplyr)
library(ggplot2)
library(treemap)

library(showtext)
showtext_auto() 
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")


# 문제 1

ggplot(mpg,aes(cty, hwy)) + geom_point(color='blue')


# 문제 2

ggplot(mpg, aes(x = class, fill=drv)) + geom_bar()


# 문제 3

product_click <- read.table('data/product_click.log')
names(product_click) <- c('v1', 'v2')
ggplot(product_click, aes(x = v2, fill=v2)) + 
  geom_bar() + 
  labs(x="상품ID", y="클릭수", title="제품당 클릭수", subtitle="제품당 클릭수를 바그래프로 표현")


# 문제 4

data("GNI2014")
str(GNI2014)
?treemap
treemap(GNI2014, vSize="population", index=c("continent", "iso3"), title="전세계 인구 정보", fontfamily.title="maple", fontsize.title=20, border.col="green")

dev.copy(png, "output/result4.png")
dev.off()