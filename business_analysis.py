import pandas as pd
import matplotlib.pyplot as plt

# ====================================
# LOAD DATA
# ====================================
df = pd.read_csv("Data/flight_data.csv")

# Remove unwanted column
df = df.drop("Unnamed: 0", axis=1)

print("=" * 60)
print("COMMERCIAL BUSINESS ANALYSIS")
print("=" * 60)

# ====================================
# DATA UNDERSTANDING
# ====================================

print("\nDATASET SHAPE")
print(df.shape)

print("\nCOLUMN NAMES")
print(df.columns.tolist())

print("\nDATA TYPES")
print(df.dtypes)

print("\nMISSING VALUES")
print(df.isnull().sum())

print("\nDUPLICATE RECORDS")
print(df.duplicated().sum())

# ====================================
# DATA CLEANING
# ====================================

print("\nDATA CLEANING")

print("\nRows Before Removing Duplicates")
print(len(df))

df = df.drop_duplicates()

print("\nRows After Removing Duplicates")
print(len(df))

# ====================================
# BASIC KPIs
# ====================================

print("\nTOTAL FLIGHTS")
print(len(df))

print("\nTOTAL REVENUE")
print(round(df["price"].sum(),2))

print("\nAVERAGE TICKET PRICE")
print(round(df["price"].mean(),2))

print("\nAVERAGE FLIGHT DURATION")
print(round(df["duration"].mean(),2))

# ====================================
# AIRLINE PERFORMANCE
# ====================================

print("\nFLIGHTS BY AIRLINE")
print(df["airline"].value_counts())

print("\nREVENUE BY AIRLINE")
print(df.groupby("airline")["price"].sum().sort_values(ascending=False))

print("\nAVERAGE TICKET PRICE BY AIRLINE")
print(df.groupby("airline")["price"].mean().sort_values(ascending=False))

print("\nAVERAGE FLIGHT DURATION BY AIRLINE")
print(df.groupby("airline")["duration"].mean().sort_values(ascending=False))


# ====================================
# CLASS PERFORMANCE
# ====================================

print("\nFLIGHTS BY CLASS")
print(df["class"].value_counts())

print("\nREVENUE BY CLASS")
print(df.groupby("class")["price"].sum())

print("\nAVERAGE TICKET PRICE BY CLASS")
print(df.groupby("class")["price"].mean())

print("\nAVERAGE FLIGHT DURATION BY CLASS")
print(df.groupby("class")["duration"].mean())


# ====================================
# STOPS ANALYSIS
# ====================================

print("\nFLIGHTS BY STOPS")
print(df["stops"].value_counts())

print("\nAVERAGE TICKET PRICE BY STOPS")
print(df.groupby("stops")["price"].mean().sort_values(ascending=False))

print("\nAVERAGE FLIGHT DURATION BY STOPS")
print(df.groupby("stops")["duration"].mean().sort_values(ascending=False))


# ====================================
# CITY ANALYSIS
# ====================================

print("\nFLIGHTS BY SOURCE CITY")
print(df["source_city"].value_counts())

print("\nFLIGHTS BY DESTINATION CITY")
print(df["destination_city"].value_counts())

print("\nREVENUE BY SOURCE CITY")
print(df.groupby("source_city")["price"].sum().sort_values(ascending=False))

print("\nREVENUE BY DESTINATION CITY")
print(df.groupby("destination_city")["price"].sum().sort_values(ascending=False))


# ====================================
# ROUTE ANALYSIS
# ====================================

print("\nTOP 10 ROUTES BY NUMBER OF FLIGHTS")

top_routes = (df.groupby(["source_city", "destination_city"]).size().sort_values(ascending=False))

print(top_routes.head(10))

print("\nTOP 10 ROUTES BY AVERAGE TICKET PRICE")

top_price_routes = (df.groupby(["source_city", "destination_city"])["price"].mean().sort_values(ascending=False))

print(top_price_routes.head(10))


# ====================================
# BOOKING WINDOW ANALYSIS
# ====================================

print("\nAVERAGE TICKET PRICE BY DAYS LEFT")

booking_window = (df.groupby("days_left")["price"].mean().sort_index())

print(booking_window)

print("\nTOP 10 MOST EXPENSIVE BOOKING DAYS")

print(booking_window.sort_values(ascending=False).head(10))


# ====================================
# DEPARTURE TIME ANALYSIS
# ====================================

print("\nFLIGHTS BY DEPARTURE TIME")

print(df["departure_time"].value_counts())

print("\nAVERAGE TICKET PRICE BY DEPARTURE TIME")

print(df.groupby("departure_time")["price"].mean().sort_values(ascending=False))

print("\nREVENUE BY DEPARTURE TIME")

print(df.groupby("departure_time")["price"].sum().sort_values(ascending=False))


# ====================================
# ARRIVAL TIME ANALYSIS
# ====================================

print("\nFLIGHTS BY ARRIVAL TIME")

print(df["arrival_time"].value_counts())

print("\nAVERAGE TICKET PRICE BY ARRIVAL TIME")

print(df.groupby("arrival_time")["price"].mean().sort_values(ascending=False))

print("\nREVENUE BY ARRIVAL TIME")

print(df.groupby("arrival_time")["price"].sum().sort_values(ascending=False))


# ====================================
# FLIGHT DURATION ANALYSIS
# ====================================

print("\nTOP 10 LONGEST FLIGHTS")

longest_flights = (
    df.sort_values(by="duration", ascending=False)
    [["airline", "source_city", "destination_city", "duration", "price"]])

print(longest_flights.head(10))

print("\nTOP 10 SHORTEST FLIGHTS")

shortest_flights = (
    df.sort_values(by="duration", ascending=True)
    [["airline", "source_city", "destination_city", "duration", "price"]])

print(shortest_flights.head(10))


# ====================================
# TOP 10 MOST EXPENSIVE TICKETS
# ====================================

print("\nTOP 10 MOST EXPENSIVE TICKETS")

expensive_tickets = (
    df.sort_values(by="price", ascending=False)
    [["airline", "source_city", "destination_city", "class", "stops", "duration", "days_left", "price"]])

print(expensive_tickets.head(10))

print("\nTOP 10 LEAST EXPENSIVE TICKETS")

cheap_tickets = (
    df.sort_values(by="price", ascending=True)
    [["airline", "source_city", "destination_city", "class", "stops", "duration", "days_left", "price"]])

print(cheap_tickets.head(10))


# ====================================
# SAVE CLEANED DATA
# ====================================

df.to_csv("Output/cleaned_flight_data.csv", index=False)

print("\nCLEANED DATA SAVED SUCCESSFULLY")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# ====================================
# EXPORT BUSINESS REPORTS
# ====================================

# Revenue by Airline
revenue_by_airline = (
    df.groupby("airline")["price"]
    .sum()
    .reset_index()
    .sort_values(by="price", ascending=False)
)

revenue_by_airline.to_csv(
    "Business_Reports/revenue_by_airline.csv",
    index=False
)

print("Revenue by Airline report exported.")


# Flights by Airline
flights_by_airline = (
    df.groupby("airline")
    .size()
    .reset_index(name="total_flights")
    .sort_values(by="total_flights", ascending=False)
)

flights_by_airline.to_csv(
    "Business_Reports/flights_by_airline.csv",
    index=False
)

print("Flights by Airline report exported.")


# Revenue by Source City
revenue_by_source = (
    df.groupby("source_city")["price"]
    .sum()
    .reset_index()
    .sort_values(by="price", ascending=False)
)

revenue_by_source.to_csv(
    "Business_Reports/revenue_by_source_city.csv",
    index=False
)

print("Revenue by Source City report exported.")


# Revenue by Destination City
revenue_by_destination = (
    df.groupby("destination_city")["price"]
    .sum()
    .reset_index()
    .sort_values(by="price", ascending=False)
)

revenue_by_destination.to_csv(
    "Business_Reports/revenue_by_destination_city.csv",
    index=False
)

print("Revenue by Destination City report exported.")


# Average Ticket Price by Airline
average_price_by_airline = (
    df.groupby("airline")["price"]
    .mean()
    .reset_index()
    .rename(columns={"price": "average_ticket_price"})
    .sort_values(by="average_ticket_price", ascending=False)
)

average_price_by_airline.to_csv(
    "Business_Reports/average_ticket_price_by_airline.csv",
    index=False
)

print("Average Ticket Price by Airline report exported.")


# Revenue by Class
revenue_by_class = (
    df.groupby("class")["price"]
    .sum()
    .reset_index()
    .sort_values(by="price", ascending=False)
)

revenue_by_class.to_csv(
    "Business_Reports/revenue_by_class.csv",
    index=False
)

print("Revenue by Class report exported.")


# Average Ticket Price by Booking Window
average_price_by_days_left = (
    df.groupby("days_left")["price"]
    .mean()
    .reset_index()
    .rename(columns={"price": "average_ticket_price"})
    .sort_values(by="days_left")
)

average_price_by_days_left.to_csv(
    "Business_Reports/average_ticket_price_by_days_left.csv",
    index=False
)

print("Average Ticket Price by Booking Window report exported.")


# Top 10 Routes by Average Ticket Price
top_routes_by_price = (
    df.groupby(["source_city", "destination_city"])["price"]
    .mean()
    .reset_index()
    .rename(columns={"price": "average_ticket_price"})
    .sort_values(by="average_ticket_price", ascending=False)
    .head(10)
)

top_routes_by_price.to_csv(
    "Business_Reports/top_10_routes_by_average_ticket_price.csv",
    index=False
)

print("Top 10 Routes by Average Ticket Price report exported.")



# Making the reports even more useful by exporting a route performance report.


# Route Performance Report
route_performance = (
    df.groupby(["source_city", "destination_city"])
    .agg(
        total_flights=("price", "count"),
        average_ticket_price=("price", "mean"),
        total_revenue=("price", "sum"),
        average_duration=("duration", "mean")
    )
    .reset_index()
    .sort_values(by="total_revenue", ascending=False)
)

route_performance.to_csv(
    "Business_Reports/route_performance.csv",
    index=False
)

print("Route Performance report exported.")


# ====================================
# AIRLINE PERFORMANCE REPORT
# ====================================

airline_performance = (
    df.groupby("airline")
    .agg(
        total_flights=("price", "count"),
        total_revenue=("price", "sum"),
        average_ticket_price=("price", "mean"),
        average_duration=("duration", "mean")
    )
    .reset_index()
    .sort_values(by="total_revenue", ascending=False)
)

airline_performance.to_csv(
    "Business_Reports/airline_performance.csv",
    index=False
)

print("Airline Performance report exported.")



# ====================================
# EXPORT CITY PERFORMANCE REPORT
# ====================================

city_performance = (
    df.groupby("source_city")
    .agg(
        total_flights=("airline", "count"),
        total_revenue=("price", "sum"),
        average_ticket_price=("price", "mean"),
        average_duration=("duration", "mean")
    )
    .reset_index()
)

city_performance.to_csv(
    "Business_Reports/source_city_performance.csv",
    index=False
)

print("Source City Performance report exported.")