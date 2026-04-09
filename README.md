# Global Supply Chain Risk Analysis 2024-2025
## Project Description:
Global trade has become increasingly volatile due to factors such as shifting geopolitical dynamics and/or climate-driven weather disruptions. These uncertainties challenge logistics professionals striving to maintain efficient, “just-in-time” supply chain operations. 

This project analyzes a dataset of 5,000 international shipments over 2 years to understand how various risk factors impact supply chain performance. While disruptions are often unavoidable, they can significantly increase lead times, delay deliveries, and reduce overall operational efficiency.

By identifying key drivers of disruption, this analysis aims to support more informed decision-making and improve supply chain resilience through proactive planning and route optimization.
### Objective:
While disruptions cannot be entirely eliminated, they can be better anticipated and managed.

This project seeks to answer:

Which factors most strongly contribute to shipment disruptions?
How do disruptions impact lead time and delivery performance?
How can these insights be used to improve routing and operational decisions?
### Methodology:
1. SQL (Exploratory Data Analysis):
-Assessed data quality, structure, and missing values
-Generated summary statistics and initial trends
2. SQL (Analytical Querying):
-Answered key business questions related to disruption drivers
-Evaluated relationships between transport mode, routes, and risk factors
3. Power BI Dashboard:
-Visualized key metrics (disruption rate, lead time, route performance)
-Built interactive dashboards for stakeholder insights
4. Machine Learning (Python):
-Applied feature engineering to key variables (geopolitical risk, weather, routes)
-Developed a predictive model to identify high-risk shipments
## Skills:
SQL: Case, Aggregate Functions
Power BI: DAX Writing, calculated columns, data modeling, data visualization
Python: Pandas, NumPy, Scikit-learn
## Key Insights: 
1. Transportation Mode (Transport, Product, Weather Condition)
-Disruption rates vary significantly by transport mode
-Air freight shows higher disruption frequency, while sea freight has longer lead times
-Certain product categories and weather conditions are more prone to disruption
3. Region and Regional Risk
-Specific ports and routes act as bottlenecks
-Higher geopolitical risk scores correlate with increased disruption rates
4. Lead Time Impact
-Increased disruptions are associated with longer average lead times
-Inefficiencies vary by route and transport mode

## Suggestions & Optimization
### Routing Optimization
-Optimize a route model that prioritizes geopolitical risks over shortest transit time.
### Transport Mode Optimization
-Use Air for urgent shipments and Sea freight for slow non-urgent shipments. 
### Predictive Risk Scoring
-Creating a risk scoring model based on geopolitical score, weather, and shipment routes can promote proactivity. 
