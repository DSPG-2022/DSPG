# Week One

## Tasks
- [x] Download R, Github Desktop, Tableau and other necessary programs
- [x] Finish DataCamp Assessments
- [x] Choose application/tool for team management
- [x] Finish DataCamp tutorials around tidyverse fundamentals in R
- [x] Finish DataCamp tutorials around different import and clean fundamentals in R  
- [x] Conduct preliminary research on project data/literature review

## What I've learned

- **R**
    1. Assessments showed that I was weakest in cleaning and importing data so I completed an _Introduction to the Tidyverse_ course.
    2. Started the course _Introduction to Importing Data in R_ for better understanding importing different file types from excel, csv, to SQL or other statistical databases.
        1. Particularly working with packages like ```utils, readr, data.table``` and ```fread``` for viewing local files in different formats. 
    3. Learned to work with categorical data in the Tidyverse.
        1. Using ```forcats``` functions like:
            1. ```fct_reorder(), fct_collapse(), fct_other(), fct_relevel(), fct_rev(), fct_recode()```
        2. ```Tidyverse``` functions like:
            1. ```case_when(), mutate_if(), gather(), str_remove()```
        3. ```ggpplot2``` tricks like:
            1. ```scales::percent_format(), labs(), axis.text.x```
    4. Started courses on the usage of the ```tidycensus``` package for census data manipulation in R.
        1. Learned to work specifically with functions like:
            1.  ```get_acs, get_decennial, moe_sum(), moe_product(), moe_ratio(), moe_prop()```
