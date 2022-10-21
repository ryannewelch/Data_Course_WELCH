library(tidyverse)
library(modelr)
library(easystats)
library(palmerpenguins)
library(broom)


###Getting things set for the exam###

#in terminal...git clone paste website in
#create new folder for the exam in data_course_welch
#put what you need from the stuff you got from the website in this new folder
#create project like you've been doing
#save like you've done
#terminal cd Data_Course_WELCH
#git add .
#git status
#git commit -m "message"
#git push
#######################################

#more about models

#be able to explain the relationship to a 5 year old

penguins
names(penguins)

#response is body_mass_g (DV)

#predictors: island, sex, species,...

penguins %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(y=body_mass_g,
             x=species,
             fill=sex))+
  geom_boxplot()+
  facet_wrap(~island)+
  theme(axis.text.x=element_text(angle=90,hjust = 1))


#formula: response~predictors
mod1<- glm(data = penguins %>% 
      filter(!is.na(sex)),
    formula = body_mass_g ~ sex + island + species)

summary(mod1)

tidy(mod1) %>% # gives you summary but in a data frame
  filter(p.value<0.05)

mod2 <- glm(data = penguins %>% 
              filter(!is.na(sex)),
            formula = body_mass_g ~ sex + species)
tidy(mod2) %>% 
  filter(p.value<0.05)

#easystats
report(mod2)
model_performance(mod2)
compare_performance(mod1,mod2)

#smaller AIC is better, higher R2 is better. We like simplicity.
#residule is distance from mean to actual points
#R2 is fit, closer to 1 the better
#OLS regression

mod3 <- glm(data = penguins %>% 
              filter(!is.na(sex)),
            formula = body_mass_g ~ sex * species) #* how these things affect each other as well
compare_performance(mod1,mod2,mod3) %>% plot #bigger is better

mod4 <- glm(data = penguins %>% 
              filter(!is.na(sex)),
            formula = body_mass_g ~ .^2)
mod4 %>% summary()

step <- MASS::stepAIC(mod4)

step$formula

mod5 <- glm(data = penguins %>% 
              filter(!is.na(sex)),
            formula = step$formula)

compare_performance(mod3,mod4,mod5) %>% plot

add_predictions(penguins,mod5)
