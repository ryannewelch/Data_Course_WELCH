library(tidyverse)
library(modelr)
library(easystats)
library(broom)

df <- read_csv("mushroom_growth.csv")
names(df)

#plot 1
df %>% 
  ggplot(aes(y=GrowthRate,x=Temperature,
    color=Species))+
  geom_point()+
  facet_wrap(~Humidity)

#plot 2
df %>% 
  ggplot(aes(y=GrowthRate,x=Temperature))+
  geom_point()+
  facet_wrap(~Species)

#plot 3
df %>% 
  ggplot(aes(y=GrowthRate,x=Humidity))+
  geom_point()+
  facet_wrap(~Species)

#plot 4
df %>% 
  ggplot(aes(y=GrowthRate,x=Light))+
  geom_point()+
  facet_wrap(~Species)

#plot 5
df %>% 
  ggplot(aes(y=GrowthRate,x=Nitrogen))+
  geom_point()+
  facet_wrap(~Species)

#mod1
mod1<- glm(data = df, 
           formula = GrowthRate ~ Species + Light + Nitrogen + Humidity + Temperature)
tidy(mod1)

#mod2
mod2<- glm(data = df, 
           formula = GrowthRate ~ .^2)
tidy(mod2) %>% 
  filter(p.value<0.05)

#mod3
mod3 <- glm(data=df,
            formula=GrowthRate~ Species*Light*Nitrogen*Humidity*Temperature)
tidy(mod3) %>% 
  filter(p.value>0.05)

print(x = tidy(mod3) %>% 
        filter(p.value>0.05),n=28)

#mod4
mod4 <- glm(data=df,
            formula=GrowthRate~Temperature)
tidy(mod4)

#?calculates the mean sq. error of each model  
model_performance(mod3)

#select the best model you tried
compare_performance(mod1,mod2,mod3,mod4,rank=TRUE)
###shows that mod3 was the best

#adds predictions based on new hypothetical values for the independent variables used in your model
add_predictions(df,mod3)

#plots these predictions alongside the real data
add_predictions(df,mod3) %>% 
  ggplot(aes(y=GrowthRate,x=pred,color=factor(Species)))+
  geom_point()+
  geom_point(aes(y=GrowthRate,color="black",alpha=.2))



