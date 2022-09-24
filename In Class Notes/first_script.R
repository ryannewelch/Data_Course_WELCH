list.files
?list.files
x <- list.files(recursive = TRUE,include.dirs = TRUE,
           full.names = TRUE,pattern = "ugly",ignore.case = TRUE,path = "~/Desktop")


x <- list.files(pattern = ".csv",recursive = TRUE)
x[1]
y <- x[1]

?readLines

readLines(y)[1:3]

?read.csv
z <- read.csv(y)


z$IATA_CODE[3]

myvec <- c(1,3,5,7,9)

z$IATA_CODE[myvec]





list.files(recursive = TRUE,pattern = "grade",ignore.case = TRUE,
           full.names = TRUE)

grades <- read.csv("./Data/Fake_grade_data.csv")
class(grades)
#data framws with []: [row,col]
grades[3,c(1,3,5)]


#list of students who have > 15 on ass 1

grades$Assignment_1>15

grades$Student[grades$Assignment_1>15]






x
c("a","c","e")

# TRUE + 1
# FALSE +1
# 1/FALSE
