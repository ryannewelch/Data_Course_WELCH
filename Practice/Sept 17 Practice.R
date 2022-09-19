library(tidyverse)
data(iris)

ggplot(iris,
       aes(x=Petal.Width,
           y=Sepal.Width,
           color=Species))+
  geom_point()
