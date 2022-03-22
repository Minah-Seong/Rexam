# 문제 1

countEvenOdd <-function(x){
  nums <- list()
  even_vec <- c()
  odd_vec <- c()
  if(is.vector(x)  && !is.list(x) && is.numeric(x)){
    for(i in x){
      if(i %% 2 == 0){
        even_vec <- c(even_vec, i)
      }else{
        odd_vec <- c(odd_vec, i)
      }
    }
    nums$even <- length(even_vec)
    nums$odd <- length(odd_vec)
    return(nums)
  }else{
    return(NULL)
  }
}

countEvenOdd(c(1:9))


# 문제 2

vmSum <- function(x){
  if(is.vector(x) && !is.list(x)){
    if(is.numeric(x)){
      result <- sum(x)
    }else{
      result <- '숫자 벡터를 전달하숑!'
    }
  }else{
    result <- '벡터만 전달하숑!'
  }
  return(result)
}

vmSum(c(1,2,3))
vmSum(c('1','2','3'))
vmSum(list(1:3))


# 문제 3

vmSum2 <- function(x){
  if(is.vector(x) && !is.list(x)){
    if(is.numeric(x)){
      result <- sum(x)
    }else{
      warning('숫자 벡터를 전달하숑!')
      result <- 0
    }
  }else{
    stop('벡터만 전달하숑!')
  }
  return(result)
}

vmSum2(c(1,2,3))
vmSum2(c('1','2','3'))
vmSum2(list(1:3))


# 문제 4

mySum <-function(x){
  nums <- list()
  even_vec <- c()
  odd_vec <- c()
  if(is.vector(x)  && !is.list(x) && is.numeric(x)){
    for(i in x){
      if(is.na(i)){
        i <- min(x, na.rm=T)
        warning('NA를 최저값으로 변경하여 처리함!!')
      }
      if(i %% 2 == 0){
        even_vec <- c(even_vec, i)
      }else{
        odd_vec <- c(odd_vec, i)
      }
    }
    nums$evenSum <- sum(even_vec)
    nums$oddSum <- sum(odd_vec)
    return(nums)
  }else{
    stop('벡터만 처리 가능!!')
  }
}

mySum(c(1,3,NA,5,7,9))

# 문제 5

myExpr <- function(x){
  if(is.function(x)){
    return(x(sample(1:45,6)))
  }else{
    stop('수행 안할꺼임!!')
  }
}


# 문제 6

createVector1 <- function(...){
  result <- c(...)
  for(i in result){
    if(is.na(i)){
      result <- NA
    }
  }
  return(result)
}

createVector1(c(1,NA,3))


# 문제 7

createVector1 <- function(...){
  a <- list(...)
  result <- list()
  for(i in a){
    if(is.numeric(i)){
      result$num <- c(result$num, i)
    }else if(is.character(i)){
      result$chr <- c(result$chr, i)
    }else{
      result$logic <- c(result$logic, i)
    }
  }
  return(result)
}

createVector1(T,'hello',c(12,3),7,8,F)
