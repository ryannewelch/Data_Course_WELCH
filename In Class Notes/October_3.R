library(tidyverse)
library(carData)


df <- full_join(MplsStops,MplsDemo)
glimpse(df)
levels(df$problem)
#get to know your data set
levels(df$citationIssued)
levels(df$personSearch)

df$citationIssued %>% table
df$citationIssued %>% summary()

df <- df %>%
  mutate(citationIssued=case_when(citationIssued=="YES"~TRUE,
                                  TRUE~FALSE),#all other cases that don't match true are false
         vehicleSearch=case_when(vehicleSearch=="YES"~TRUE,
                                 TRUE~FALSE),
         suspiciousVehicalSearch=case_when(problem=="suspicious" & vehicleSearch==TRUE~TRUE,
                                    TRUE~FALSE))
df %>% 
  ggplot(aes(x=long,y=lat,color=suspiciousVehicalSearch))+
  geom_point()


df %>% GGally::ggpairs()

df_sum <- df %>% 
  group_by(neighborhood) %>% 
  summary(N=n(),
          proportion_suspitious=sum(suspiciousVehicalSearch/N),
          stops_per_person=N/population,
          collegeGrad=collegeGrad,
          hhIncome=hhIncome,
          white=white,
          black=black,
          foreignBorn=foreignBorn,
          poverty=poverty,
          vehicalSearchtotal=sum(vehicalSearch),
          percent_searched=vehicalSearchtotal/N)

df_sum %>% 
  unique.data.frame() %>% 
  ggplot(aes(x=poverty,y=percent_searched,color=proportion_suspicious))+
  geom_point()+
  geom_smooth(method="lm")+
  scale_color_viridis_c()


library(palmerpenguins)

penguins %>% 
  mutate(chonker=case_when(body_mass_g>4000~TRUE,
                           TRUE~FALSE)) %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g,color=chonker))+
  geom_point()

penguins %>% 
  filter(!is.na(sex)) %>% 
  mutate(size=case_when(body_mass_g>=5000~ "Fattie",
                        body_mass_g>=4000&body_mass_g<5000~"Medium",
                        body_mass_g<4000~ "Tiny buddy")) %>% 
  ggplot(aes(x=body_mass_g,fill=size))+
  geom_histogram(alpha=.5)+
  facet_grid(~species*sex)
