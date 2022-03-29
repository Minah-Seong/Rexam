# 문제 1

library(KoNLP)

movie <- read.csv("data/movie_reviews3.csv")
movie_reviews <- movie$vreview
movie_reviews <- gsub("[[:digit:][:punct:]]|[ㄱ-ㅎ]|[ㅏ-ㅣ]|[A-Za-z]", "", movie_reviews)
noun_table <- data.frame(head(sort(table(unlist(extractNoun(movie_reviews))), decreasing=T), 10))
wname <- noun_table$Var1
wcount <- noun_table$Freq
movie_top_word <- data.frame(wname, wcount)
write.csv(movie_top_word, "output/movie_top_word.csv")


# 문제 2

library(wordcloud2)

bookdata <- readLines("yes24.txt")
bookreview <- gsub("[^[가-힣| ]", "", yes24)
words <- unlist(extractNoun(bookreview))
new_words <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, words)
word_list <- data.frame(sort(table(new_words), decreasing = T))
yes24 <- wordcloud2(word_list, fontFamily = "휴먼옛체")
htmltools::save_html(yes24,"output/yes24.html")
