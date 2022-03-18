# 문제 7

iotest2 <- scan("data/iotest2.txt", what="",encoding="UTF-8")
cat('가장 많이 등장한 단어는',names(which.max(table(iotest2))),'입니다.')
