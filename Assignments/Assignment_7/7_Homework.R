library(tidyverse)

df<- read_csv("Utah_Religions_by_County.csv")

#clean data
df<- 
  df %>% 
  pivot_longer(cols=5:17,names_to = "Religion",
               values_to = "Proportion")
#Does population of a county correlate with the proportion of any specific religious group in that county?
df %>% 
  ggplot(aes(x=Pop_2010,y=Proportion))+
  geom_point()+
  geom_smooth()

df %>% 
  ggplot(aes(x=Pop_2010,y=Proportion))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~County)

df %>% 
  ggplot(aes(x=Pop_2010,y=Proportion))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~Religion)

df %>% 
  filter(Religion=="Assemblies of God") %>% 
  ggplot(aes(x=Pop_2010,y=Proportion))+
  geom_point()+
  geom_smooth()

df %>% 
  filter(Religion=="Catholic") %>% 
  ggplot(aes(x=Pop_2010,y=Proportion))+
  geom_point()+
  geom_smooth()+
  geom_label(aes(label=County))

df %>% 
  filter(Religion=="LDS") %>% 
  ggplot(aes(x=Pop_2010,y=Proportion))+
  geom_point()+
  geom_smooth()+
  geom_label(aes(label=County))


#Does proportion of any specific religion in a given county correlate with the proportion of non-religious people

df %>% 
  ggplot(aes(x=County,y=`Non-Religious`))+
  geom_point()+
  geom_smooth()+
  facet_wrap(~Religion)

df %>% 
  filter(Religion=="LDS") %>% 
  ggplot(aes(x=County,y=`Non-Religious`))+
  geom_point()+
  geom_smooth()+
  geom_label(aes(label=County))

df %>% 
  filter(Religion=="Catholic") %>% 
  ggplot(aes(x=County,y=`Non-Religious`))+
  geom_point()+
  geom_smooth()+
  geom_label(aes(label=County))

getwd() #finds where you are

