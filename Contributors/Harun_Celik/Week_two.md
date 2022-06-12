# Week Two

## Tasks
- [x] Create daily tasks and objectives to be shared with the team.
- [x] Finish DataCamp tutorials around tidycensus fundamentals in R
- [x] Start DataCamp tutorials around Web data manipulation and API operations in R
- [x] Find and complete tutorials on data handling and pipelining with Tableau 
- [x] Conduct preliminary research on project data/literature review for DHR and AgMRC projects
- [x] Compile a report of the preliminary research conducted for DHR
- [x] Compile a report of the preliminary research conducted for Farmer's Asset Mapping


## What I've learned

- **R**
    1. As the DHR Disabilities in Iowa project will focus on the use of data from the census bureau, I continued my training in learning ```tidycensus, tigris``` and ```sf``` libraries.
        <details><summary>Click here for examples of practice codes:</summary>
          #Imported Libraries        
          
          ```{r}
          library(tidycensus)
          library(tigris)
          library(tidyverse)
          library(sf)
          ```


          #Using tracts and county to plot maps with tigris
          ```{r}
          co_counties <- tracts(state = "IA", county = "story")
          plot(co_counties)
          ```

          #Using area_water to plot water features with tigris
          ```{r}
          ames_water <- area_water(state = "IA", county = "story")
          plot(ames_water)
          ```

          #Using primary_secondary_roads to plot road features with tigris
          ```{r}
          ames_roads <- primary_secondary_roads(state = "IA")
          plot(ames_roads)
          ```

          #Using @proj4string to check coordinate systems with tigris
          ```{r}
          ia_counties <- counties("IA") 

          ia_counties@proj4string
          ```

          #Using "cb = TRUE" for outlining cartographic boundaries 
          ```{r}
          # Get a counties dataset for Iowa
          options(tigris_class = "sf")

          ia_tiger <- counties("IA")

          # Get the equivalent cartographic boundary shapefile
          ia_cb <- counties("IA", cb = TRUE)

          # Overlay the two on a plot to make a comparison using "add = TRUE"
          plot(ia_tiger$geometry)
          plot(ia_cb$geometry, add = TRUE, border = "red")
          ```

          #Using tigris_cache_dir & tigris_use_cache to load files quicker
          ```{r}
          # Set the cache directory
          tigris_cache_dir("~/blah/blah")

          # Set the tigris_use_cache option
          options(tigris_use_cache = TRUE)

          # Check to see that you've modified the option correctly
          getOption("tigris_use_cache")
          ```

          #Comparing historical tracts with one another // par is used to put items side by side
          ```{r}
          ames_1990 <- tracts(state = "IA", county = "story", cb = TRUE, year = 1990)
          ames_2016 <- tracts(state = "IA", county = "story", cb = TRUE, year = 2016)

          par(mfrow = c(1, 2))
          plot(ames_1990$geometry)
          plot(ames_2016$geometry)
          ```

          #Combining tigris datasets
          ```{r}
          ia_tracts <- tracts("OR", cb = TRUE)
          ne_tracts <- tracts("NE", cb = TRUE)

          # Check the tigris attributes of each object
          attr(ia_tracts, "tigris")
          attr(ne_tracts, "tigris")

          # Combine the datasets then plot the result
          ia_ne_tracts <- rbind_tigris(ne_tracts, ia_tracts)
          plot(ia_ne_tracts$geometry)

          ```


          #Using a "map()" function to rbind_tigris
          ```{r}
          # Generate a vector of state codes and assign to new_england
          new_england <- c("ME", "NH", "VT", "MA")

          # Iterate through the states and request tract data for state
          ne_tracts <- map(new_england, function(x) {
            tracts(state = x, cb = TRUE)
          }) %>%
            rbind_tigris()

          plot(ne_tracts$geometry)
          ```

          #Making maps using ggplot in R with tigris
          ```{r}
          ia_house <- state_legislative_districts(state = "IA", house = "lower", cb = TRUE)

          ggplot(ia_house, aes(color = "black", fill = "red")) + 
            geom_sf() +
            #Change coordinate system and remove background with "datum = NA"
            coord_sf(crs = 3083, datum = NA) +
            scale_fill_manual(values =  c("People" = "red")) +
            labs(title = "Good old Iowa")

          ```

          #USing the "geometry = TRUE" paramater to auto join acs data with tigris data
          ```{r}
          # Get dataset with geometry set to TRUE
          orange_value <- get_acs(geography = "tract", state = "CA", 
                              county = "Orange", 
                              variables = "B25077_001", 
                              geometry = TRUE)

          # Plot the estimate to view a map of the data
          plot(orange_value["estimate"])
          ```

          #Using "geography = school district (unified)" from get_acs and "school_district()" from tigris to join school data
          ```{r}
          # Get an income dataset for Idaho by school district
          iowa_income <- get_acs(geography = "school district (unified)", 
                                  variables = "B19013_001", 
                                  state = "IA")

          # Get a school district dataset for Idaho
          iowa_school <- school_districts(state = "IA", type = "unified", class = "sf")

          # Join the income dataset to the boundaries dataset
          ia_school_joined <- left_join(iowa_school, iowa_income, by = "GEOID")

          plot(ia_school_joined["estimate"])
          ```

          #Using "shift_geo" to include Alaska and Hawaii in State-wide maps
          ```{r}
          # Get a dataset of median home values from the 1-year ACS
          state_value <- get_acs(geography = "state", 
                                variables = "B25077_001", 
                                year = 2020, 
                                geometry = TRUE, 
                                shift_geo = TRUE)

          # Plot the dataset to view the shifted geometry
          plot(state_value["estimate"])
          ```
          #Using ggplot2 to map demographic data
          ```{r}
          ggplot(state_value, aes(fill = estimate, color = estimate)) + 
            geom_sf() + 
            scale_fill_viridis_c(labels = scales::dollar) +  
            scale_color_viridis_c(guide = FALSE) + 
            theme_minimal() + 
            coord_sf(crs = 26911, datum = NA) + 
            labs(title = "Median owner-occupied housing value by Census tract", 
                subtitle = "Nationwide", 
                caption = "Data source: 2012-2016 ACS.\nData acquired with the R tidycensus package.", 
                fill = "ACS estimate")
          ```

          Using "st_centroid" to create graduated visualizations in R
          ```{r}
          # Generate point centers
          centers <- st_centroid(state_value)

          # Set size parameter and the size range
          ggplot() + 
            geom_sf(data = state_value, fill = "white") + 
            geom_sf(data = centers, aes(size = estimate), shape = 21, 
                    fill = "lightblue", alpha = 0.7, show.legend = "point") + 
            scale_size_continuous(range = c(1, 20))
          ```

          #Using "mapview()" for easy interactive maps
          ```{r}
          state_value_nshift <- get_acs(geography = "state", 
                                variables = "B25077_001", 
                                year = 2020, 
                                geometry = TRUE, 
                                shift_geo = FALSE)

          m <- mapview(state_value_nshift, 
                  zcol = "estimate", 
                  legend = TRUE)
          m@map
          ```
          </details>
    2. An important part of data collection for the Farmer's Market Assets project will be to work with web APIs. For this reason, I started the "Working With Web Data in R" Course. I began focusing more on applying this training in Week Three.
    3. Worked to create maps for the Census Exercise. Wrote code in R to show the diversity of race in Illinois and South Dakota and the imparity between Male and Female populations for both states. The code in HTML format can be found [here](https://github.com/DSPG-2022/DSPG/blob/main/Contributors/Harun_Celik/HarunScriptCensusAssignment.html)


