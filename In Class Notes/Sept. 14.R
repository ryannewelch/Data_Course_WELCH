library(tidyverse)
library(patchwork) #lets you put plots into one image

data("iris")

#plot 2
p2 <- iris %>%
ggplot(iris,
       mapping=aes(x=Sepal.Length,
                   y=Sepal.Width,
                   color=Species))+
  geom_point()+
  geom_smooth(method=lm,se=FALSE)

#plot 1
p1 <- iris %>%
ggplot(iris,
       mapping=aes(x=Sepal.Length,
                   y=Sepal.Width,
                   color=Species))+
  geom_point(color="black")+
  geom_smooth(method=lm,se=FALSE)

p1+p2


#save a plot as an object
p3 <- ggplot(iris,aes(x=Species,y=Sepal.Length))+
  geom_boxplot()
p3

(p1+p2)/p3 #using pathcwork to create multuple plots

#save plot as a file
#dir.create("Figures")
ggsave("./Figures/myfirstplot.png",plot = p3,width=6, height=6, dpi=300)#dpi= dots per inch


p4 <- p3+ theme_minimal()+
  labs(y="Sepal Length",
       title =  "avthgaidjlvajdghkl",
       subtitle = "your mom",
       caption = "Data from iris")
ggsave("./Figures/mysecondplot.png",p4,width=4,height=4,dpi=300)

#italicizes species names
p5 <- p4+
  theme(axis.text.x = element_text(face = "bold.italic",
                                   size = 14,
                                   color="blue"),
        plot.background = element_rect(fill = "red"),
        axis.title = element_text(size = 18,face="bold"))

#control alt b to run everything before curser

remotes::install_github("wilkelab/cowplot")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
remotes::install_github("clauswilke/colorblindr")


p6 <- 
  ggplot(iris,aes(x=Species,y=Sepal.Length,fill=Species))+
  geom_boxplot()
p6  


pal <- c("#1a5229","#e0a8bd","#102836")
p6+
  scale_fill_manual(values = pal)

p6+
  scale_fill_viridis_d(option = "magma")

p6+
  scale_fill_brewer(palette=7)


ggplot(iris,aes(x=Sepal.Length,
                y=Sepal.Width,
                color=Sepal.Width))+
  geom_point()+
  scale_color_viridis_c(option = "inferno") #c means continuous, d is discrete, b is bin

viridis::rocket(100)
colorblindr::palette_plot(pal)

#practice theme
