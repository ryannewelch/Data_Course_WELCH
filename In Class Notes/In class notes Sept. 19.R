library(tidyverse)
ggplot(iris,
       aes(x=Sepal.Width,
           y=Sepal.Length,
           color=Species)) +
  geom_point() +
  geom_smooth(data = iris[iris$Species != "setosa",],
              method="lm",
              se=FALSE) +
  labs(x="Sepal width",
       y="Sepal length") +
  theme_bw() +
  theme(legend.text = element_text(face="italic"))


ggplot(mtcars,
       aes(x=disp,
           y=mpg,color=factor(cyl))) +
  geom_smooth(color="black",
              se=FALSE,
              alpha=.5,
              linetype=2) +
  geom_point() +
  labs(color="Cylinders",
       x="Miles per gallon",
       y="Displacement (cu.in.)") +
  theme_bw() +
  scale_color_manual(values = c("darkred","dodgerblue","darkgreen"))


library(GGally)
GGally::ggpairs(iris) #all the graphs of how all the things relate, *** significant
#start hypothesising

#control shift m = pipe (%>%)

sum(1:10)
#same as, pipe is more readable, old output is now your first argument
1:10%>%
  sum()

ggplot(iris)
#same as, plus some
iris %>% 
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species))+
  geom_point()


iris %>% 
  filter(Species !="setosa") %>%  #removing setosa
  filter(Sepal.Length<7 & Sepal.Length>5) %>%      #removing sepal length greater than 7 and less than 5
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species))+
  geom_point() +
  facet_wrap(~Species) #separate subplot for each level of a categorical
#~=as a function of, something categorical


iris %>% 
  ggplot(aes(x=Sepal.Length,y=Petal.Length,color=Species))+
  geom_point(color="black")+
  geom_smooth(method=lm)+
  facet_wrap(~Species)+
  theme_bw()+
  theme(strip.text = element_text(face = "italic"), #italicize species name
        legend.position = "none") #get rid of legend

iris %>% 
  ggplot(aes(x=Species,y=Petal.Length))+
  geom_violin()


data("iris")
iris %>% str

#levels(iris$Species) <- c("virginica","versicolor","setosa") #just renamed

iris %>% 
  mutate(Speal.Area=Sepal.Length*Sepal.Width,
         Species=factor(Species,levels = c("virginica","versicolor","setosa")))%>% 
  ggplot(aes(x=Species,y=Petal.Length))+
  geom_violin()
#mutating, not saving over
#reordering our species
#*will be on exam 1*
#have to clone whole repository start on parts 1 and 2
#due next Monday


iris %>% 
  group_by(Species) %>% 
  summarize(max_sep_len=max(Sepal.Length),
            min_sep_len=min(Sepal.Length),
            mean_sep_len=mean(Sepal.Length),
            sd_sep_len=sd(Sepal.Length))
#on exam