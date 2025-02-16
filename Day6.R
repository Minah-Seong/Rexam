# 정규표현식의 기능과 작성방법 점검
# gsub() : 대체하는 함수
word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word)
gsub("[^1234567890]", "", word) 
gsub("\\D", "", word)
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:space:][:punct:]]", "", word)
gsub("[^[:space:][:punct:]]", "", word)
gsub("[[:punct:][:digit:][:space:]]", "", word) 

word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word)
sub(" ", "@", word)
gsub("Aa", "", word) 
gsub("Aa{2}", "", word) 
gsub("(Aa){2}", "", word)
gsub("[Aa]", "", word) 


#문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x)
length(x)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", start=1, stop=1)
substr("Data Analytics", 3, 3)
substr("Data Analytics", start=2, stop=7)
substr("Data Analytics", 6, 14)
# substr("Data Analytics", start=2)
substr("Data Analytics", start=c(1,6), stop=c(4, 14))

substring("Data Analytics", first=6)
substring("Data Analytics", first=6, last=10)
substring("Data Analytics", first=c(1,6), last=c(4, 14))
substring("abcdef", 1:6, 1:6)


classname <- c("Data Analytics", "Data Mining", 
               "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", 
               "China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

?iris
?islands
str(islands)
head(islands)
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses)

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt)

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
x <- gsub(".csv", "", x)
x

gsub("[ABC]", "@", "123AunicoBC98ABC")
gsub("ABC", "@", "123AunicoBC98ABC")
gsub("(AB)|C", "@", "123AunicoBC98ABC")
gsub("A|(BC)", "@", "123AunicoBC98ABC")
gsub("A|B|C", "@", "123AunicoBC98ABC")

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat", "mycheese")

grep("che", words, value=T) # 포함하는 원소들의 값들로 구성된 벡터 리턴
grep("che", words) # 포함하는 원소들의 인덱스들로 구성된 벡터 리턴
grep("at", words, value=T)
grep("[ch]", words, value=T)
grep("[at]", words, value=T)
grep("ch|at", words, value=T)
grep("ch(e|i)ck", words, value=T)
grep("chase", words, value=T)
grep("chas?e", words, value=T) 
grep("chas*e", words, value=T) 
grep("chas+e", words, value=T) 
grep("ch(a*|e*)se", words, value=T)
grep("^c", words, value=T)  #[^....]  -> 부정   ^xxx  -> 시작
grep("t$", words, value=T)  # xxx$  -> 종료
grep("^c.*t$", words, value=T)
grep( "^[^c]+$", words, value=T)

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE)
grep("\\D", words2, value=TRUE)
grep("\\s", words2, value=TRUE)


# 문자열을 분리자(기본:공벡문자)로 분리하는 함수 : strsplit()

fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ")
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
(littleprince <- c(p1, p2, p3))
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]


# 날짜와 시간 관련 기능을 지원하는 함수들

(today <- Sys.Date())
str(today)
class(today)
format(today, "%Y년 %m월 %d일")
format(today, "%d일 %B %Y년")
format(today, "%B %b %m")
format(today, "%y")
format(today, "%Y")
format(today, "%B")
format(today, "%b")
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date(); str(Sys.)
Sys.time();str(Sys.time());class(Sys.time())
Sys.timezone()

as.Date('1/17/2022') # 에러발생
as.Date('2022/1/17') # 잘 인식한다.
as.Date('2022-1-17') 
as.Date('2022-01-17') 
as.Date('2022년 1월 17일') 
as.Date('1/12/2022',format='%m/%d/%Y') # format 은 생략 가능
as.Date('2022년 1월 17일', '%Y년 %m월 %d일') 
as.Date('1월 17, 2022',format='%B %d, %Y')
as.Date('110228',format='%d%b%y') 
as.Date('110228',format='%y%m%d') 
as.Date('11228',format='%d%b%y') 

x1 <- "2022-01-17 09:00:00"
# 문자열을 날짜형으로
d <- as.Date(x1, "%Y-%m-%d %H:%M:%S") 
d
class(d)
# 문자열을 날짜+시간형으로
t <- strptime(x1, "%Y-%m-%d %H:%M:%S")
t
class(t)
strptime('2022-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")

as.POSIXlt("2022/01/01 10:30:11",format="%Y/%m/%d %S:%M:%H")

as.Date("2022/01/01 08:00:00") - as.Date("2022/01/01 05:00:00")
as.POSIXct("2022/01/01 08:00:00") - as.POSIXct("2022/01/01 05:00:00")
as.POSIXlt("2022/01/01 08:00:00") - as.POSIXlt("2022/01/01 05:00:00")

ct<-Sys.time()
lt<-as.POSIXlt(ct)
str(ct) 
str(lt) 
unclass(ct) 
unclass(lt) 
lt$mon+1
lt$hour
lt$year+1900

?as.POSIXlt

as.POSIXct(1449894438,origin="1970-01-01")
as.POSIXlt(1449894438,origin="1970-01-01")

as.POSIXlt("2022/05/01")$wday
as.POSIXlt("2022/05/02")$wday
as.POSIXlt("2022/05/03")$wday
as.POSIXlt("2022/05/04")$wday
as.POSIXlt("2022/05/05")$wday

#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2022-12-25")
weekdays(christmas2)
christmas2$wday
#2022년 1월 1일 어떤 요일
tmp<-as.POSIXct("2022-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
cat("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.\n",sep="")
format(tmp,'오늘은 %Y년 %B %d일 %A입니다')



