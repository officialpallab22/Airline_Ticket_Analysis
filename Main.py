import pandas as pd
import matplotlib.pyplot as plt

# ====================================
# LOAD DATASET
# ====================================
df = pd.read_csv("Data/flight_data.csv")

# Remove unwanted column
df = df.drop("Unnamed: 0", axis=1)

# ====================================
# DATA UNDERSTANDING
# ====================================
print("\nDATASET SHAPE")
print(df.shape)

print("\nCOLUMN NAMES")
print(df.columns)

print("\nDATA INFORMATION")
print(df.info())

print("\nFIRST 5 ROWS")
print(df.head())

print("\nDATA SUMMARY")
print(df.describe(include="all"))

# ====================================
# DATA CLEANING
# ====================================
print("\nMISSING VALUES")
print(df.isnull().sum())

print("\nDUPLICATE RECORDS")
print(df.duplicated().sum())

df = df.drop_duplicates()

# ====================================
# ANALYSIS
# ====================================

# Total Flights
print("\nTOTAL FLIGHTS")
print(len(df))

# Total Revenue
print("\nTOTAL REVENUE")
print(df["price"].sum())

# Average Ticket Price
print("\nAVERAGE TICKET PRICE")
print(round(df["price"].mean(), 2))

# Flights by Airline
print("\nFLIGHTS BY AIRLINE")
print(df["airline"].value_counts())

# Flights by Class
print("\nFLIGHTS BY CLASS")
print(df["class"].value_counts())

# Flights by Stops
print("\nFLIGHTS BY STOPS")
print(df["stops"].value_counts())

# Source City Analysis
print("\nSOURCE CITY ANALYSIS")
print(df["source_city"].value_counts())

# Destination City Analysis
print("\nDESTINATION CITY ANALYSIS")
print(df["destination_city"].value_counts())

# Revenue by Airline
print("\nREVENUE BY AIRLINE")
print(df.groupby("airline")["price"].sum().sort_values(ascending=False))

# Revenue by Class
print("\nREVENUE BY CLASS")
print(df.groupby("class")["price"].sum())

# Average Price by Airline
print("\nAVERAGE PRICE BY AIRLINE")
print(df.groupby("airline")["price"].mean().sort_values(ascending=False))

# Average Duration by Airline
print("\nAVERAGE DURATION BY AIRLINE")
print(df.groupby("airline")["duration"].mean())

# Revenue by Source City
print("\nREVENUE BY SOURCE CITY")
print(df.groupby("source_city")["price"].sum().sort_values(ascending=False))

# Revenue by Destination City
print("\nREVENUE BY DESTINATION CITY")
print(df.groupby("destination_city")["price"].sum().sort_values(ascending=False))

# Top 10 Most Expensive Routes
print("\nTOP 10 MOST EXPENSIVE ROUTES")

route_price = (
    df.groupby(["source_city", "destination_city"])["price"]
    .mean()
    .sort_values(ascending=False)
)

print(route_price.head(10))

# Average Ticket Price By Class
print("\nAVERAGE TICKET PRICE BY CLASS")
print(df.groupby("class")["price"].mean())

# Average Ticket Price By Stops
print("\nAVERAGE TICKET PRICE BY STOPS")
print(df.groupby("stops")["price"].mean())

# ====================================
# SAVE CLEANED DATA
# ====================================
df.to_csv("Output/cleaned_flight_data.csv", index=False)

print("\nCLEANED DATA SAVED SUCCESSFULLY")

# ====================================
# CHART 1 - FLIGHTS BY AIRLINE
# ====================================
plt.figure(figsize=(8,5))

airline_count = df["airline"].value_counts()
airline_count.plot(kind="bar")

plt.title("Flights by Airline")
plt.xlabel("Airline")
plt.ylabel("Number of Flights")

plt.tight_layout()
plt.savefig("Charts/flights_by_airline.png")
plt.show()

# ====================================
# CHART 2 - REVENUE BY AIRLINE
# ====================================
plt.figure(figsize=(8,5))

revenue_by_airline = df.groupby("airline")["price"].sum()
revenue_by_airline.plot(kind="bar")

plt.title("Revenue by Airline")
plt.xlabel("Airline")
plt.ylabel("Revenue")

plt.tight_layout()
plt.savefig("Charts/revenue_by_airline.png")
plt.show()

# ====================================
# CHART 3 - CLASS DISTRIBUTION
# ====================================
plt.figure(figsize=(6,6))

class_count = df["class"].value_counts()

class_count.plot(
    kind="pie",
    autopct="%1.1f%%"
)

plt.title("Class Distribution")
plt.ylabel("")

plt.savefig("Charts/class_distribution.png")
plt.show()

# ====================================
# CHART 4 - STOPS DISTRIBUTION
# ====================================
plt.figure(figsize=(6,6))

stops_count = df["stops"].value_counts()

stops_count.plot(
    kind="pie",
    autopct="%1.1f%%"
)

plt.title("Stops Distribution")
plt.ylabel("")

plt.savefig("Charts/stops_distribution.png")
plt.show()

# ====================================
# CHART 5 - SOURCE CITY ANALYSIS
# ====================================
plt.figure(figsize=(8,5))

source_city_count = df["source_city"].value_counts()

source_city_count.plot(kind="bar")

plt.title("Flights by Source City")
plt.xlabel("Source City")
plt.ylabel("Number of Flights")

plt.tight_layout()
plt.savefig("Charts/source_city_analysis.png")
plt.show()

# ====================================
# CHART 6 - REVENUE BY CLASS
# ====================================
plt.figure(figsize=(8,5))

revenue_by_class = df.groupby("class")["price"].sum()

revenue_by_class.plot(kind="bar")

plt.title("Revenue by Class")
plt.xlabel("Class")
plt.ylabel("Revenue")

plt.tight_layout()
plt.savefig("Charts/revenue_by_class.png")
plt.show()

# ====================================
# CHART 7 - DESTINATION CITY ANALYSIS
# ====================================
plt.figure(figsize=(8,5))

destination_city_count = df["destination_city"].value_counts()

destination_city_count.plot(kind="bar")

plt.title("Flights by Destination City")
plt.xlabel("Destination City")
plt.ylabel("Number of Flights")

plt.tight_layout()
plt.savefig("Charts/destination_city_analysis.png")
plt.show()

# ====================================
# CHART 8 - AVERAGE PRICE BY AIRLINE
# ====================================
plt.figure(figsize=(8,5))

avg_price_by_airline = df.groupby("airline")["price"].mean()

avg_price_by_airline.plot(kind="bar")

plt.title("Average Price by Airline")
plt.xlabel("Airline")
plt.ylabel("Average Price")

plt.tight_layout()
plt.savefig("Charts/avg_price_by_airline.png")
plt.show()
