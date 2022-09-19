data.frame(Young_Living_Pine_Data)
library(tidyverse)
Pine <- Young_Living_Pine_Data
Cone_Stage<- Pine$`Cone Stage...3`
Scale_Thickness <- Pine$`Scale Thickness (mm)`
ggplot(Pine,mapping = aes(x=Cone_Stage,
                          y=Scale_Thickness))+
  geom_point(color=Cone_Stage)

