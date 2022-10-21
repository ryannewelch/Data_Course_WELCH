library(tidyverse)
library(easystats)
library(modelr)

sim3 %>% 
  ggplot(aes(x=x1,y=y,color=x2))+
  geom_point()+
  geom_smooth(method="lm")

#the effect of x1 depends on the value of x2
#x1 and x2 interact!


mod1 <- glm(data=sim3,
            formula = y~x1)

mod2 <- glm(data=sim3,
            formula = y~x1*x2) #y ~ x1 + x2 + x1:x2 

mod3 <- glm(data=sim3,
            formula = y~x1+x2) #not interacting

compare_performance(mod1,mod2,mod3,rank = TRUE)

add_predictions(sim3,mod1) %>% 
  ggplot(aes(x=x1,y=pred))+
  geom_point()

add_predictions(sim3,mod2) %>% 
  ggplot(aes(x=x1,y=pred,color=x2))+
  geom_point()

add_predictions(sim3,mod3) %>% 
  ggplot(aes(x=x1,y=pred,color=x2))+
  geom_point()

gather_predictions(sim3,mod1,mod2,mod3) %>% 
  ggplot(aes(x=x1, y=pred, color=x2))+
  geom_point()+geom_line()+
  facet_wrap(~model)

#LHM = response = dependent = outcome
#y~x+z (additive)
#y~x*z (interactive)


mpg %>% glimpse()


mod4 <- 
  glm(data = mpg,
      formula=cty~cyl*displ) #trains a model
add_predictions(mpg,mod4) %>% 
  ggplot(aes(x=displ,y=pred,color=factor(cyl)))+
  geom_point()


newcars <- data.frame(displ=c(40,1.5,3),
                      cyl=c(4,6,8))
add_predictions(newcars,mod4) #lesson: models aren't smart, all are wrong, some are useful
#more data = more accurate model

mpg %>% 
  ggplot(aes(x=displ,y=cty))+
  geom_point()+
  geom_smooth(method="lm",formula=y~poly(x,2))

mod5 <- 
  glm(data = mpg,
      formula=cty~cyl*poly(displ,2)) #2 tells how many curves in a line
add_predictions(mpg,mod5) %>% 
  ggplot(aes(x=displ,y=pred,color=cyl))+ 
  geom_point() #make sure your model makes sense at the end

ggplot(mpg,aes(x=log10(cty)))+
  geom_density()

Lehi_Home_Sales %>% #not normal
  ggplot(aes(x=log10(net_sold_price)))+
  geom_density()


library(palmerpenguins)

df<- penguins %>% 
  mutate(female=case_when(sex=="female"~TRUE,
                          TRUE~FALSE))

#logistic regression (true/false outcome) s-curve, need more data (observations) in order to be good, machine learning
mod6 <- glm(data=df,
      formula=female~body_mass_g*bill_length_mm*species,
      family = "binomial") #MEMORIZE

predict(mod6,data.frame(body_mass_g=3000,
                   bill_length_mm=20,
                   species="Gentoo"),
        type="response")#MEMORIZE

add_predictions(df,mod6,type="response") %>% 
  ggplot(aes(x=pred,y=female,color=female))+
  geom_point()


mpg %>% 
  mutate(good_mileage=case_when(cty>25~TRUE,
                                TRUE~FALSE)) %>% 
  glm(data=.,
      formula=good_mileage~cyl*trans*displ,
      family = "binomial") %>% 
  add_predictions(data=mpg,type="response") %>% 
  ggplot(aes(x=pred,y=cty))+
  geom_point()

#R users meet up ... info in chat
#R users clubs united, ladies,

#is this realistic, is this fesable?
#consider the limitations
