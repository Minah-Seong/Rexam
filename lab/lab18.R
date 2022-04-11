library(tidyr)
library(dplyr)
library(ggplot2)
library(tm)
library(proxy)

### 문제1
grade <- read.csv("data/성적2.csv", fileEncoding="UTF-8")
# 그림1
View(grade)
# 그림2
png("output/result1-2.png", width=960, height=540)
boxplot(grade[,c(3:4)], range=1)$stat
dev.off()
# 그림3
grade[,4] <- ifelse(grade[,4] < 0 | grade[,4] > 10, round(mean(grade[,4], na.rm = T)), grade[,4])
View(grade)
# 그림4
grade <- grade %>%
           fill(국어, .direction = "updown") %>%
           fill(수학, .direction = "updown")
View(grade)
# 그림5
ggplot(grade,aes(국어, 수학)) +
  geom_point(size=3, aes(fill="3", color=성명)) +
  labs(fill="Size")
ggsave("output/result1-5.png", dpi=100)


### 문제2
data <- read.csv("data/reshapedata.csv")
# 1.
longdata <- data %>% gather(exam, jumsu, -name, -num)
View(longdata)
# 2.
widedata <- longdata %>% spread(exam, jumsu)
View(widedata)
# 3.
result <- longdata %>% separate(col = "exam",
                                into = c("subname", "subnum"),
                                sep = "\\.")
View(result)

### 문제3
survey_fruit <- c("사과 포도 망고",
                  "포도 자몽 자두",
                  "복숭아 사과 포도",
                  "오렌지 바나나 복숭아",
                  "포도 바나나 망고",
                  "포도 귤 오렌지")
survey_fruit

#1.
corpus <- VCorpus(VectorSource(survey_fruit))
dtm <- DocumentTermMatrix(corpus, control=list(wordLengths = c(1, Inf)))
(m <- as.matrix(dtm))
row.names(m) <- c("듀크", "둘리", "또치", "도우너", "길동", "희동")
docscom <- m %*% t(m)
# 듀크-또치, 듀크-길동
docscom
dist(docscom, method="cosine")

#2. 3.
tdm <- TermDocumentMatrix(corpus, control=list(wordLengths = c(1, Inf)))
m2 <- as.matrix(tdm)
fruitcom <- m2 %*% t(m2)
fruitcom
# 2. 포도 / 3. 귤, 자두, 자몽
sort(diag(fruitcom), decreasing=T)
