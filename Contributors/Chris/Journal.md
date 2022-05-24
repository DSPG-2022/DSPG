# Chris Seeger's DSPG Journal 2022

## Profile
- Originally from North Dakota
- BLA and BS in Environmental Design; North Dakota State University - yes that top football school - Go Bison!
- MLA; Iowa State University - this is a terminal degree so no calling me Dr. - that would be my dad - ISU Veterinary grad.
- Licensed as a Professional Landscape Architect and certified as a GIS Professional (GISP)
- Passionate about Spatial Data (including networks, volunteered geographic information) and sharing these technologies with communities and students.
- Research has focused on physical activity and the built environment
- Software interests include: open-source software, QGIS, user-generated data, Leaflet, OpenStreetMap, R, JavaScript, SQL
- Hobbies: Woodworking, board games (Terraforming Mars, Catan, Carcassonne), Photography, messing around with attempting to play guitar, harmonica and most recently an old accordion …

## Daily Journal of things learned or created
Over the course of the DSPG summer program I have worked on a variety of things each day. Following is a summary.

### Week 1
I learned how to manage Data Camp teams and review assessments!

This R script uses TidyCensus to retrive the variable P013001 (Median age!!Both sexes) from the sf1 file of the 2010 decennial. This data is then plotted to show the median age for each county in Wyoming. I first tried to use Iowa but needed to modify GGPLOT to allow for 99 counties so I defaulted to Wyoming since it has fewer counties! To make ggplotmake the plot taller. The original code is availabel at [https://walker-data.com/tidycensus/articles/basic-usage.html]

```
library(tidycensus)
library(tidyverse)

census_api_key("YOUR API KEY GOES HERE")

age10 <- get_decennial(geography = "county",
  state = "WY",
  variables = "P013001",
  year = 2010)

head(age10)

age10 %>%
  ggplot(aes(x = value, y = reorder(NAME, value))) + 
  geom_point()
```

![alt text here](images/wyomingCountyMedianAge2010.png)


### Week 2
