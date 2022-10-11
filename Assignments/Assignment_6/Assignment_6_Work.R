library(tidyverse)
dat <- read_csv("../../Data/BioLog_Plate_Data.csv")
dat %>% view

#1)Cleans this data into tidy (long) form
dat %>% 
  pivot_longer(cols=starts_with("Hr"),
               names_to = "Absorbancy_Hours",
               values_to = "Absorbancy_Values") %>% 
  dat$Soil_Type <- if_else(Substrate= Water ~ Water,
                           Substrate=~Water ~ Soil) 
  
 

#2)Creates a new column specifying whether a sample is from soil or water

#3)Generates a plot that matches this one (note just plotting dilution == 0.1)


#4)Generates an animated plot that matches this one 
#(absorbance values are mean of all 3 replicates for each group):
#This plot is just showing values for the substrate “Itaconic Acid”


