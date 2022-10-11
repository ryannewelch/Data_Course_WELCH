#look at data from Mike for final project

#every new "thing" you do deserves to be its own R project in a folder on your computer

#exams new folder on your laptop and then put it there when you make your new project and it asks you where to put it

#inside folder make other folders to organize data, R code, output etc.

##learning about functions##
library(tidyverse)

x <- 1:10
sum(x)

my_sum <- function(x){sum(x,na.rm = TRUE)}
y <- c(1:3,NA)

sum(y)
my_sum(y)


mpg

function_1 <- function(x=mpg){
ggplot(x,aes(x=displ,y=cty))+geom_point()
}


function_2 <- function(x,var1,var2){
  
  library(tidyverse)
  
  x <- as.data.frame()
  
  if(!is.data.frame(x)){stop("x must be a data frame, you moron!")}
  if(!is.character(var1)){stop("var1 is not a character, you idiot!")}
  if(!is.character(var2)){stop("var1 is not a character, you idiot!")}
  
  ggplot(x,aes(x=x %>% pluck(var1),
               y=x %>% pluck(var2)))+
    geom_point()+
    labs(x=var1,
         y=var2)+
    theme_minimal()
  }

function_2(mpg,5,"city")

function_2(mpg,"hwy","cty")

function_2(iris,"Sepal.Length","Sepal.Width")

#take vector of numbers
#calculate the absolute difference between the difference between each number and the minimum value

abs_min_diff <- function(x){
  if(!is.numeric(x)){stop("x must be a numeric vector,loser")}
  abs(x-min(x))
}

abs_min_diff(-10:10)


df <- read_csv(".Data/Utah_Religions_by_County.csv") %>% 
  janitor::clean_names()


#give county name and it returns the religion with maximum proportion

max_religion <- function(dat,county){
  dat %>% 
    filter(county==county) %>% 
    filter(value==max(value)) %>% 
    pluck("name")
}

max_religion(df,"Beaver County")


#county with max of "x" religion

max_county <- function(dat,religion){
  
  dat %>% 
  filter(name==religion) %>% 
  filter(value==max(value)) %>% 
  pluck("county")
}

max_county(df,"lds")
