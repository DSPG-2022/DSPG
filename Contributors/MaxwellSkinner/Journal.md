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






## Week 3

### Day 1 (A Day)

Focused on visualizations with the gtrends package. Generated visualizations with multiple keywords over a period of multiple years. Was able to extract general trends, as well as unique times like the year 2020, which had a unique search pattern compared to other years. 

```
library(gtrendsR)
library(tidyverse)
library(ggthemes)
library(ggplot2)
library(dplyr)
library(trendecon)

iowa1 = ts_gtrends(keyword = c("strawberries", "peppers", "cucumbers", "sweet corn", "melons"), 
                           geo = "US-IA", time = "2016-01-01 2021-12-30")

iowa2 = ts_gtrends(keyword = c("apples", "rhubarb", "honey", "preserves", "eggs"), 
                          geo = "US-IA", time = "2016-01-01 2021-12-30")

iowa3 = ts_gtrends(keyword = c("greens", "dairy products"), 
                          geo = "US-IA", time = "2016-01-01 2021-12-30")


gtrends_plot = ggplot() +
  geom_line(data = iowa1, aes(x = time, y = value, color = id)) + 
  geom_line(data = iowa2, aes(x = time, y = value, color = id)) + 
  geom_line(data = iowa3, aes(x = time, y = value, color = id)) + 
  facet_wrap(facets = vars(id)) +
  ggtitle("Google Trends of Agricultural Commodities in Iowa 2016 - 2021") + 
  labs (y = "View Scale", x = "Dates")

gtrends_plot
```

In addition, combined 5 specific keywords to one chart, and created a filter to be able to show just 1 keyword over multiple years, or multiple keywords for 1 year. Helped analyze the trends of word keyword over multiple years. 

```
library(gtrendsR)
library(tidyverse)
library(ggthemes)

output = gtrends(keyword = c("strawberries", "peppers", "cucumbers", "sweet corn", "melons"),
                 geo = c("US-KY","US-IA","US-IL","US-IN","US-MO"),
                 time ="2016-01-01 2021-12-31")

hitss = output$interest_over_time
hitss$year = format(as.Date(hitss$date, format="%Y-%m-%d"),"%Y")
hitss$month = format(as.Date(hitss$date, format="%Y-%m-%d"),"%m")


hitss %>% filter(keyword == "peppers") %>% ggplot(aes((month), hits,
                                                      group=factor(year),
                                                      colour=factor(year))) +
  geom_line() +
  geom_point() +
  labs(x="Month", colour="Year") +
  theme_classic()+
  labs(title="Peppers")


hitss %>% filter(year == "2016") %>% ggplot(aes((month), hits,
                                                     group=factor(keyword),
                                                     colour=factor(keyword))) +
  geom_line() +
  geom_point() +
  labs(x="Month", colour="Keywords") +
  theme_classic()+
  labs(title="2016")
  ```


