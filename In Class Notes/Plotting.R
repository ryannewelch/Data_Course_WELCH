library(tidyverse) # load package, first step

# load data
data("iris")

# rename the iris object
df <- iris

# plot (most powerful plotting tool)
ggplot(data=df,
       mapping = aes(x=Petal.Length,
                     y=Petal.Width,
                     color=Species,
                     shape=Species,
                     size=Sepal.Length)) +
  geom_point() + 
  geom_smooth(method="lm")


ggplot(data=df,
       mapping = aes(x=Sepal.Length,
                     y=Petal.Length,
                     color=Sepal.Width,
                     shape=Species))+
  geom_point()+
  geom_smooth()+
  theme_minimal()

#alpha refers to transparencey
#aes is components of the graph
#geom the things that get drawn based on aesthetics

?geom_density #to figure out specific needs
#copy HEX code for color of fill
# aesthetics NEED to be the name of a column in your data frame

ggplot(df,
       aes(x=Sepal.Length,y=Sepal.Width,color=Species))+
  geom_point()+
  geom_smooth(method = lm,se=FALSE)

#read_csv faster and safer checking than read.csv


mtcars
