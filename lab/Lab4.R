# 문제 1

L1 <- list('scott',3000)
L1
names(L1) <- c('name','sal')
result1 <- L1[[2]]


# 문제 2

L2 <- list('scott',c(100,200,300))
L2


# 문제 3

L3 <- list(c(3,5,7), c('A', 'B', 'C'))
L3[[2]][1] <- 'Alpha'
L3


# 문제 4

L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4[[1]]*10


# 문제 5

emp <- read.csv('data/emp.csv')
L5 <- list(data1 = LETTERS, 
           data2 = head(emp,n=3),
           data3 = L4)

L5$data1[1]
L5$data2$ename
L5$data3$gamma


# 문제 6

L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(unlist(L6))













