Harun Celik’s DSPG Journal
================
Harun Celik
2022-08-03

-   <a href="#bio" id="toc-bio"><strong>Bio</strong></a>
    -   <a href="#education-background"
        id="toc-education-background"><strong>Education Background</strong></a>
    -   <a href="#skills-and-interests"
        id="toc-skills-and-interests"><strong>Skills and Interests</strong></a>
-   <a href="#projects" id="toc-projects"><strong>Projects</strong></a>
-   <a href="#weekly-agenda" id="toc-weekly-agenda"><strong>Weekly
    Agenda</strong></a>
    -   <a href="#week-one" id="toc-week-one">Week One</a>
    -   <a href="#week-two" id="toc-week-two">Week Two</a>
    -   <a href="#week-three" id="toc-week-three">Week Three</a>
    -   <a href="#week-four" id="toc-week-four">Week Four</a>
    -   <a href="#week-five" id="toc-week-five">Week Five</a>
    -   <a href="#week-six" id="toc-week-six">Week Six</a>

## **Bio**

Harun Celik is a PhD student in the RATE Program of History at Iowa
State University. He is interested in Digital Humanities and Data
Applications. While most of his experience is in teaching and editorial
work, he has growing interest in pursuing work in data engineering and
visualization in the field of Humanities. In the DSPG program, he is
working as a fellow for the projects *DHR: Iowans with Disabilites* and
the *AgMRC: Beginning Farmer Asset Mapping and Risk Management*.

### **Education Background**

-   PhD: RATE Program of History at Iowa State University
-   Master’s Degree: History at Bilkent University
-   Bachelor’s Degree: International Relations at Bilkent University

### **Skills and Interests**

-   GIS
-   R
-   Python
-   Pandas library for Python
-   Maps! I LOVE maps!!

## **Projects**

<center>
Fill Project Information Here. Add Links to Repo and Webpages
</center>

## **Weekly Agenda**

### Week One

#### Tasks

-   [x] Download R, Github Desktop, Tableau and other necessary programs
-   [x] Finish DataCamp Assessments
-   [x] Choose application/tool for team management
-   [x] Finish DataCamp tutorials around tidyverse fundamentals in R
-   [x] Finish DataCamp tutorials around different import and clean
    fundamentals in R  
-   [x] Conduct preliminary research on project data/literature review

#### What I’ve learned

-   **R**
    1.  Assessments showed that I was weakest in cleaning and importing
        data so I completed an *Introduction to the Tidyverse* course.
    2.  Started the course *Introduction to Importing Data in R* for
        better understanding importing different file types from excel,
        csv, to SQL or other statistical databases.
        1.  Particularly working with packages like
            `utils, readr, data.table` and `fread` for viewing local
            files in different formats.
    3.  Learned to work with categorical data in the Tidyverse.
        1.  Using `forcats` functions like:
            1.  `fct_reorder(), fct_collapse(), fct_other(), fct_relevel(), fct_rev(), fct_recode()`
        2.  `Tidyverse` functions like:
            1.  `case_when(), mutate_if(), gather(), str_remove()`
        3.  `ggpplot2` tricks like:
            1.  `scales::percent_format(), labs(), axis.text.x`
    4.  Started courses on the usage of the `tidycensus` package for
        census data manipulation in R.
        1.  Learned to work specifically with functions like:
            1.  `get_acs, get_decennial, moe_sum(), moe_product(), moe_ratio(), moe_prop()`

### Week Two

##### Tasks

-   [x] Create daily tasks and objectives to be shared with the team.
-   [x] Finish DataCamp tutorials around tidycensus fundamentals in R
-   [x] Start DataCamp tutorials around Web data manipulation and API
    operations in R
-   [x] Find and complete tutorials on data handling and pipelining with
    Tableau
-   [x] Conduct preliminary research on project data/literature review
    for DHR and AgMRC projects
-   [x] Compile a report of the preliminary research conducted for DHR
-   [x] Compile a report of the preliminary research conducted for
    Farmer’s Asset Mapping

##### What I’ve learned

-   **R**
    -   As the DHR Disabilities in Iowa project will focus on the use of
        data from the census bureau, I continued my training in learning
        `tidycensus, tigris` and `sf` libraries.
        <details>
        <summary>
        Click here for examples of practice codes:
        </summary>

        ``` r
        library(tidycensus)
        library(tigris)
        library(tidyverse)
        library(sf)
        ```

        ``` r
        #Using tracts and county to plot maps with tigris
        co_counties <- tracts(state = "IA", county = "story")
        plot(co_counties)
        ```

        ``` r
        #Using area_water to plot water features with tigris
        ames_water <- area_water(state = "IA", county = "story")
        plot(ames_water)
        ```

        ``` r
        #Using primary_secondary_roads to plot road features with tigris
        ames_roads <- primary_secondary_roads(state = "IA")
        plot(ames_roads)
        ```

        ``` r
        #Using @proj4string to check coordinate systems with tigris
        ia_counties <- counties("IA") 

        ia_counties@proj4string
        ```

        ``` r
        #Using "cb = TRUE" for outlining cartographic boundaries
        # Get a counties dataset for Iowa
        options(tigris_class = "sf")

        ia_tiger <- counties("IA")

        # Get the equivalent cartographic boundary shapefile
        ia_cb <- counties("IA", cb = TRUE)

        # Overlay the two on a plot to make a comparison using "add = TRUE"
        plot(ia_tiger$geometry)
        plot(ia_cb$geometry, add = TRUE, border = "red")
        ```

        ``` r
        #Using tigris_cache_dir & tigris_use_cache to load files quicker
        # Set the cache directory
        tigris_cache_dir("~/blah/blah")

        # Set the tigris_use_cache option
        options(tigris_use_cache = TRUE)

        # Check to see that you've modified the option correctly
        getOption("tigris_use_cache")
        ```

        ``` r
        #Comparing historical tracts with one another // par is used to put items side by side
        ames_1990 <- tracts(state = "IA", county = "story", cb = TRUE, year = 1990)
        ames_2016 <- tracts(state = "IA", county = "story", cb = TRUE, year = 2016)

        par(mfrow = c(1, 2))
        plot(ames_1990$geometry)
        plot(ames_2016$geometry)
        ```

        ``` r
        #Combining tigris datasets
        ia_tracts <- tracts("OR", cb = TRUE)
        ne_tracts <- tracts("NE", cb = TRUE)

        # Check the tigris attributes of each object
        attr(ia_tracts, "tigris")
        attr(ne_tracts, "tigris")

        # Combine the datasets then plot the result
        ia_ne_tracts <- rbind_tigris(ne_tracts, ia_tracts)
        plot(ia_ne_tracts$geometry)
        ```

        ``` r
        #Using a "map()" function to rbind_tigris
        # Generate a vector of state codes and assign to new_england
        new_england <- c("ME", "NH", "VT", "MA")

        # Iterate through the states and request tract data for state
        ne_tracts <- map(new_england, function(x) {
          tracts(state = x, cb = TRUE)
        }) %>%
          rbind_tigris()

        plot(ne_tracts$geometry)
        ```

        ``` r
        #Making maps using ggplot in R with tigris
        ia_house <- state_legislative_districts(state = "IA", house = "lower", cb = TRUE)

        ggplot(ia_house, aes(color = "black", fill = "red")) + 
          geom_sf() +
          #Change coordinate system and remove background with "datum = NA"
          coord_sf(crs = 3083, datum = NA) +
          scale_fill_manual(values =  c("People" = "red")) +
          labs(title = "Good old Iowa")
        ```

        ``` r
        #Using the "geometry = TRUE" paramater to auto join acs data with tigris data
        # Get dataset with geometry set to TRUE
        orange_value <- get_acs(geography = "tract", state = "CA", 
                            county = "Orange", 
                            variables = "B25077_001", 
                            geometry = TRUE)

        # Plot the estimate to view a map of the data
        plot(orange_value["estimate"])
        ```

        ``` r
        #Using "geography = school district (unified)" from get_acs and "school_district()" from tigris to join school data
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

        ``` r
        #Using "shift_geo" to include Alaska and Hawaii in State-wide maps
        # Get a dataset of median home values from the 1-year ACS
        state_value <- get_acs(geography = "state", 
                              variables = "B25077_001", 
                              year = 2020, 
                              geometry = TRUE, 
                              shift_geo = TRUE)

        # Plot the dataset to view the shifted geometry
        plot(state_value["estimate"])
        ```

        ``` r
        #Using ggplot2 to map demographic data
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

        ``` r
        #Using "st_centroid" to create graduated visualizations in R
        # Generate point centers
        centers <- st_centroid(state_value)

        # Set size parameter and the size range
        ggplot() + 
          geom_sf(data = state_value, fill = "white") + 
          geom_sf(data = centers, aes(size = estimate), shape = 21, 
                  fill = "lightblue", alpha = 0.7, show.legend = "point") + 
          scale_size_continuous(range = c(1, 20))
        ```

        ``` r
        #Using "mapview()" for easy interactive maps
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
    -   An important part of data collection for the Farmer’s Market
        Assets project will be to work with web APIs. For this reason, I
        started the “Working With Web Data in R” Course. I began
        focusing more on applying this training in Week Three.
    -   Worked to create maps for the Census Exercise. Wrote code in R
        to show the diversity of race in Illinois and South Dakota and
        the imparity between Male and Female populations for both
        states. The code in HTML format can be found
        [here](https://github.com/DSPG-2022/DSPG/blob/main/Contributors/Harun_Celik/HarunScriptCensusAssignment.html)

### Week Three

#### Tasks

-   [x] Create daily tasks and objectives to be shared with the team.
-   [x] Finish DataCamp tutorials around Web data manipulation and API
    operations in R
-   [x] Find and complete tutorials on data handling and pipelining with
    Tableau
-   [x] Conduct preliminary research on project data/literature review
    for DHR and AgMRC projects
-   [x] Bring in guest speaker to explain operations for ISU’s [Mesonet
    Webpage](https://mesonet.agron.iastate.edu/)

#### What I’ve learned

-   **R**
    -   The Farmer’s Asset Mapping project heavily focuses on the
        extraction of data from different weather organizations as well
        as datasets for soil data. As an important resource, I continued
        practicing with APIs and Web scraping by using [Iowa State
        University’s Mesonet](https://mesonet.agron.iastate.edu/). I
        continued my training in learning the `rvest` library.
        <details>
        <summary>
        Click here for code:
        </summary>

        ``` r
        library(dplyr)
        library(ggplot2)
        library(rvest)
        library(xml2)
        library(readr)
        library(tidyr)
        ```

        ``` r
        # Reading the URL to import the table
        mesonet_web <- read_html("https://mesonet.agron.iastate.edu/rainfall/bypoint.phtml?syear=2022&eyear=2022&view=online&method=geocode&lat=&street=640+Lincoln+Way&nwsli=&lon=&city=Ames")

        # This code shows the xml structure of the web page
        xml_structure(mesonet_web)
        ```

        ``` r
        #this code is to find the proper node where information is contained
        meso_rev_nodes <- xml_find_all(mesonet_web, "//pre")

        #convert the xml into a text file
        meso_pre <- xml_text(meso_rev_nodes)
        ```

        ``` r
        # This code doesn't actually output any attributes so the container could be containing text instead.
        xml_attrs(meso_rev_nodes)

        #This code proves that inside the node '/pre' is actually just a text file
        xml_structure(meso_rev_nodes)
        ```

        ``` r
        #This code reads the text file from the extracted xml
        meso_text <- read_lines(meso_pre, skip = 5)
        ```

        ``` r
        meso_df_csv <- data.frame(meso_text)
        ```

        ``` r
        # This cleans the data from NA values as well as rows which don't contain the necessary data
        cleaned <- meso_df_csv %>%
        separate(meso_text, into = c("Date", "Inches_Rain"), sep = ", ", convert = TRUE) %>%
        filter(!is.na(Inches_Rain))
        ```

        </details>

### Week Four

#### Tasks

-   [x] Create daily tasks and objectives to be shared with the team.
-   [x] Finish DataCamp tutorials on reshaping data in R
-   [x] Start DataCamp tutorials on more advanced ggplot coding in R
-   [x] Find and complete tutorials on data handling and pipelining with
    Tableau
-   [x] Arrange presentation for DHR Data Discovery meeting
-   [x] Organize directories and begin outlining the different datasets
    available for projects
-   [x] Work on creating a mock project for Beginner Farmer’s Assets
    team

#### What I’ve learned

-   **R**
    -   My code for webscraping for [Iowa State University’s
        Mesonet](https://mesonet.agron.iastate.edu/) could better be
        adapted to a function. I continued working to create a script
        that would be easier to pull information from however this lead
        me to start trying to pull information from DayMet’s web
        services. I wrote most of the starting code which would later be
        completed by one of the interns.
        <details>
        <summary>
        Click here for code:
        </summary>

        ``` r
        library(ggplot2)
        library(httr)
        library(xml2)
        library(readr)
        library(rvest)
        library(tidyr)
        ```

        ``` r
        path <- "https://daymet.ornl.gov/single-pixel/api/data?lat=42.1&lon=-93.8&vars=prcp&years=2018,2019"

        weather_data_unclean <- GET(url = path)
        ```

        ``` r
        #content(weather_data)

        weather_data_text <- content(weather_data_unclean)

        write.csv(weather_data_text, "weather_data.csv")

        weather_data_cleaned <- read.csv("weather_data.csv", skip = 6)
        ```

        ``` r
        # This cleans the data from NA values as well as rows which don't contain the necessary data
        weather_data_cleaned %>% separate(weather_data_cleaned, into = c("Year", "Year_Day", "Precipitation(mm)"), sep = ", ", convert = TRUE)

        # Separation needs more work because of column types...
        ```

        </details>
    -   With the Data Discovery Meeting coming up with the DHR Client,
        my task was to organize a number of different visuals to be
        placed into the presentation.
    -   I continued my DataCamp training in R by focusing firstly on
        *Reshaping Data with tidyr*. The focus of this course was to get
        a better understanding of how to format data we receive in the
        projects using `tidyr`.

### Week Five

#### Tasks

-   [x] Detail the possible questions from the matrix document provided
    by client for interns to answer.
-   [x] Go through the Bureau of Labor Statistics Website to find
    relevant datasets.
-   [x] Go through the BRFSS to find relevant datasets.
-   [x] Go through the National Health Interview Survey to find relevant
    datasets.
-   [x] Go through the Social Security Administration Website to find
    relevant datasets.
-   [x] Learn more about weather predictive data.

#### What I’ve learned

-   *Data Exploration*
    -   In the post-client meeting for the DHR client, we learned more
        in detail about the different services and organizations that we
        needed to explore. For the time being, I put aside working on
        the visualizations with the students and began conducting a
        literature review of the organizations and links they provided
        for our project’s progress.
    -   For the Beginning Farmer’s project, the interns continue
        focusing on their respective parts of the project which dealt
        with getting weather data, matching soil data to suitability
        indices and having Sanika calculate GDDs. Using the IEM
        Reanalysis tool, I started working on code to pull json
        formatted date from the MesoNet webpage.
        <details>
        <summary>
        Click here for code:
        </summary>

        ``` r
        #Format URL to be ready for time and place input
        base_url <- "https://mesonet.agron.iastate.edu/iemre/multiday/"

        start_time = "2019-01-01"
        end_time = "2019-06-01"
        latitude = "42.54"
        longitude = "-96.40"

        full_url <- sprintf("https://mesonet.agron.iastate.edu/iemre/multiday/%s/%s/%s/%s/json", start_time, end_time, latitude, longitude)
        ```

        ``` r
        ## Downloads data from the IEM website in json format
        #download.file(url = full_url, destfile = "test.json")

        #Read Json file
        IEM_json <- fromJSON(file = "test.json")
        ```

        ``` r
        #Converting to data frame
        IEM_data <- as.data.frame(IEM_json)
        ```

        ``` r
        #Converting output to a long format
        IEM_long <- gather(IEM_data, key = "variables", value = "data")
        ```

        ``` r
        #Cleaning value names before converting wide

        IEM_clean_variables <- IEM_long$variables %>% 
          str_replace("data.", "") %>%
          str_replace("\\..*", "")

        IEM_long$variables = c(IEM_clean_variables)
        ```

        ``` r
        #Pivoting data frame to Wide Format
        IEM_wide <- IEM_long %>%
          mutate(row = row_number()) %>%
          pivot_wider(-row,
                      names_from = variables,
                      values_from = data
          )
        IEM_please <- IEM_wide %>%
          unnest(IEM_wide)
        ```

        </details>

### Week Six

#### Tasks

-   [x] Detail the possible questions from the matrix document provided
    by client for interns to answer.
-   [x] Go through the Bureau of Labor Statistics Website to find
    relevant datasets.
-   [x] Go through the BRFSS to find relevant datasets.
-   [x] Go through the National Health Interview Survey to find relevant
    datasets.
-   [x] Go through the Social Security Administration Website to find
    relevant datasets.

#### What I’ve learned

-   *Data Exploration*
    -   Our client meeting with the AgMRC client helped to orient the
        direction of our project towards a number of different
        additions. We decided to work on including more details to our
        dashboard, we decided to start focusing on certain aspects of
        risk management, using suitability ratings to determine map
        units and focusing on soil type as an important indicator of
        suitability.
    -   
