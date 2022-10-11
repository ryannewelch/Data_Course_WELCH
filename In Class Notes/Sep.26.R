#group_by is followed by summarize
#read_csv is better than read.csv

################################################################################
# Week 6 #
#clean...make it look like iris or palmer penguins
#R is best for data cleaning
#*READ Tidy Data Chapter*

library(tidyverse)


#learning about tidy data

#Tidy Rules
#1) every column is a single variable
#2) every row is a single observation of those variables
#3) must be rectangular (missing cells have NA)

df <- read_csv("./Data/wide_income_rent.csv") 
#this little guy is in wide format, which means some variables
#are spread across multiple columns.

library(readxl)

df2 <- read_xlsx("./Data/wide_data_example.xlsx")

df2 %>% 
  mutate(`Treatment 1`=`Treatment 1` %>% as.numeric()) %>% 
  pivot_longer(cols = starts_with("Treatment"),
               names_to = "Treatment",
               values_to = "Weight")  

#this little dude is long format data now that we fixed it
  
df %>% 
  pivot_longer(cols = -variable, 
               names_to ="State") %>% 
  pivot_wider(names_from = variable)

#real data sets on EXAMS from here on out, that needs to be cleaned



