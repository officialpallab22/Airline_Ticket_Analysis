                                    -- Airline Ticket Analysis --
Project Overview:
This project analyzes airline ticket data to uncover insights related to flight operations, revenue generation, ticket pricing, and customer travel patterns.

The analysis was performed using Python, Pandas, and Matplotlib. The project includes data cleaning, exploratory data analysis, business metrics, and visualizations to help understand airline performance and pricing trends.


Business Problem:
Airlines generate large amounts of booking and pricing data. The objective of this project is to answer key business questions such as:

Which airline operates the most flights?
Which airline generates the highest revenue?
What is the average ticket price?
Which cities contribute the most revenue?
How do ticket prices vary across travel classes?
Which routes are the most expensive?

Dataset Information:
The dataset contains flight booking information with the following attributes:

Column	Description:
airline	Airline name
flight	Flight number
source_city	Departure city
departure_time	Departure time category
stops	Number of stops
arrival_time	Arrival time category
destination_city	Arrival city
class	Travel class (Economy/Business)
duration	Flight duration
days_left	Days left before departure
price	Ticket price

Total Records: 300,153

Tools & Technologies
Python
Pandas
Matplotlib
VS Code
Project Workflow
1. Data Loading
Imported dataset using Pandas
Loaded CSV file into DataFrame

2. Data Cleaning
Removed unwanted columns
Checked missing values
Checked duplicate records
Created cleaned dataset

3. Data Analysis
Performed analysis on:

Total Flights
Total Revenue
Average Ticket Price
Flights by Airline
Flights by Class
Flights by Stops
Revenue by Airline
Revenue by Class
Revenue by Source City
Revenue by Destination City
Average Price by Airline
Average Duration by Airline
Most Expensive Routes

4. Data Visualization
Created the following charts:

Flights by Airline
Revenue by Airline
Class Distribution
Stops Distribution
Flights by Source City
Revenue by Class
Flights by Destination City
Average Price by Airline

Key Insights:
1. Airline Performance - 
Vistara operates the highest number of flights.
Airlines show significant differences in average ticket prices.

2. Revenue Analysis -
Business Class contributes a substantial share of total revenue.
Revenue varies significantly across airlines and cities.

3. Route Analysis -
Certain city pairs generate much higher average ticket prices than others.
Major metropolitan cities contribute the largest revenue share.

4. Customer Travel Behavior - 
Most passengers prefer flights with fewer stops.
Economy Class accounts for the majority of bookings.


Project Structure - 
AIRLINE_TICKET_ANALYSIS
│
├── Charts
│   ├── flights_by_airline.png
│   ├── revenue_by_airline.png
│   ├── class_distribution.png
│   ├── stops_distribution.png
│   ├── source_city_analysis.png
│   ├── revenue_by_class.png
│   ├── destination_city_analysis.png
│   └── avg_price_by_airline.png
│
├── Data
│   └── flight_data.csv
│
├── Output
│   └── cleaned_flight_data.csv
│
├── Main.py
├── README.md
└── requirements.txt

Sample Visualizations - 
The project generates multiple charts that help visualize:
Airline market share
Revenue distribution
Travel class preferences
Destination popularity
Ticket pricing patterns

Author
Pallab Das
Aspiring Business Analyst | Data Analyst

Skills:
Python
Pandas
SQL
Power BI
Data Analysis
Data Visualization

Conclusion:
This project demonstrates how Python can be used to clean, analyze, and visualize airline ticket data. The insights generated can help stakeholders understand revenue patterns, customer behavior, and airline performance for better business decision-making.