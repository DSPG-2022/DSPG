# Data Science for the Public Good

The Data Science for the Public Good (DSPG) Young Scholars program is an immersive summer program that engages students from across Iowa to work together on projects that address local and state government challenges around critical social issues relevant in the world today. Learn more about the program [here](https://dspg.iastate.edu/).

<br>

# Wholesale Local Food Benchmarking
## **Background**
The Iowa State Farm Food and Enterprise Development (FEED) is frequently asked for benchmarks on pricing of products both in retail and wholesale spaces. This occurs both within feasibility studies for new farm and food businesses and market assessments, as well as appropriate price points for selling to schools and early care sites, hospitals, universities, and other institutions. There was a need for additional data and research on the potential sales point for these wholesale products when many of our specialty crop producers across the state are operating in direct-to-consumer retail spaces. While data is available from the AMS and USDA (including the Agricultural Census), there is limited aggregation of sales for these products at the local level. 

**The **goal of the project** was to develop a process that provides more localized and up to date information on regional food systems and prices around local products.**
For the _**Final Presentation**_ click [here](https://github.com/DSPG-2022/Local-Food-Benchmarking/tree/main/Presentation)


![image](https://user-images.githubusercontent.com/17107300/183308940-2c73dfdd-b30b-4eb5-bb66-81fc56a1b3b2.png)
                             

<br>

## **Objectives**

- Data Discovery: Investigate the possibility of scraping data and getting data from social media sites
- Use Google Trends to identify potential key products by terms being searched
- Narrowing down the exact products for analysis
- Compare values of collected data with USDA price data to determine if this helps in better decision making
- Identify potential aspects that could be automated for future data collection
- Investigate potential use of AI to identify impacts to local food markets. For example, weather impacts


<br>

## **Outcomes**
- Used Google Trends to select the top five commodities (Apple, Strawberries, Pears, Tomatoes, Green Peppers)
- Compared the difference between USDA Vs local/Grocery/Food hubs price data
- End-to-end data automation process created for data collection (web scraping scheduler)
- Forecasted the prices and the most important variables affecting the prices using weather and economic factors


<br>

## **Workflow**
<br>

### **1) Data Collection**  
- Web scraping from sites like Iowa Food Co-op/Walmart 
- Physically attended Farmer's Market to collect local food prices
- Contacted local Iowa farmers for the selling price information

<br>

![image](https://user-images.githubusercontent.com/17107300/183311876-4ef9f1cf-b774-4669-b012-f27cd42537a7.png)








<br>



<br> 


### **2) Data Exploration**  

<br>

- Google hits by search for products over years
<br>


![image](https://user-images.githubusercontent.com/17107300/183311562-af9ec7d3-4c5f-4abe-9bd3-0f0510facd61.png)






<br>

- Price change over years (example Apple)

![image](https://user-images.githubusercontent.com/17107300/183311741-2b8a973e-5a60-4596-8fa8-94bc40e40124.png)

 
 
 
 
 - Price difference of organic Vs non-organic prices


![image](https://user-images.githubusercontent.com/17107300/183311769-61260556-e1eb-4f06-97d7-b90923a31728.png)



<br>

 - Negative correlation between search trends and prices (Low Price when Google Searches are High)

![image](https://user-images.githubusercontent.com/17107300/183311796-5cfab5b9-7d5d-498b-aef4-d99c01835a2b.png)




<br>



<br>



### **3) Finalizing the Top Commodities/Products for Analysis**  


![image](https://user-images.githubusercontent.com/17107300/183311924-de954844-3e66-43be-b3ff-7d5bf7abc732.png)







<br>


### **4) Comparison: USDA Vs local/Grocery/Food Hubs Price**  

- Compare the USDA price with the prices from all the data sources like Walmart or Institution or Wheatsfield

![image](https://user-images.githubusercontent.com/17107300/183317152-30e1f64c-5e9a-4a01-9a16-6a66ad379f1d.png)

**Grower price** - price the grower (ex- farmer) receives 
              <br> **Wholesale price** - price received by the wholesaler if there is one between the grower and the retailer
              <br>
               **Retail price** - price received by the store or retail outlet
               <br>* Average price is based on sample data points
 
 <br>
 

 - Price trend over years for multiple data sources

![image](https://user-images.githubusercontent.com/17107300/183317507-1833cbbc-7144-4a5b-8f7e-4f258f02c853.png)

 <br>
 

 - Where is your money going when you pay $1 for apple? Is the cost really $1?


![image](https://user-images.githubusercontent.com/17107300/183317611-55c132c3-115d-4207-9247-6eb7501ad8a8.png)

<br>


### **5) Data Automation**  

- Scrape the product information using Python and Postman API for automation (Please refer the codes section for more details)
- Script to schedule the web scraping process to run at a certain time per day/week (For more detailed steps please refer the presentation [here](https://github.com/DSPG-2022/Local-Food-Benchmarking/tree/main/Presentation))

<br>


### **6) AI: Predicting Average Price of a Commodity**  
- Regression and XGBoost models used for prediction (Please refer the codes section for more details)
- Computed average value of every variable at month level for years 2016 - 2021. For example: price of a commodity is calculated by taking for each month for mentioned years


- Indicators used:<br>

      1. Historical USDA retail price data of apples and tomatoes in the Midwest region (USDA Market News)
      2. Historical precipitation and temperature data from ISU mesonet: https://mesonet.agron.iastate.edu/ 
      3. Drought data in Story County, Iowa (drought.gov)
      4. 10 Year US Interest Rate (USO_US_Equity)
      5. Gold Bullion historical price (GLD_US_equity)
      6. Crude oil futures (WTI)
      7. BCOM Index Bloomberg Commodity Index (BCOM_Index)
  
         

- Top features by the model
<br>

![image](https://user-images.githubusercontent.com/17107300/183318335-fa901c98-ad97-4955-aa63-f45e5fc3d1c4.png)

<br>
<br>

- Actual Vs Predicted price graph
<br>

![image](https://user-images.githubusercontent.com/17107300/183318411-3071cb0b-3472-4c3d-a88a-f5e3670206f0.png)




<br>

## **Discussion and Next Steps**
<br>

- Further parameter tuning and adding more indicators to bring down the margin of error
- One key prospect in the future is to add weather data specific to where that commodity was grown, for example adding historical weather data from Washington or New York to find the correlation in how weather from those producer regions can directly impact the price of that commodity to the consumer 
- Use computer vision algorithms to automate data collection process by extract prices from the pictures from farmer's market
- Run python scheduler every week to collect the historical prices from websites
<br>


## **Data Sources**

<br>


Data was obtained from various sources. The 'Code Link' column contains link to code that utilizes the data for cleaning/analysis.

<br>

|  No. | Data Source      | Website Link  | Code Link |
| -    | -------------- | -------- | -------- |
|  1   |  Walmart - Fresh Fruits |  [Link](https://www.walmart.com/browse/food/fresh-fruits/976759_976793_9756351?povid=976759_x_flyout_9756351_fresh-fruits_Rweb_07_18) | [Link](https://github.com/DSPG-2022/Local-Food-Benchmarking/blob/main/Codes/WebScraping_scheduler.ipynb) |
|  2   |  Walmart - Fresh Vegetables|  [Link](https://www.walmart.com/browse/food/fresh-vegetables/976759_976793_8910423?povid=976759_x_flyout_8910423_fresh-vegetables_Rweb_07_18) |  [Link](https://github.com/DSPG-2022/Local-Food-Benchmarking/blob/main/Codes/WebScraping_scheduler.ipynb) |
|  3   |  Hy-Vee - Fresh Fruits | [Link](https://www.hy-vee.com/aisles-online/browse/fresh/fresh-fruits-and-vegetables/fresh-fruits)                                                                                                                                                                                  | [Link](https://github.com/DSPG-2022/Local-Food-Benchmarking/blob/main/Codes/Hyvee_Scraper.ipynb)              |                  
| 4   | Hy-Vee - Fresh Vegetables                       | [Link](https://www.hy-vee.com/aisles-online/browse/fresh/fresh-fruits-and-vegetables/fresh-vegetables)                                                                                                                                                                              | [Link](https://github.com/DSPG-2022/Local-Food-Benchmarking/blob/main/Codes/Hyvee_Scraper.ipynb)              |
| 5   | Iowa Food Coop                                 | [Link](https://shop.iowafood.coop/)                                                                                                                                                                                                                                                 | [Link](https://github.com/DSPG-2022/Local-Food-Benchmarking/blob/main/Codes/IowaFoodCoop_Scraper.ipynb) |
| 6   | Park Slope Food Co-op                          | [Link](https://www.foodcoop.com/produce/)                                                                                                                                                                                                                                           |           | -
| 7   | Prudent Produce - Fruit                        | [Link](https://www.prudentproduce.net/shop/fruit)                                                                                                                                                                                                                                   | - |
| 8   | Prudent Produce - Vegetable                    | [Link](https://www.prudentproduce.net/shop/vegetables)                                                                                                                                                                                                                              | -  |
| 9   | USDA - AMS (Apple)*                            | [Link](https://www.marketnews.usda.gov/mnp/fv-report-retail?repType=&run=&portal=fv&locChoose=&commodityClass=&startIndex=1&type=retail&class=FRUITS&commodity=APPLES&region=MIDWEST+U.S.&organic=ALL&repDate=07%2F23%2F2022&endDate=07%2F29%2F2022&compareLy=No)                   | -                                                                                              |
| 10  | USDA - AMS (Strawberries)*                     | [Link](https://www.marketnews.usda.gov/mnp/fv-report-retail?portal=fv&category=retail&type=retail&region=NATIONAL&organic=ALL&navClass=FRUITS&commodity=STRAWBERRIES)                                                                                                               | -                                                                                            |
| 11  | USDA - AMS (Pears)*                            | [Link](https://www.marketnews.usda.gov/mnp/fv-report-retail?repType=&run=&portal=fv&locChoose=&commodityClass=&startIndex=1&type=retail&class=FRUITS&commodity=PEARS&region=MIDWEST+U.S.&organic=ALL&repDate=07%2F23%2F2022&endDate=07%2F29%2F2022&compareLy=No)                    | -                                                                                              |
| 12  | USDA - AMS (Tomatoes)*                         | [Link](https://www.marketnews.usda.gov/mnp/fv-report-retail?repType=&run=&portal=fv&locChoose=&commodityClass=&startIndex=1&type=retail&class=VEGETABLES&commodity=TOMATOES&region=MIDWEST+U.S.&organic=ALL&repDate=07%2F23%2F2022&endDate=07%2F29%2F2022&compareLy=No)             | -                                                                                              |
| 13  | USDA - AMS (Green Pepper)*                     | [Link](https://www.marketnews.usda.gov/mnp/fv-report-retail?repType=&run=&portal=fv&locChoose=&commodityClass=&startIndex=1&type=retail&class=VEGETABLES&commodity=PEPPERS%2C+BELL+TYPE&region=MIDWEST+U.S.&organic=ALL&repDate=07%2F23%2F2022&endDate=07%2F29%2F2022&compareLy=No) | -                                                                                              |
| 14  | Wheatsfield Co-op                              | Private                                                                                                                                                                                                                                                                             |                                                                                                       |
| 15  | Sysco - Wholesale Restaurant Food Distributor  | Private                                                                                                                                                                                                                                                                             |                                                                                                       |
| 16  | Iowa State University(ISU) Dining              | Private                                                                                                                                                                                                                                                                             |                                                                                                       |
| 17  | Stock Indexes                                  | [Link](https://www.bloomberg.com/markets/stocks)                                                                                                                                                                                                                                    | -                                                                                             |
| 18  | Google Trends                                 | [Link](https://trends.google.com/trends/?geo=US)                                                                                                                                                                                                                                    | [Link](https://github.com/DSPG-2022/Local-Food-Benchmarking/blob/main/Codes/Google%20Trends%20Analysis.R)          |
| 19  | Iowa Environmental Mesonet                     | [Link](https://mesonet.agron.iastate.edu/)                                                                                                                                                                                                                                          | -                                                                                             |
| 20  | National Integrated Drought Information System | [Link](https://www.drought.gov/)                                                                                                                                                                                                                                                    | -                                                                                              |
| 21  | Farmers Market                                 | [Link](https://iastate.box.com/s/glt4wrmsqhag98f94osfxxe3iwjx9yxq)                                                                                                                                                                                                                  | -                                                                                             |

\* _Retrieved report from 2016-2021
<br>
The indicators were computed using public datasets obtained from different sources/agencies. Number of available years and granularity of the data varied across sources. Data sources for few indicators were not identified, therefore the project team could not compute the corresponding indicators. Detailed information about sources used can be found [here](https://iastate.box.com/s/ssxvtphr6oxq5qolqtw7fdn9936uofjo)._ [Private]

<br>

## **Code**

<br>

Both data scraping and model building was implemented in Python. The google trends analysis was done in R. Corresponding code is available on:

- [GitHub Repository](https://github.com/DSPG-2022/Local-Food-Benchmarking/tree/main/Codes)
- For the Final Presentation click [here](https://github.com/DSPG-2022/Local-Food-Benchmarking/tree/main/Presentation) [Private]

<br>

## **Other Documents**

<br>

- https://www.agmrc.org/fruit-and-vegetable-market-data?StartDate=2022-03-18&EndDate=2022-03-25&page=1&items=25
- https://www.ers.usda.gov/publications/pub-details/?pubid=101785ohttps://www.ers.usda.gov/data-products/food-dollar-series/
- https://www.ers.usda.gov/data-products/food-consumption-and-nutrient-intakes/
- https://www.ers.usda.gov/data-products/arms-farm-financial-and-crop-production-practices/
- https://www.ers.usda.gov/publications/pub-details/?pubid=42807

<br>

## **Team**

<br>

The team brought together backgrounds in Computer Science, Data Science, Economics, and Political Science, with interests in applications of technical skills to achieve meaningful impacts for decision making processes related to products at the local level.

- **Adisak Sukul** - Team Leader, Iowa State University, Computer Science
- **Muskan Tantia** - Graduate fellow, Iowa State University, Computer Science
- **Maxwell Skinner** - Intern, Iowa State University, Data Science & Political Science
- **Nabil Idris** - Intern, Iowa State University, Data Science
- **Nayha Hussain** - Intern, Clemson University, Computer Science and Economics

<br>
