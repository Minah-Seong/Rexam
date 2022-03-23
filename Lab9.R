library(rvest)

url<- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text


# <h1> 태그의 컨텐츠

title <- html_text(html_nodes(text, "h1"))
title


# <a> 태그의 컨텐츠와 href 속성값

link = html_nodes(text, 'a')
a.href = html_attr(link, 'href')
a.href


# <img> 태그의 src 속성값

image = html_nodes(text, 'img')
img.src = html_attr(image, 'src')
img.src


# 첫번째 <h2> 태그의 컨텐츠

subtitle1 <- html_text(html_nodes(text, "h2:nth-of-type(1)"))
subtitle1


# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠

green <- html_nodes(text, "ul > li:nth-child(3)")
html_text(green)

# 해답 ---------------------------------

green <- html_nodes(text, "ul > [style$=green]") #속성명 = 속성값 / [] : 찾아라 / $ > 끝이 ~로 끝나는
html_text(green)



# 두번째 <h2> 태그의 컨텐츠

subtitle2 <- html_text(html_nodes(text, "h2:nth-of-type(2)"))
subtitle2


# <ol> 태그의 모든 자식 태그들의 컨텐츠 

olitem <- html_text(html_nodes(text, "ol > li"))
olitem


# <table> 태그의 모든 자손 태그들의 컨텐츠

taitem <- html_nodes(text, "table * ")
html_text(taitem)


# name 이라는 클래스의 속성을 갖는 <tr> 태그의 컨텐츠

cont <- html_text(html_nodes(text, 'tr.name'))
cont


# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠

td <- html_text(html_nodes(text, 'td#target'))
td









