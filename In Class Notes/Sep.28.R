library(tidyverse)

#example data sets from r4ds chapter
table1
table2 %>% 
  pivot_wider(names_from = type,values_from = count)

a<- table4a %>% 
  pivot_longer(names_to = "year",values_to = "cases",cols=-country)

b <- table4b %>% 
  pivot_longer(names_to = "year",values_to = "population",cols=-country)

#joining,typically want to full join

full_join(table4a %>% 
            pivot_longer(names_to = "year",values_to = "cases",cols=-country),
          table4b %>% 
            pivot_longer(names_to = "year",values_to = "population",cols=-country))
#or

table4a %>% 
  pivot_longer(names_to = "year",values_to = "cases",cols=-country) %>% 
  full_join(table4b %>% 
              pivot_longer(names_to = "year",values_to = "population",cols=-country))
#or

full_join(a,b)


library(carData)

MplsStops %>% 
  ggplot(aes(x=long,y=lat,color=race))+
  geom_density2d()

MplsStops$citationIssued

full<- full_join(MplsStops,MplsDemo)
full %>% names()

full %>% 
  group_by(neighborhood) %>% 
  summarise(N=n(),
            N_per_pop=N/population,
            white=white,
            black=black,
            foreignBorn=foreignBorn,
            hhIncome=hhIncome) %>% 
  unique.data.frame() %>% 
  arrange(desc(N_per_pop)) %>% 
  ungroup() %>% 
  ggplot(aes(x=hhIncome,y=N_per_pop))+
  geom_point()+
  geom_smooth(method=lm)+
  geom_label(aes(label=neighborhood))

# unique.data.frame gets rid of repeats

MplsDemo %>% View


if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ShortRead")

library(ShortRead)
a
Yes
