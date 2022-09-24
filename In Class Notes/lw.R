x<-read.csv("./Data/lw.csv")

x$Area <- x$Length *x$Width #we created a new vector as part of x #never touch raw data
x$LastNAme <- "Smith"

x$FullNAme <- paste0(x$Name," ",x$LastNAme)
x$FullNAme2 <- paste0(x$LastNAme,",",x$Name)

plot(x$Width,x$Area)

cor(x$Length*x$Width,x$Area)

x$LastNAme<-NULL #remove a column
