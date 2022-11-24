library(tidyverse)
library(janitor)
library(easystats)
library(broom)


###Task I###
#read it
#clean_names() started giving me the error "Error: A data frame is not 
#a valid object for this function." so this is the best I could do.
sal<-read_csv("./Data/FacultySalaries_1995.csv")

#****clean it
sal1<-sal %>% 
  pivot_longer(names_to = "rank",values_to = "Salary",cols = ends_with("salary",)) %>%
  pivot_longer(names_to = "null",values_to = "Numbers_of",cols = starts_with("num")) %>% 
  select(-null) %>% 
  pivot_longer(names_to = "Null",values_to = "Comp",cols = ends_with("comp")) %>% 
  select(-Null) %>% 
  select(-AvgProfCompAll) %>% 
  select(-AvgProfSalaryAll)


#plot it
  WELCH_Plot_1<-sal1 %>% 
    ggplot(aes(x=rank,y=Salary,fill=rank))+
  facet_wrap(~Tier)+
  geom_boxplot()+
  theme_minimal() 
 
#export it
  jpeg(".WELCH_Plot_1.jpeg", quality = 75)
  

###****Task II###  
  mod1 <- glm(data=sal1,
              formula =Salary~State+Tier+rank) 
  Salary_ANOVA_Summary<-summary(mod1)

#****export ANOVA  
  write.table(Salary_ANOVA_Summary,".Salary_ANOVA_Summary.txt",
              row.names = F,sep = "\t")
  
###Task III###
#Read it
  dat<-read_csv("./Data/Juniper_Oils.csv")
  
#Clean it
  dat1<-dat %>% 
    select(-SampleID) %>% 
    select(-Project) %>% 
    select(-Amplicon) %>% 
    select(-Tree_Species) %>% 
    select(-BurnYear) %>% 
    select(-Latitude) %>% 
    select(-Longitude) %>% 
    select(-Field_Office) %>% 
    select(-BLM_Fire_Name) %>% 
    select(-Tracking_Number) %>% 
    select(-Yield_percent) %>% 
    select(-Bolt_Surface_Area_cm2) %>% 
    select(-Raw_Exit_Holes_per_cm2) %>% 
    select(-Raw_Exit_Holes) %>% 
    select(-Living_Larvae) %>% 
    select(-ChemTotal) %>% 
    select(-ChemMean) %>% 
    pivot_longer(names_to =("ChemicalID"),
                values_to =("Concentration"),
                cols = c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene",
                         "alpha-cedrene","beta-cedrene","cis-thujopsene",
                         "alpha-himachalene","beta-chamigrene","cuparene",
                         "compound 1","alpha-chamigrene","widdrol","cedrol",
                         "beta-acorenol","alpha-acorenol","gamma-eudesmol",
                         "beta-eudesmol","alpha-eudesmol","cedr-8-en-13-ol",
                         "cedr-8-en-15-ol","compound 2","thujopsenal"))
    
  
###Task IV###
#Plot it
  dat1 %>% ggplot(aes(x=YearsSinceBurn,
             y=Concentration))+
    facet_wrap(~ChemicalID,scales = "free_y")+
    geom_smooth()
  
 
###Task V###
  mod1 <- glm(data=dat1,
              formula=Concentration~YearsSinceBurn*ChemicalID)
  
  tidy(mod1) %>% 
    filter(p.value<0.05)
  
  
###Task VI###
  #Commit and push all code and files to GitHub.
  
  
###Task VII###  
  #For 10 bonus points, put all this code and output into a fancy knitted html
  #file instead of just an R script.

  
###############################################################################  


                                                       