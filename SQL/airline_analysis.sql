
-- SHOW DATABASES;

USE airline_analysis;


-- SELECT * FROM flight_data;


-- =========================================================
--               AIRLINE TICKET ANALYSIS
--                SQL BUSINESS ANALYSIS
-- =========================================================

-- Query 01: Total Revenue
-- Business Question:
-- What is the total revenue generated from all flight bookings?
SELECT 
    SUM(price) AS Total_Revenue
FROM flight_data;

-- =========================================================

-- Query 02: Total Flights
-- Business Question:
-- How many flight bookings are present in the dataset?
SELECT 
    COUNT(*) AS Total_flight_bookings
FROM flight_data;

-- =========================================================

-- Query 03: Total Revenue
-- Business Question:
-- What is the total revenue generated from all flight bookings?
SELECT 
    SUM(price) AS Total_Revenue
FROM flight_data;

-- =========================================================

-- Query 04: Average Ticket Price
-- Business Question:
-- What is the average ticket price across all flight bookings?
SELECT 
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data;

-- =========================================================

-- Query 05: Ticket Price Range
-- Business Question:
-- What are the cheapest and most expensive tickets in the dataset?
SELECT 
    MIN(price) AS Minimum_Ticket_Price, 
    MAX(price) AS Maximum_Ticket_Price
FROM flight_data;

-- =========================================================

-- Query 06: Average Flight Duration
-- Business Question:
-- What is the average duration of flights?
SELECT 
    ROUND(AVG(duration), 2) AS Average_Flight_Duration
FROM flight_data;

-- =========================================================

-- Query 07: Revenue by Airline
-- Business Question:
-- Which airlines generate the highest total revenue?
SELECT 
    airline, 
    SUM(price) AS Total_Revenue
FROM flight_data
GROUP BY airline
ORDER BY Total_Revenue DESC;

-- =========================================================

-- Query 08: Flights by Airline
-- Business Question:
-- Which airlines have the highest number of flight bookings?
SELECT 
    airline, 
    COUNT(*) AS Total_Flights
FROM flight_data
GROUP BY airline
ORDER BY Total_Flights DESC;

-- =========================================================

-- Query 09: Average Ticket Price by Airline
-- Business Question:
-- Which airlines have the highest average ticket prices?
SELECT 
    airline, 
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY airline
ORDER BY Average_Ticket_Price DESC;

-- =========================================================

-- Query 10: Airline Performance Summary
-- Business Question:
-- How does each airline perform across volume, revenue, and pricing?
SELECT
    airline,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY airline
ORDER BY Total_Revenue DESC;

-- =========================================================

-- Query 11: Revenue Contribution by Airline
-- Business Question:
-- What percentage of total revenue does each airline generate?
-- =========================================================

SELECT
    airline,
    SUM(price) AS Total_Revenue,
    ROUND(
        SUM(price) * 100.0 / (SELECT SUM(price) FROM flight_data),2) AS Revenue_Contribution_Percentage
FROM flight_data
GROUP BY airline
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 12: Revenue by Route
-- Business Question:
-- Which flight routes generate the highest revenue?
-- ============================================================

SELECT
    CONCAT(source_city, ' - ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 13: Top 10 Routes by Revenue
-- Business Question:
-- Which 10 routes generate the highest total revenue?
-- ============================================================

SELECT
    CONCAT(source_city, ' - ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ============================================================
-- Query 14: Top 10 Routes by Flight Volume
-- Business Question:
-- Which 10 routes have the highest booking volume?
-- ============================================================

SELECT
    CONCAT(source_city, ' - ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Total_Flights DESC
LIMIT 10;

-- ============================================================
-- Query 15: Top Routes by Average Ticket Price
-- Business Question:
-- Which routes have the highest average ticket prices?
-- Minimum 100 bookings ensures a meaningful comparison.
-- ============================================================

SELECT
    CONCAT(source_city, ' - ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    ROUND(AVG(price), 2) AS Average_Ticket_Price,
    SUM(price) AS Total_Revenue
FROM flight_data
GROUP BY source_city, destination_city
HAVING COUNT(*) >= 100
ORDER BY Average_Ticket_Price DESC
LIMIT 10;

-- ============================================================
-- Query 16: Revenue by Source City
-- Business Question:
-- Which source cities generate the highest revenue?
-- ============================================================

SELECT
    source_city, COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 17: Revenue by Destination City
-- Business Question:
-- Which destination cities generate the highest revenue?
-- ============================================================

SELECT
    destination_city,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY destination_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 18: Revenue by Route
-- Business Question:
-- Which flight routes generate the highest revenue?
-- ============================================================

SELECT
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 19: Revenue by Class
-- Business Question:
-- Which travel classes generate the highest revenue?
-- ============================================================

SELECT
    class,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY class
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 20: Revenue by Airline and Class
-- Business Question:
-- Which airline-class combinations generate the highest revenue?
-- ============================================================

SELECT
    airline,
    class,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY airline, class
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 21: Revenue by Booking Window
-- Business Question:
-- How does the time between booking and departure affect revenue?
-- ============================================================

SELECT
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END AS Booking_Window,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END
ORDER BY MIN(days_left);

-- ============================================================
-- Query 22: Revenue by Stops
-- Business Question:
-- How do the number of stops affect revenue and ticket pricing?
-- ============================================================

SELECT
    stops,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY stops
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 23: Revenue by Airline and Stops
-- Business Question:
-- Which airline and stop combinations generate the highest revenue?
-- ============================================================

SELECT
    airline,
    stops,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY airline, stops
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 24: Revenue by Airline and Booking Window
-- Business Question:
-- How does booking timing affect revenue across airlines?
-- ============================================================

SELECT
    airline,
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END AS Booking_Window,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY
    airline,
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END
ORDER BY
    Total_Revenue DESC;

-- ============================================================
-- Query 25: Revenue by Class and Booking Window
-- Business Question:
-- How does booking timing affect revenue across travel classes?
-- ============================================================

SELECT
    class,
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END AS Booking_Window,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY
    class,
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END
ORDER BY
    Total_Revenue DESC;

-- ============================================================
-- Query 26: Top Revenue Routes
-- Business Question:
-- Which routes generate the highest revenue while maintaining
-- strong average ticket prices?
-- ============================================================

SELECT
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ============================================================
-- Query 27: Highest Average Ticket Price by Route
-- Business Question:
-- Which routes have the highest average ticket prices?
-- ============================================================

SELECT
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Average_Ticket_Price DESC
LIMIT 10;

-- ============================================================
-- Query 28: Top Routes by Flight Volume
-- Business Question:
-- Which routes have the highest flight volume?
-- ============================================================

SELECT
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Total_Flights DESC
LIMIT 10;

-- ============================================================
-- Query 29: Revenue per Flight by Route
-- Business Question:
-- Which routes generate the highest revenue per flight?
-- ============================================================

SELECT
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Revenue_Per_Flight
FROM flight_data
GROUP BY source_city, destination_city
ORDER BY Revenue_Per_Flight DESC
LIMIT 10;

-- ============================================================
-- Query 30: Revenue Contribution by Airline
-- Business Question:
-- What percentage of total revenue is generated by each airline?
-- ============================================================

SELECT
    airline,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(SUM(price) * 100.0 / (SELECT SUM(price) FROM flight_data),2) AS Revenue_Contribution_Percentage
FROM flight_data
GROUP BY airline
ORDER BY Total_Revenue DESC;




-- ============================================================
-- Query 31: Revenue Contribution by Class
-- Business Question:
-- What percentage of total revenue is generated by each class?
-- ============================================================

SELECT
    class,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(SUM(price) * 100.0 / (SELECT SUM(price) FROM flight_data),2) AS Revenue_Contribution_Percentage,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY class
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 32: Revenue Contribution by Source City
-- Business Question:
-- What percentage of total revenue is generated by each
-- source/departure city?
-- ============================================================

SELECT
    source_city,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(SUM(price) * 100.0 / (SELECT SUM(price) FROM flight_data),2) AS Revenue_Contribution_Percentage,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY source_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 33: Revenue Contribution by Destination City
-- Business Question:
-- What percentage of total revenue is generated by each
-- destination/arrival city?
-- ============================================================

SELECT
    destination_city,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(SUM(price) * 100.0 / (SELECT SUM(price) FROM flight_data),2) AS Revenue_Contribution_Percentage,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY destination_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 34: Revenue by Airline & Source City
-- Business Question:
-- Which airline-source city combinations generate the highest
-- revenue?
-- ============================================================

SELECT
    airline,
    source_city,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY airline, source_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 35: Revenue by Airline & Destination City
-- Business Question:
-- Which airline-destination city combinations generate the
-- highest revenue?
-- ============================================================

SELECT
    airline,
    destination_city,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY airline, destination_city
ORDER BY Total_Revenue DESC;

-- ============================================================
-- Query 36: Highest-Value Airline Routes
-- Business Question:
-- Which airline-route combinations generate the highest revenue?
-- ============================================================

SELECT
    airline,
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY
    airline,
    source_city,
    destination_city
ORDER BY Total_Revenue DESC
LIMIT 20;

-- ============================================================
-- Query 37: Booking Window vs Average Ticket Price
-- Business Question:
-- How does booking timing affect the average ticket price?
-- ============================================================

SELECT
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END AS Booking_Window,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY
    CASE
        WHEN days_left <= 7 THEN '0-7 Days'
        WHEN days_left <= 15 THEN '8-15 Days'
        WHEN days_left <= 30 THEN '16-30 Days'
        WHEN days_left <= 60 THEN '31-60 Days'
        ELSE '60+ Days'
    END
ORDER BY MIN(days_left);

-- ============================================================
-- Query 38: Class vs Average Ticket Price
-- Business Question:
-- How does travel class affect average ticket price and revenue?
-- ============================================================

SELECT
    class,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price,
    MIN(price) AS Minimum_Ticket_Price,
    MAX(price) AS Maximum_Ticket_Price
FROM flight_data
GROUP BY class
ORDER BY Average_Ticket_Price DESC;

-- ============================================================
-- Query 39: Top 10 Revenue-Generating Segments
-- Business Question:
-- Which airline, class, and route combinations generate the highest revenue?
-- ============================================================

SELECT
    airline,
    class,
    CONCAT(source_city, ' → ', destination_city) AS Route,
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price
FROM flight_data
GROUP BY
    airline,
    class,
    source_city,
    destination_city
ORDER BY Total_Revenue DESC
LIMIT 10;

-- ============================================================
-- Query 40: Executive Business Summary
-- Business Question:
-- What are the overall revenue, flight volume, and pricing metrics/KPIs for the airline business?
-- ============================================================

SELECT
    COUNT(*) AS Total_Flights,
    SUM(price) AS Total_Revenue,
    ROUND(AVG(price), 2) AS Average_Ticket_Price,
    MIN(price) AS Minimum_Ticket_Price,
    MAX(price) AS Maximum_Ticket_Price
FROM flight_data;

