library(tidyverse)

pizza_barstool <-read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-01/pizza_jared.csv")
pizza_barstool <-read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-01/pizza_barstool.csv")

#select

pizza_short <- pizza_barstool %>%
  select(name, city, price_level,  provider_rating, provider_review_count)

#count

pizza_short %>%
  count(city, sort=TRUE)

pizza_short %>%
  count(city) %>%
  arrange(n) %>%
  top_n(15)

pizza_short %>%
  count(city) %>%
  arrange(desc(n)) %>%
  top_n(15)

#filter

good_pizza <- pizza_short %>%
  filter(provider_rating >= 4)

bad_pizza <- pizza_short %>%
  filter(provider_rating == 2)

#group_by

pizza_short %>%
  group_by(city)

pizza_short %>%
  group_by(city) %>%
  summarise(mean_rating = mean(provider_rating)) %>%
  ungroup() %>%
  arrange(desc(mean_rating))

pizza_short %>%
  group_by(city) %>%
  mutate(mean_rating = mean(provider_rating)) %>%
  ungroup() %>%
  arrange(desc(mean_rating))

pizza_short %>%
  mutate(price = price_level * 2)


