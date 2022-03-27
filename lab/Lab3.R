rm(list=ls())

# 문제 1

str(iris)


# 문제 2

x <- c(1:5)
y <- seq(2,10,2)
df1 <- data.frame(x,y)


# 문제 3

col1 <- c(1:5)
col2 <- letters[1:5]
col3 <- c(6:10)
df2 <- data.frame(col1,col2,col3)


# 문제 3

제품명 <- c('사과','딸기','수박')
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(제품명,가격,판매량)
df3

mean(df3$가격)
mean(df3$판매량)


# 문제 4

name <- c('Potter','Elsa','Gates','Wendy','Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name,gender,math)
str(df4)

# (a)
stat <- c(76,73,95,82,35)
df4 <- cbind(df4,stat)

# (b)
score <- df4$math+df4$stat
df4 <- cbind(df4,score)

#(c)
df4$grade<-ifelse(df4$score >= 150,"A", ifelse(df4$score >= 100,"B", ifelse(df4$score >=70,"C","D")))


# 문제 7



myemp <- read.csv("data/emp.csv")
str(myemp)
summary(myemp)
View(myemp)

attach(myemp)


# 문제 8

myemp[c(3,4,5),]


# 문제 9

myemp[,-4]


# 문제 10

ename


# 문제 11

myemp[,c('ename','sal')]


# 문제 12

myemp[job=='SALESMAN',c('ename','sal','job')]


# 문제 13

subset(myemp, sal >= 1000 & sal <= 3000, c('ename','sal','deptno'))


# 문제 14

subset(myemp, job != 'ANALYST', c('ename','job','sal'))


# 문제 15

subset(myemp, job=='ANALYST' | job=='SALESMAN', c('ename','job'))


# 문제 16

subset(myemp, is.na(comm), c('ename','sal'))


# 문제 17

myemp[order(sal),]


# 문제 18

dim(myemp)
str(myemp)
summary(myemp)


# 문제 19


myemp$deptno <- as.factor(deptno)
summary(myemp$deptno)



# 문제 20

myemp$job <- as.factor(job)
summary(myemp$job)














