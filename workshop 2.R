a<- 10
a
rm
#loda the package
library(tidyverse)
data(mpg)
summary(mpg)
head(mpg)
head(mpg,3)
install.packages("knitr")
library(knitr)
kable(mpg[5:10,])



#create a data visualization

ggplot(mpg,aes(displ, hwy)) +
  geom_point(color = "red")



ggplot(mpg,aes(displ, hwy, color = class)) +
  geom_point()


ggplot(mpg,aes(displ, hwy, color = class)) +
  geom_point()  
 


ggplot(mpg, aes(displ, hwy, color = trans)) +
  geom_point()  + 
  facet_wrap(~class)+
  labs(x="displacement",y= "highway miles",colour = "transmission",title = "point graph", caption = "figure l")


ggplot(mpg, aes(displ, hwy, colour = trans)) +
  geom_point()  +
  facet_wrap(~class) +
  labs(x = "Displacement", y = "Highway Miles", colour = "Transmission",
       title = "Point Graph", caption = "Figure 1")


ggplot(mpg, aes(displ, hwy, colour = trans)) +
  geom_point()  +
  facet_wrap(~class) +
  labs(x = "Displacement", y = "Highway Miles", colour = "Transmission",
       title = "Point Graph", caption = "Figure 1")
