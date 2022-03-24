library(rvest)

comic <- read_html("https://comic.naver.com/genre/bestChallenge.nhn")

comic.name <- html_text(html_nodes(comic, 'div.weekchallengeBox > table.challengeList > tr > td > div.challengeInfo > h6 > a'),trim=T)
comic.name

comic.summary <- html_text(html_nodes(comic, 'div.weekchallengeBox > table.challengeList > tr > td > div.challengeInfo > div.summary'),trim=T)
comic.summary

comic.grade <- html_text(html_nodes(comic, 'div.weekchallengeBox > table.challengeList > tr > td > div.challengeInfo > div.rating_type > strong'),trim=T)
comic.grade

navercomic <- data.frame(comic.name, comic.summary, comic.grade)
View(navercomic)
