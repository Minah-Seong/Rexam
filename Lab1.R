rm(list=ls())

# 문제 1

v1 <- c(1:10)
v2 <- 2*v1
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]
v1;v2;v3;max_v;min_v;avg_v;sum_v


# 문제 2

v4 <- seq(1,9,2)
v5 <- rep(1,5)
v6 <- rep(1:3,3)
v7 <- rep(1:4,each=2)
v4;v5;v6;v7


# 문제 3

nums = sample(1:100,10)
nums

sort(nums)
sort(nums, decreasing = T)
nums[which(nums>50)]
nums[which(nums<=50)]
nums[which.max(nums)]
nums[which.min(nums)]


# 문제 4

v8 <- seq(1,10,3)
names(v8) <- LETTERS[1:4]
v8


# 문제 5

score <- sample(1:20,5)
myFriend <- c('둘리','또치','도우너','희동','듀크')
paste(score,myFriend,sep='-')

names(score) <- myFriend

names(score)[which.max(score)]
names(score)[which.min(score)]
names(score)[which(score>10)]


# 문제 6

count <- sample(1:100,7)
week.korname <- c('일요일','월요일','화요일','수요일','목요일','금요일','토요일')
paste(week.korname,count,sep=' : ')

names(count) <- week.korname
count

names(count)[which.max(count)]
names(count)[which.min(count)]
names(count)[which(count>50)]



# 문제 7

v9 <- c(sample(1:30,10,replace = T))
v9
v10 <- c(sort(tail(letters,10),decreasing=T))
names(v9) <- v10
v9;v10





























