# OPEN API 실습 1

library(httr)
library(XML)
library(jsonlite)

searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode("맛집")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- xmlParse(doc, encoding="UTF-8")
naverblog<- xpathSApply(doc2, "//item/description", xmlValue)
naverblog <- gsub("</?b>", "", naverblog)
naverblog
write(naverblog, "output/naverblog.txt")


# OPEN API 실습 2

API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "3315"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
busRouteId <- xpathSApply(doc, "//itemList/busRouteId", xmlValue)
length <- xpathSApply(doc, "//itemList/length", xmlValue)
stStationNm <- xpathSApply(doc, "//itemList/stStationNm", xmlValue)
edStationNm <- xpathSApply(doc, "//itemList/edStationNm", xmlValue)
term <- xpathSApply(doc, "//itemList/term", xmlValue)
cat("[ 3315번 버스 정보 ]", "\n", "노선ID :", busRouteId, "\n", "노선길이 :", length, "\n",
     "기점 :", stStationNm, "\n", "종점 :", edStationNm, "\n", "배차간격 :", term)


# OPEN API 실습 3

searchUrl <- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100")
json.doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

data <- content(json.doc, type = 'text', encoding = "UTF-8")
news <- fromJSON(data)
str(news)

navernews <- news$items$title
navernews <- gsub("</?b>|&[a-z]+;", "", navernews)
write(navernews, "output/navernews.txt")
