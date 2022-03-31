library(dplyr)
emp <- read.csv("data/emp.csv")
str(emp)


# 1단계

# 문제 1
emp %>% filter(job == "MANAGER")

# 문제 2
emp %>% select(empno, ename, sal)

# 문제 3
emp %>% select(-empno)

# 문제 4
emp %>% select(ename, sal)

# 문제 5
emp %>% group_by(job) %>% summarise(n = n())

# 문제 6
emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename, sal, deptno)

# 문제 7
emp %>% filter(job != 'ANALYST') %>% select(ename, job, sal)

# 문제 8
emp %>% filter(job == 'SALESMAN' | job == 'ANALYST') %>% select(ename, job)

# 문제 9
emp %>% group_by(deptno) %>% summarise(sum_sal = sum(sal))

# 문제 10
emp %>% arrange(sal)

# 문제 11
emp %>% arrange(desc(sal)) %>% head(1)

# 문제 12
emp %>% rename(salary=sal, commrate=comm) -> empnew
str(empnew)

# 문제 13 - 못 품


# 문제 14
emp %>%
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength) %>%
  select(ename, enamelength)

# 문제 15
emp %>% filter(comm != is.na(comm)) %>% summarise(n = n())


# 2단계

# 문제 16

library(ggplot2)

# 1
str(mpg)

# 2
dim(mpg)

# 3
head(mpg, 10)

# 4
tail(mpg, 10)

# 5
View(mpg)

# 6
summary(mpg)

# 7
mpg %>% count(manufacturer)

# 8
mpg %>% group_by(manufacturer, model) %>% summarise(n = n())


# 문제 17

# Q1
mpg %>% rename(city=cty, highway=hwy) -> mpgnew

# Q2
head(mpgnew)


# 문제 18

# Q1
mpg %>% filter(displ <= 4) %>% summarise(hwy=mean(hwy))
mpg %>% filter(displ >= 5) %>% summarise(hwy=mean(hwy))
# 배기량이 4이하인 자동차의 고속도로 연비가 평균적으로 더 높다

# Q2
mpg %>%
  filter(manufacturer == 'audi' | manufacturer == 'toyota') %>%
  group_by(manufacturer) %>%
  summarise(cty=mean(cty))
#toyota의 도시 연비가 평균적으로 더 높다

# Q3
mpg %>%
  filter(manufacturer == 'chevrolet' | manufacturer == 'ford' | manufacturer == 'honda') %>%
  summarise(hwy=mean(hwy))


# 문제 19

# Q1
mpg %>% select(class, cty) -> mpg3
head(mpg3)

# Q2
mpg3 %>% group_by(class) %>% summarise(cty=mean(cty))
# class가 compact인 자동차의 연비가 suv인 자동차의 연비보다 높다


# 문제 20

