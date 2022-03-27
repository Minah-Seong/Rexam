library(RSelenium)

story_point = NULL
story_recommend = NULL
story_text = NULL
 
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open() 
remDr$navigate("https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700")

# 점수 크롤링
point1<-remDr$findElements(using='css selector', 'div.story-point')
story_p <- sapply(point1, function(x) x$getElementText())
story_point <- c(story_point, unlist(story_p))

# 추천 크롤링
recommend1<-remDr$findElements(using='css selector', 'div.story-recommend')
story_r <- sapply(recommend1, function(x) x$getElementText())
story_recommend <- c(story_recommend, unlist(story_r))

# 추천 크롤링
s.text1<-remDr$findElements(using='css selector', 'div.story-txt')
story_txt <- sapply(s.text1, function(x) x$getElementText())
story_text <- c(story_text, unlist(story_txt))

for(i in 2:10){
  nextCss <- paste("#contentData >div>div.movie-idv-story>nav.pagination>a:nth-child(",i,")", sep="")
  nextListLink<-remDr$findElement(using='css selector',nextCss)
  nextListLink$clickElement()
  Sys.sleep(1)
  
  # 점수 크롤링
  point2<-remDr$findElements(using='css selector', 'div.story-point')
  story_p <- sapply(point2, function(x) x$getElementText())
  story_point <- c(story_point, unlist(story_p))
  
  # 추천 크롤링
  recommend2<-remDr$findElements(using='css selector', 'div.story-recommend')
  story_r <- sapply(recommend2, function(x) x$getElementText())
  story_recommend <- c(story_recommend, unlist(story_r))
  
  # 추천 크롤링
  s.text2<-remDr$findElements(using='css selector', 'div.story-txt')
  story_txt <- sapply(s.text2, function(x) x$getElementText())
  story_text <- c(story_text, unlist(story_txt))
}

movie <- data.frame(story_point,story_recommend,story_text)
View(movie)
write.csv(movie, "output/movie.csv")
