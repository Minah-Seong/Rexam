# 문제 1

grade <- sample(1:6,1)
if(grade<=3){
  cat(grade,"학년은 저학년입니다.")
}else{
  cat(grade,"학년은 고학년입니다.")
}


# 문제 2

choice <- sample(1:6,1)
if(choice==1){
  cat('결과값 :',300+50)
}else if(choice==2){
  cat('결과값 :',300-50)
}else if(choice==3){
  cat('결과값 :',300*50)
}else if(choice==4){
  cat('결과값 :',300/50)
}else{
  cat('결과값 :',300%%50)
}
 

# 뮨제3

count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco==1){
  rep('*',count)
}else if(deco==2){
  rep('$',count)
}else{
  rep('#',count)
}
  

# 문제 4

score <- sample(0:100,1)
if(score >= 90){
  level ='A 등급'
}else if(score >= 80){
  level ='B 등급'
}else if(score >= 70){
  level ='C 등급'
}else if(score >= 60){
  level ='D 등급'
}else{
  level ='F 등급'
}

cat(score,'점은',switch(EXPR=level,'A 등급'='A','B 등급'='B','C 등급'='C','D 등급'='D','F 등급'='F'),'등급입니다.')

# 해답

score <- sample(0:100,1);score
score_ten <- paste(score %/% 10);score_ten
grade <- switch(EXPR=score_ten,
                '10'=,
                '9'='A',
                '8'='B',
                '7'='C',
                '6'='D',
                'F');grade
cat(score,'점은',grade,'등급입니다.')


# 문제 5 

alpha <- paste(LETTERS,letters,sep='')
alpha
  
  
  
  

