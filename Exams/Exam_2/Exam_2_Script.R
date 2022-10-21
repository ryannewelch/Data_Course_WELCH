###Exam 2###
library(tidyverse)
library(janitor)

#1. Read in the unicef data, renamed df and clean names for convenience
df<- read_csv("unicef-u5mr.csv") %>% clean_names()

#2. Get it into tidy format 
a<- df%>%
  pivot_longer(names_to = "year", values_to = "u5mr",cols = starts_with("U5MR"))
###look in textbook to fix the names in year so they aren't u5mr_year###


#3. Plot each country’s U5MR over time