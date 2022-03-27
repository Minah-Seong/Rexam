# 문제 1

exam1 <- function(){
  vec <- paste(LETTERS,letters,sep='')
  return(vec)
}
exam1()


# 문제 2

exam2 <- function(x){
  a = 0
  for(i in 1:x){
    a = a + i
  }
  return(a)
}

cat('함수 호출 결과 :', exam2(5))


# 문제 3

exam3 <- function(x,y){
  return(abs(x-y))
}

print(paste('함수 호출 결과 :', exam3(10,20)))


# 문제 4

exam4 <- function(x,y,z){
  if(y == '+'){
    return(x+z)
  }else if(y == '-'){
    return(x-z)
  }else if(y == '*'){
    return(x*z)
  }else if(y == '%/%'){
    if(x==0){
      return('오류1')
    }else if(z==0){
      return('오류2')
    }else{
      return(x%/%z)
    }
  }else if(y=='%%'){
    if(x==0){
      return('오류1')
    }else if(z==0){
      return('오류2')
    }else{
      return(x%%z)
    }
  }else{
    return('규격의 연산자만 전달하세요')
  }
}


# 문제 5

exam5 <- function(x,y='#'){
  if(x < 0){
    print(NULL)
  }else{
    print(rep(y,x))
  }
  return(NULL)
}

exam5(-1,'*')

# ------------------------------------------ 해답

exam5 <- function(num, ch="#"){
  if(num > 0){
    cat(rep(ch, num),'\n', sep='')
  }
  return(NULL)
}


# 문제 6

exam6 <- function(x){
  for(i in x){
    if(is.na(i)){
      cat('NA는 처리 불가', '\n')
    }else if(i >= 85){
      cat(i,'점은 상등급입니다.', '\n')
    }else if(i >= 70){
      cat(i,'점은 중등급입니다.', '\n')
    }else if(i < 70){
      cat(i,'점은 하등급입니다.', '\n')
    }
  }
  return(NULL)
}

exam6(c(80,50,70,66,NA,35))



