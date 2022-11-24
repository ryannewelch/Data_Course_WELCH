#Genomics course how genomes are sequenced, discussions and review papers, very current and relevant Biol 4400
#look up what galaxy is



###NMDS###
library(tidyverse)
library(vegan)
iris_mat <- 
  iris %>% 
  select_if(is.numeric)


MDS<- metaMDS(iris_mat,k=2)
MDS1 <- MDS$points[,1]
MDS2 <- MDS$points[,2]

#visual (NMDS)
data.frame(Species=iris$Species,
           MDS1=MDS1,
           MDS2=MDS2) %>% 
  ggplot(aes(x=MDS1,y=MDS2,color=Species))+
  geom_point()+
  stat_ellipse()


#statistical... is this thing you're looking at important
adonis2(data=iris,
        formula=iris_mat~iris$Species)
