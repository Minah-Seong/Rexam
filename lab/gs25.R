library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
url <- "http://gs25.gsretail.com/gscvs/ko/products/event-goods"
remDr$navigate(url)
Sys.sleep(1)

goodsname = NULL
goodsprice = NULL

twotoone<-remDr$findElement(using='css selector', 'a#TWO_TO_ONE')
twotoone$clickElement()
Sys.sleep(1)
page <- 1

repeat{
  # 상품 이름
  dome1 <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  gname <- sapply(dome1, function(x) {x$getElementText()})
  goodsname <- c(goodsname, unlist(gname))
    
  # 상품 가격
  dome2 <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div p.price > span')
  gprice <- sapply(dome2, function(x) {x$getElementText()})
  gprice_n <- gsub("원|,", "", gprice)
  goodsprice <- c(goodsprice, gprice_n)
  
  
  if(page == 10){
    page <- 1
    nextPagecss <- "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(9) > div.paging > a.next"
  }
  else{
    page <- page+1;
    nextPagecss <- paste("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(9) > div.paging > span > a:nth-of-type(",page,")", sep="")
  }
  
  nextPageLink<-remDr$findElements(using='css selector',nextPagecss) 
  if(length(nextPageLink) == 0) 
    break
  remDr$executeScript("arguments[0].click();",nextPageLink);
  Sys.sleep(1)
  
}
gs25_twotoone <-data.frame(goodsname, goodsprice)
write.csv(gs25_twotoone,"output/gs25_twotoone.csv")
