###Exam 2###
library(tidyverse)
library(janitor)
library(easystats)
library(modelr)

#1. Read in the unicef data, renamed df and clean names for convenience
df<- read_csv("unicef-u5mr.csv") %>% clean_names()


#2. Get it into tidy format 
a<- df%>%
  pivot_longer(names_to = "year", values_to = "u5mr",cols = starts_with("U5MR")) %>% 
  separate(year, into = c("null", "year"), sep = "_",convert = TRUE) %>% #fix u5mr_year issue
  select(-null) #remove column "null"


#3. Plot each country’s U5MR over time
p1<- a %>%
  ggplot(aes(x=year,y=u5mr))+
  facet_wrap(~continent)+
  geom_path() #for pretty line plot

#4. Save plot as PNG
ggsave("WELCH_plot_1.png",plot = p1,width=6, height=6, dpi=300)


#5. Create another plot that shows the mean U5MR for all the countries within a
##given continent at each year
p2<- a %>% 
  mutate(mean_u5mr=mean("u5mr"/"continent"))%>% 
  ggplot(aes(x=year,y=mean_u5mr,color=continent))+
  geom_path()
#create another column that is Mean_U5MR


#6. Save that plot as LASTNAME_Plot_2.png
ggsave("WELCH_plot_2.png",plot = p2,width=6, height=6, dpi=300)


#7. Create three models of U5MR

###- mod1 should account for only Year
mod1 <- glm(data=a,
            formula = u5mr~year)
###- mod2 should account for Year and Continent
mod2 <- glm(data=a,
            formula = u5mr~year+continent)
###- mod3 should account for Year, Continent, and their interaction term
mod3 <- glm(data=a,
            formula = u5mr~year*continent)

#8. Compare the three models with respect to their performance, which is best?
compare_performance(mod1,mod2,mod3,rank = TRUE)
##mod3 is the best because it has the highest R2

#9. Plot the 3 models’ predictions
gather_predictions(a,mod1,mod2,mod3) %>% 
  ggplot(aes(x=year, y=pred, color=continent))+
  geom_path()+
  facet_wrap(~model)

