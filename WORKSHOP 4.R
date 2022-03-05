rm(list=ls())
library(tidyverse)
install.packages("skimr")
library(skimr)

install.packages("lubridate")
library(lubridate)

brewing_materials <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')

brewing_materials <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')

brewer_size <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewer_size.csv')

skim(brewing_materials)


#lubridate
brewing_material <- brewing_materials %>%
  mutate(date = ymd(paste(year,month, 1))) %>%
  filter(year < 2016)

#remove total values

brewing_material %>%
  filter(!str_detect(material_type, "Total")) %>%
  ggplot(aes(type, month_current, fill = material_type)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma)
  
reorder type
brewing_material %>%
  filter(!str_detect(material_type, "Total")) %>%
  mutate(type= fct_reorder(type, month_current)) %>%
  ggplot(aes(type, month_current, fill = material_type)) +
  geom_col() +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(x="ingredients", y="Total Production",fill= "material type", title = "Bar chart")


# change category to factor (number)

class(brewing_material$type)
class(brewing_material$date)

brewing_material$type <- as_factor(brewing_material$type)
class(brewing_material$type)

brewer_size %>%
  count(brewer_size) %>%
  arrange(desc(n)) %>%
  kable()

brewer_size%>%
  mutate(brewer_size = fct_lump(brewer_size,n=10)) %>%
  count(brewer_size)


library(knitr)
summary(mpg)
head(mpg,15)
kable(mpg[1:5,1:3])
kable(mpg[1:10,])

new_data <- brewing_material %>%
  mutate(production_level = case_when(month_current <= 100000000 ~ "low", T~"High"))


new_data %>%
  count(production_level)
