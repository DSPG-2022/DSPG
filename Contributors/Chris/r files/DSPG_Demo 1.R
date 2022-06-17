## ----install-packages---------------------------------------------
install.packages(c("tidycensus", "tidyverse"))
library(tidycensus)
library(tigris)
library(tidyverse)
library(sf)
library(ggplot2)

options(tigris_use_cache = TRUE)
census_api_key('ENTER YOUR KEY', overwrite=TRUE)


v20 <- load_variables(2020, "acs5", cache = TRUE)

v10 <- load_variables(2010, "acs5", cache = TRUE)


myTable <- get_acs(
  geography = "county",
  state = "IA",
  variables = c(medinc = "B19013_001",
                medage = "B01002_001"),
  year = 2020
) 
myTable

write.csv(myTable, "medianIncome_age.csv")




## -----vacancies----------------------------------------------------------------------
vacancies <- get_decennial(
  geography = "county",
  variables = c(total_households = "H1_001N",
                vacant_households = "H1_003N"),
  state = "IA",
  year = 2020,
  output = "wide"
) %>%
  mutate(percent_vacant = 100 * (vacant_households / total_households))

vacancies

write.csv(vacancies, "vacancies.csv")






## -----Multiple years----------------------------------------------------------------------

variable <- c(medage = "B01002_001")
indicatorLabel = "The County Median Age"


medianAge20 <- get_acs(
  geography = "county",
  state = "IA",
  variables = c(medage = "B01002_001"),
  year = 2020
) %>% 
  mutate(year = 2020, yearLabel = "2016-2020", indicator = indicatorLabel)

medianAge15 <- get_acs(
  geography = "county",
  state = "IA",
  variables = c(medage = "B01002_001"),
  year = 2015
) %>% 
  mutate(year = 2015, yearLabel = "2011-2015", indicator = "Median Age")

medianAge10 <- get_acs(
  geography = "county",
  state = "IA",
  variables = c(medage = "B01002_001"),
  year = 2010
) %>% 
  mutate(year = 2010, yearLabel = "2006-2010", indicator = "Median Age")

binded_medianAge = bind_rows(medianAge10,medianAge15,medianAge20)
binded_medianAge

write.csv(binded_medianAge, "binded_medianAge.csv")










