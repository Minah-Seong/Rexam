library(rvest)

url<- "https://news.daum.net/"
news <- read_html(url)

newstitle <- html_text(html_nodes(news, 'ul.list_newsissue > li > div >  div > strong.tit_g > a.link_txt'),trim=T)
newstitle
newscategory <- html_text(html_nodes(news, 'ul.list_newsissue > li > div >  div > span > span.txt_category'))
newscategory

daumnews <- data.frame(newstitle,newscategory)
View(daumnews)

getwd()
write.csv(daumnews,file='daumnews.csv')
