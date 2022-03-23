# 문제 1

v <- sample(1:26,10)
sapply(v, function(a) LETTERS[a])


# 문제 2

getwd()
memo <- readLines("data/memo.txt", encoding = "UTF-8")
memo[1] <- gsub("[&$!#@%]", "", memo[1]) 
memo[2] <- gsub("e", "E", memo[2])
memo[3] <- gsub("[[:digit:]]", "", memo[3])
memo[4] <- gsub("[[:lower:][:upper:]]", "", memo[4])
memo[5] <- gsub("[!<>]|[[:digit:]]", "", memo[5])
memo[6] <- gsub("[[:space:]]", "", memo[6]) 
memo[7] <- tolower(memo[7])


# 문제 3

birth <- as.Date('1996/06/08')
format(birth,'%Y년 %m월 %d일 %A')


