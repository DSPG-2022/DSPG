---
title: "Journal"
author: "Maxwell Skinner"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Journal


## Week 2


### Day 2

Started work on the AIIRA Wholesale Local Food Benchmarking Project. The day's primary focus was to work with Experimented and began work with the gtrendsR package for the first time. Created an interest over time chart of multiple keywords of agricultural commodities, including items like strawberries, peppers, cucumbers, and similar products. Some sample work is shown below:

```{r}
library(gtrendsR)
library(tidyverse)
library(ggthemes)
##Find country's geocode
country = gtrendsR::countries
head(country)


output = gtrendsR::gtrends(keyword = c("strawberries", "peppers", "cucumbers", "sweet corn", "melons"), 
                            geo = "US-IA", time = "today+5-y", 
                            compared_breakdown = TRUE)

output %>% summary()

output %>%
    .$interest_over_time %>%
  glimpse()

#Put it on a chart
output %>%
  .$interest_over_time %>%
  ggplot(aes(x = date, y = hits)) + 
  geom_line(colour = 'blue', size = 1.5) + 
  facet_wrap(~keyword) + 
  ggthemes::theme_economist()

df = output %>%
    .$interest_over_time

plot(output)
```

```{r fig.cap = Interest Over Time Line Chart of the Past 5 Years""}
plot(output)
```



Worked later in the afternoon on further visualizations with the gtrends and additionally the trendecon package. One visualization being the number of hits the keyword "strawberries" has for the past 10 years. Visualization of that is shown below:

```{r fig.cap = U.S. nationwide heat map of the keyword "strawberries"}
res <- gtrends("strawberries",
               geo = "US",
               time = "all")

state <- map_data("state")

res$interest_by_region %>%
  mutate(region = tolower(location)) %>%
  filter(region %in% state$region) %>%
  select(region, hits) -> my_df

ggplot() +
  geom_map(data = state,
           map = state,
           aes(x = long, y = lat, map_id = region),
           fill="#ffffff", color="#ffffff", size=0.15) +
  geom_map(data = my_df,
           map = state,
           aes(fill = hits, map_id = region),
           color="#ffffff", size=0.15)
```


