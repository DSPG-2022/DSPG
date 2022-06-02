---
title: "Journal"
author: "Maxwell Skinner"
output:
  html_document: 
    toc: true
    theme: united
---

## Week 2


### Day 1

Started work on the AIIRA Wholesale Local Food Benchmarking Project. The day's primary focus was to experiment and begin work with the gtrendsR package. Created an interest over time chart of multiple keywords of agricultural commodities, including items like strawberries, peppers, cucumbers, and similar products. Some sample work is shown below:

```{r}
library(gtrendsR)
library(tidyverse)
library(ggthemes)

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



Worked later in the afternoon on further visualizations with the gtrends and additionally the trendecon package. One visualization being the number of hits the keyword "strawberries" has for the past 10 years. Visualization of that is shown below:

```{r}
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


### Day 2







