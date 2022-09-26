library(tidyverse)
library(dplyr)
#1 (and rename to df for ease)
df <- read_csv("cleaned_covid_data.csv")

#2
A_States <- 
  df %>% 
  mutate(c1=grepl("A",df$Province_State)) %>% 
  filter(c1)

#3
A_States %>% 
  ggplot(aes(x=Last_Update,y=Deaths))+
  geom_point()+
  geom_smooth(se=FALSE)+
  facet_wrap(~Province_State,scales="free")
  
#4
state_max_fatality_rate <- 
df %>% 
  group_by(Province_State) %>% 
  summarize(Maximum_Fatality_Ratio=max(Case_Fatality_Ratio, na.rm=TRUE)) 

state_max_fatality_rate %>% arrange(desc(Maximum_Fatality_Ratio))

#5
state_max_fatality_rate %>% 
  mutate(Province_State=factor(Province_State,levels = c("New York","New Jersey","Massachusetts","Connecticut","New Hampshire","Pennsylvania","District of Columbia","Michigan","Rhode Island","Louisiana","Delaware","Maryland","Mississippi","Vermont","Arizona","Indiana","Ohio","South Carolina","Georgia","Illinois","New Mexico","Alabama","Florida","Washington","Maine","Virginia","West Virginia","Texas","California","Oklahoma","Colorado","Nevada","Arkansas","Missouri","South Dakota","Iowa","Kansas","North Carolina","Kentucky","Hawaii","Tennessee","North Dakota","Montana","Minnesota","Oregon","Wyoming","Idaho","Wisconsin","Nebraska","Alaska","Utah"))) %>% 
   ggplot(aes(x=Province_State,y=Maximum_Fatality_Ratio),na.rm=TRUE)+
  geom_col()+
  theme(axis.text.x.bottom = element_text(angle=90))

