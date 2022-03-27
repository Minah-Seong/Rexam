library(rvest)

site <- "https://comic.naver.com/genre/bestChallenge?&page="
comic.name = NULL
comic.summary = NULL
comic.grade = NULL
for(i in 1:50){
  url <- paste(site, i, sep='')
  comic <- read_html(url)
  # 크롤링
  name <- html_text(html_nodes(comic, 'div.weekchallengeBox > table.challengeList > tr > td > div.challengeInfo > h6 > a'),trim=T)
  comic.name <- c(comic.name, name)
  summary <- html_text(html_nodes(comic, 'div.weekchallengeBox > table.challengeList > tr > td > div.challengeInfo > div.summary'),trim=T)
  comic.summary <- c(comic.summary, summary)
  grade <- html_text(html_nodes(comic, 'div.weekchallengeBox > table.challengeList > tr > td > div.challengeInfo > div.rating_type > strong'),trim=T)
  comic.grade <- c(comic.grade, grade)
}

navercomic <- data.frame(comic.name, comic.summary, comic.grade)

write.csv(navercomic,file='output/navercomic.csv')
