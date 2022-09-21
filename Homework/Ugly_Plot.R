library(tidyverse)

emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  mOnEyZzzzz = c(623.3,515.2,611.0,729.0,843.25), 
  
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
                         "2015-03-27")),
  stringsAsFactors = FALSE)

 ggplot(emp.data,aes(x=start_date, y=mOnEyZzzzz,shape=emp_name,color=emp_id))+
  geom_boxplot()+
   labs(title = "WOrk STuffzZzZzzzzzzzzzZ")+
   theme(axis.text.x = element_text(face = "bold.italic",
                                    size = 72,
                                    color="gray"),
         plot.background = element_rect(fill = "navy"),
         axis.title = element_text(size = 7,face="bold",angle = 320,family="Times New Roman"),
         title=element_text(face="italic",angle=180,size=12),
         legend.text = element_text(angle=90,face="italic"),
         legend.key = element_rect(fill="purple"),
         legend.background = element_rect(fill="navy"))
  

 