
##########################################
### ggplot2 패키지를 활용한 고급시각화 ###
##########################################

library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")



#install.packages("ggplot2") # ggplot2 패키지 설치
library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)

str(mpg)
ggplot(mpg)
ggplot(mpg,aes(displ, hwy))
ggplot(mpg,aes(displ, hwy)) + geom_point()
ggplot(mpg,aes(displ, hwy)) + geom_point() + geom_line()
ggplot(mpg) + geom_point(aes(displ, hwy))
ggplot(mpg) + geom_point(aes(displ, hwy)) + geom_line(aes(displ, hwy))

sketch <- ggplot(data = mpg, aes(x = displ, y = hwy))
str(sketch)

sketch + geom_point()
sketch + geom_line(color="green")
sketch + geom_point() + xlim(3, 6)
sketch + geom_point() + ylim(10, 30)
sketch + geom_point() + xlim(3, 6) + ylim(10, 30)
sketch + geom_point(size=3) + coord_cartesian(xlim=c(3, 6), ylim=c(10, 30))
sketch + geom_point(aes(color=drv))
ggplot(data = mpg, aes(x = displ, y = hwy, color = drv)) + geom_point()


(df_mpg <- mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy)))

# 집계 막대 그래프 - 미리 집계해서 인수로 전달하면 이 값으로 바그래프 그림
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# 빈도 막대 그래프 - 행의 갯수를 그려서 바그래프 그림
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
str(economics)



str(mtcars)
View(mtcars)
table(mtcars$cyl)
summary(mtcars$cyl)
summary(factor(mtcars$cyl))
ggplot(mtcars, aes(x=cyl)) + geom_bar()
ggplot(mtcars, aes(x=cyl)) + geom_bar(width=0.5)
ggplot(mtcars, aes(x=cyl, fill=factor(gear))) + geom_bar(alpha=0.5)
ggplot(mtcars, aes(x=cyl)) + geom_bar(aes(fill=factor(gear)), alpha=1.0)

# 다양한 내장 테마
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_gray()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_bw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_linedraw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_light()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_dark()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_minimal()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_classic()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_void()


imsi <- ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")
str(imsi)
imsi + theme_gray()
imsi + theme_bw()
imsi + theme_linedraw()
imsi + theme_light()
imsi + theme_dark()
imsi + theme_minimal()
imsi + theme_classic()
imsi + theme_void()


str(airquality)
View(airquality)
ggplot(airquality, aes(x=Day, y=Temp))
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=3, color="red")
ggplot(airquality, aes(x=Day, y=Temp, col=factor(Month))) + geom_point(size=2)
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=2, aes(color=factor(Month)))
ggplot(airquality, aes(x=Day, y=Temp, group=Day)) + geom_boxplot()
ggplot(airquality, aes(Temp)) + geom_histogram()


install.packages("xlsx")
library(xlsx)
classDF <- read.xlsx("data/data.xlsx", 1, encoding="UTF-8")
str(classDF)
View(classDF)

bar_data <- classDF[3]
bar_data
str(bar_data)
table(bar_data$bloodType)
ggplot(bar_data, aes(x=bloodType)) + geom_bar()
ggplot(classDF, aes(x=bloodType)) + geom_bar(aes(fill=gender))


# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

# 생성된 coSalesDF 확인
coSalesDF
str(coSalesDF)
# 라인차트 생성 - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line()
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company))
# 선 색상 및 두께 설정
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))+scale_colour_grey()
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))+scale_colour_hue()
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))+scale_colour_manual(values = c("orange", "green"))
# 선의 종류 :  0 = blank, 1 = solid, 2 = dashed, 3 = dotted, 4 = dotdash, 5 = longdash, 6 = twodash
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company), linetype = 3)
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company), linetype = "dotdash")
# 점의 종류와 색상
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = 5)
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = '가')
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = '가', colour = "Red")

library(MASS)
str(Cars93)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, colour="blue")
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue")  
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue", colour="pink") 
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) + geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6, aes(fill=Price)) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  geom_point(colour="grey", shape=21, size=6)

Cars93$Cylinders
Cars93$Price

class(Cars93$Cylinders)
class(Cars93$Price)


ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Oranges") # Oranges  

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Reds") # Reds

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Blues") # Blues


w <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"), 
                weight=c(65,66,64,68,72))
ggplot(data=w, aes(x=year)) + geom_bar()
ggplot(data=w, aes(x=year, y=weight)) + geom_bar() # 갯수를 세서 막대를 그리는게 기본이라.. 에러난다!!
ggplot(data=w, aes(x=year, y=weight)) + geom_col()
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity")
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), colour="blue", stat="identity") + coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight))+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=2)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=-1)+coord_cartesian(ylim=c(60, 75)) + labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게")
ggsave("output/ggplot_test.png") 


ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point()
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + scale_color_manual(values = rainbow(15))
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + scale_color_manual(values = topo.colors(15))
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + scale_color_brewer(palette = 'Set3')
# 범례 행 갯수 설정
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color = guide_legend(nrow = 6))

# 범례 열 갯수 설정
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+ scale_fill_brewer(palette="Reds")+ guides(color = guide_legend(ncol = 2)) 

# 범례 항목들 역순으로
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color = guide_legend(reverse = TRUE))

# 범례 없애기
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color=F)


p1 <- ggplot(data = iris, aes(x = Petal.Width, y= Petal.Length, col=Species)) + geom_point()
p2 <- ggplot(data = iris, aes(x = Sepal.Width, y= Sepal.Length, col=Species)) + geom_point() 
install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1, p2, p1, p2, nrow = 2)
grid.arrange(p1, p2, nrow = 2)
grid.arrange(p1, p2, ncol = 2)

# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p

# 인터랙티브 그래프 만들기
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar()
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
ggplotly(p)

p <- ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point()
ggplotly(p)


p <- ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
ggplotly(p)


# 트리맵 라이브러리 설치
install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)

sales_df <- read.xlsx("data/data.xlsx", 2, encoding="UTF-8")
# 트리맵 그리기
# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 
# product가 region보다 더 상위로 구분이 됨
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황", fontfamily.title="maple", fontfamily.labels="maple")

# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황", fontfamily.title="dog", fontfamily.labels="dog")

dev.copy(png, "output/test.png")
dev.off()