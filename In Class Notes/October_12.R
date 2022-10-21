# list in R

library(tidyverse)
library(janitor)

# what is a list?
#different from a vector, everything in a vector has to be the same class
# [[]] is always a list
#don't have to be same length or class
#data frame is technically a list ($) , it's uniform in length
#can make list of data frames

class(1:10)
(c(1,2,3,"a"))[3]

list("a",2,TRUE,c(1,2,3))

x <- list(sentences=sentences,
          letters=letters,
          numbers=1:10,
          iris=iris,
          whatever=TRUE)
x$sentences

#purr is for working with lists, is loaded in tidyverse, map and relatives are in purr

map(x,1) %>% class
map(x,1) %>% map_chr(1)


str_split(sentences," ") %>% 
  map_chr(1) %>% 
  table() %>% 
  as.data.frame() %>% 
  arrange(desc(Freq))


files <- list.files("./Data/data-shell/names",
           recursive = TRUE,
           full.names = TRUE,
           pattern = "adjustment")

read_clean<- function(x){read_csv(x) %>% clean_names()} #read 'em and clean 'em


dfs <- map(files,read_clean) #read 'em all in
df<- reduce(dfs,full_join) #combine all the suckers into a list
df %>% head()

read_clean #function without "" will give you the code


#model: simplified version of something real, smaller easier to understand




x %>% names
x %>% length()
x[[1]][740]
x[[4]][1,1]
x[[4]][[1]] %>% class
x[[4]][1] %>% class
x$iris[[1]]
x[["iris"]]


clean_up_commas_etc <- function(x){
  x %>% str_remove(",") %>% 
    str_remove("\\.")
}

#\\ means interpret literally

sentences %>% 
  str_split(" ") %>% 
  map(str_to_lower) %>% 
  map(clean_up_commas_etc) %>% 
  unlist() %>% 
  table() %>% 
  as.data.frame() %>% 
  arrange(desc(Freq)) %>% 
  head()


