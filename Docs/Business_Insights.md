## Executive Summary - 
The airline dataset contains **300,153 recorded flight transactions**, generating total revenue of **₹6.27 billion**.
The overall average ticket price is **₹20,889.66**, while observed ticket prices range from **₹1,105** to **₹123,071**.
These figures establish the overall commercial baseline for evaluating airline, route, pricing, booking, and market performance throughout the analysis.

### Key Executive Metrics

|      Metric          |     Value      |
|----------------------|----------------|
| Total Flights        | 300,153        |
| Total Revenue        | ₹6,270,094,275 |
| Average Ticket Price | ₹20,889.66     |
| Minimum Ticket Price | ₹1,105         |
| Maximum Ticket Price | ₹123,071       |

### Executive-Level Observations

- The dataset represents **300K+ recorded flight transactions**, providing a substantial basis for comparative airline and route analysis.

- Total recorded revenue is approximately **₹6.27 billion**.

- The average ticket price is approximately **₹20.89K**.

- The large gap between the minimum and maximum observed ticket prices indicates substantial variation in ticket pricing across the dataset.

- Further analysis of airline, route, travel class, booking window, and stop patterns is required to identify the primary drivers of revenue and pricing differences.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Airline Performance Summary - 
The airline analysis shows significant differences in revenue, flight volume, and average ticket price across carriers.


| Airline   | Total Flights | Total Revenue  | Average Ticket Price |
|-----------|---------------|----------------|----------------------|
| Vistara   | 127,859       | ₹3,886,470,735 | ₹30,396.54           |
| Air India | 80,892        | ₹1,901,529,790 | ₹23,507.02           |
| Indigo    | 43,120        | ₹229,580,207   | ₹5,324.22            |
| GO_FIRST  | 23,173        | ₹130,973,972   | ₹5,652.01            |
| AirAsia   | 16,098        | ₹65,858,089    | ₹4,091.07            |
| SpiceJet  | 9,011         | ₹55,681,482    | ₹6,179.28            |

### Key Findings

- **Vistara is the highest-revenue airline**, generating approximately **₹3.89 billion** from 127,859 recorded flights.

- **Air India ranks second**, generating approximately **₹1.90 billion** from 80,892 flights.

- Vistara also has the **highest average ticket price at ₹30,396.54**, indicating a strong premium-pricing position.

- Air India has the second-highest average ticket price at **₹23,507.02**.

- Indigo operates a substantially larger number of flights than several lower-volume airlines but has a much lower average ticket price of **₹5,324.22**.

- The results indicate that airline revenue performance is influenced by both **flight volume and pricing strategy**, rather than volume alone.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Route Performance - 
The route-level analysis shows significant differences in revenue, flight volume, and average ticket price across city pairs.

### Top Revenue-Generating Routes

| Rank |        Route          | Total Flights | Total Revenue | Average Ticket Price |
|------|-----------------------|---------------|---------------|----------------------|
| 1    | Bangalore → Mumbai    | 12,939        | ₹299,261,197  | ₹23,128.62           |
| 2    | Mumbai    → Bangalore | 12,885        | ₹298,260,354  | ₹23,147.87           |
| 3    | Delhi     → Mumbai    | 15,289        | ₹295,931,282  | ₹19,355.83           |
| 4    | Mumbai    → Kolkata   | 12,602        | ₹282,022,007  | ₹22,379.15           |
| 5    | Mumbai    → Delhi     | 14,809        | ₹277,303,264  | ₹18,725.32           |
| 6    | Kolkata   → Mumbai    | 11,467        | ₹253,178,558  | ₹22,078.88           |
| 7    | Delhi     → Bangalore | 14,012        | ₹250,537,591  | ₹17,880.22           |
| 8    | Delhi     → Kolkata   | 11,934        | ₹245,439,530  | ₹20,566.41           |
| 9    | Bangalore → Delhi     | 13,756        | ₹243,801,907  | ₹17,723.31           |
| 10   | Bangalore → Kolkata   | 10,028        | ₹235,658,614  | ₹23,500.06           |

### Key Findings

- **Bangalore → Mumbai** is the highest-revenue route, generating approximately **₹299.26 million**.

- **Mumbai → Bangalore** is a close second at approximately **₹298.26 million**, indicating strong two - way demand between the two cities.

- **Delhi → Mumbai** has the highest flight volume among the routes shown, with **15,289 flights**, demonstrating strong passenger demand.

- The top 10 revenue-generating routes collectively contribute approximately **₹2.68 billion**, representing about **42.8% of total dataset revenue**.

- Several high-revenue routes have both substantial flight volume and relatively high average ticket prices, indicating that revenue is being driven by a combination of  **demand and fare levels**.

- **Chennai → Bangalore** records the highest average ticket price observed in the route results at approximately **₹25,081.85**, despite not being among the top revenue routes by total revenue.

- This demonstrates an important distinction between **high-revenue routes** and **high-value/fare routes**: a route can command a high average fare without generating the highest total revenue if its flight volume is lower.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Pricing Analysis - 
The pricing analysis shows a substantial difference in revenue contribution and average ticket price between Business and Economy class.

### 1. Revenue by Travel Class

| Travel Class | Total Flights | Total Revenue  | Average Ticket Price | Revenue Contribution |
|--------------|---------------|----------------|----------------------|----------------------|
| Business     | 93,487        | ₹4,911,814,564 |     ₹52,540.08       |       78.3%          |
| Economy      | 206,666       | ₹1,358,279,711 |     ₹6,572.34        |       21.7%          |

### Key Findings

- **Business class generates the majority of total revenue**, contributing approximately **78.3%** of dataset revenue.

- Business class accounts for only **31.1% of total flights**, demonstrating a disproportionately high revenue contribution relative to flight volume.

- The average Business-class ticket price is **₹52,540.08**, approximately **8 times higher** than the Economy average of **₹6,572.34**.

- Economy class represents approximately **68.9% of flights** but contributes only **21.7% of total revenue**.

- The results indicate that **ticket value and travel class are major drivers of revenue performance**.

- From a commercial perspective, protecting Business-class demand and optimizing premium inventory could have a significant impact on overall revenue.


### 2. Revenue by Booking Window

The booking-window analysis shows a clear relationship between booking timing and average ticket price.

| Booking Window | Total Flights | Total Revenue  | Average Ticket Price | Revenue Contribution |
|----------------|---------------|--------------- |----------------------|----------------------|
|  0–7  Days     | 32,113        | ₹849,428,504   | ₹26,451.23           |        13.5%         |
|  8–15 Days     | 49,145        | ₹1,156,583,879 | ₹23,534.11           |        18.4%         |
| 16–30 Days     | 97,234        | ₹1,920,779,223 | ₹19,754.19           |        30.6%         |
| 31–60 Days     | 121,661       | ₹2,343,302,669 | ₹19,260.92           |        37.4%         |

### Key Findings

- The **31–60 day booking window has the highest flight volume**, with 121,661 flights, representing approximately **40.5% of all flights**.
- The 31–60 day segment also generates the highest total revenue at approximately **₹2.34 billion**.
- **0–7 day bookings have the highest average ticket price at ₹26,451.23**.
- Average ticket price decreases consistently as the booking window increases, from **₹26,451.23 for 0–7 day bookings** to **₹19,260.92 for 31–60 day bookings**.
- The average ticket price for bookings made within 7 days of departure is approximately **37% higher** than the 31–60 day average.
- The results suggest that **last-minute demand carries a significant pricing premium**, while customers booking further in advance generally pay lower average fares.
- The dataset contains **no observations beyond 60 days before departure**, so no 60+ day booking category is present in the results.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Customer Booking Behaviour -

### 1. Revenue by Number of Stops

The analysis of flight stops shows that one-stop flights dominate both flight volume and revenue in the dataset.

| Stops       | Total Flights | Total Revenue  | Average Ticket Price | Revenue Contribution |
|-------------|---------------|----------------|----------------------|----------------------|
| One         | 250,863       | ₹5,745,011,677 | ₹22,900.99           |         91.6%        |
| Zero        | 36,004        | ₹337,571,291   | ₹9,375.94            |          5.4%        |
| Two or more | 13,286        | ₹187,511,307   | ₹14,113.45           |          3.0%        |

### Key Findings

- **One-stop flights account for approximately 83.6% of all flights** and generate approximately **91.6% of total revenue**.

- One-stop flights have the highest average ticket price at **₹22,900.99**.

- Non-stop flights represent approximately **12.0% of flights** but contribute only **5.4% of total revenue**.

- Flights with two or more stops represent approximately **4.4% of flights** and contribute approximately **3.0% of total revenue**.

- The data shows a strong association between one-stop itineraries and overall revenue performance.

- These results should be interpreted as **observed relationships rather than causal effects**, the dataset does not establish that adding a stop increases ticket price or  revenue.


### 2. Revenue by Class and Booking Window

The interaction between travel class and booking timing reveals substantial differences in both revenue generation and ticket pricing.

| Travel Class | Booking Window | Total Flights | Total Revenue  | Average Ticket Price |
|--------------|----------------|---------------|----------------|----------------------|
| Business     | 31–60 Days     | 37,339        | ₹1,928,505,576 | ₹51,648.56           |
| Business     | 16–30 Days     | 29,872        | ₹1,556,631,180 | ₹52,110.04           |
| Business     |  8–15 Days     | 15,728        | ₹828,131,088   | ₹52,653.30           |
| Business     |  0–7  Days     | 10,548        | ₹598,546,720   | ₹56,745.04           |
| Economy      | 31–60 Days     | 84,322        | ₹414,797,093   | ₹4,919.20            |
| Economy      | 16–30 Days     | 67,362        | ₹364,148,043   | ₹5,405.84            |
| Economy      |  8–15 Days     | 33,417        | ₹328,452,791   | ₹9,828.91            |
| Economy      |  0–7  Days     | 21,565        | ₹250,881,784   | ₹11,633.75           |

### Key Findings

- **Business class is the dominant revenue segment across every booking window**.

- The **Business 31–60 day segment generates the highest revenue**, at approximately **₹1.93 billion**.

- **Business 0–7 day bookings have the highest average ticket price**, at **₹56,745.04**.

- Business-class average ticket price increases from **₹51,648.56** for 31–60 day bookings to **₹56,745.04** for bookings within 7 days of departure.

- Economy-class pricing shows an even stronger booking-window effect, increasing from **₹4,919.20** at 31–60 days to **₹11,633.75** at 0–7 days.

- The results indicate that **late-booking behavior is associated with higher average fares in both travel classes**, with the effect being particularly pronounced in Economy.

- Revenue performance is therefore influenced by the interaction between **travel class and booking timing**, rather than either factor operating independently.


### 3. Highest-Value Airline-Route Combinations

The airline-route analysis shows a strong concentration of high-value revenue combinations, with Vistara dominating the top-performing airline-route segments.

| Rank | Airline |         Route          | Total Flights | Total Revenue | Average Ticket Price |
|------|---------|------------------------|---------------|---------------|----------------------|
| 1    | Vistara | Bangalore → Mumbai     | 5,380         | ₹188,092,242  | ₹34,961.38           |
| 2    | Vistara | Mumbai    → Bangalore  | 5,339         | ₹187,024,531  | ₹35,029.88           |
| 3    | Vistara | Mumbai    → Kolkata    | 4,848         | ₹170,765,285  | ₹35,223.86           |
| 4    | Vistara | Bangalore → Delhi      | 5,423         | ₹156,447,989  | ₹28,848.97           |
| 5    | Vistara | Bangalore → Kolkata    | 4,370         | ₹156,213,144  | ₹35,746.71           |
| 6    | Vistara | Delhi     → Mumbai     | 5,840         | ₹155,520,913  | ₹26,630.29           |
| 7    | Vistara | Delhi     → Bangalore  | 5,379         | ₹155,316,989  | ₹28,874.70           |
| 8    | Vistara | Mumbai    → Delhi      | 5,812         | ₹153,452,464  | ₹26,402.70           |
| 9    | Vistara | Kolkata   → Mumbai     | 4,553         | ₹152,143,512  | ₹33,416.10           |
| 10   | Vistara | Mumbai    → Chennai    | 4,614         | ₹148,487,500  | ₹32,181.95           |

### Key Findings

- **19 of the top 20 airline-route combinations by revenue are operated by Vistara**, indicating strong concentration of high-value segments.

- **Vistara's Bangalore → Mumbai route is the highest-value airline-route combination**, generating approximately **₹188.09 million**.

- The reverse **Mumbai → Bangalore** route generates approximately **₹187.02 million**, reinforcing the commercial importance of the two-way corridor.

- Vistara's high-value routes are concentrated across major metropolitan markets including **Mumbai, Bangalore, Delhi, and Kolkata**.

- Several Vistara routes combine substantial flight volume with average ticket prices above **₹30,000**, indicating strong revenue potential from both demand and pricing.

- **Air India Delhi → Mumbai** is the only non-Vistara combination appearing in the top 20, generating approximately **₹118.65 million**.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Business Recommendations - 
Based on the observed dataset and combined SQL analysis, the following business actions are recommended.

### 1. Protect and Optimize Premium-Class Revenue
Business class generates approximately **78.3% of total revenue** while representing only **31.1% of flights**.

**Recommendation:**
- Protect Business-class inventory on high-demand routes.
- Use demand-based pricing to optimize premium fares.
- Monitor Business-class load and revenue performance separately from Economy.
- Prioritize premium capacity on routes where Business-class demand and average fares are strongest.

**Business Impact:**
Protecting premium inventory and optimizing Business-class pricing could have a disproportionately large impact on total revenue.

---

### 2. Prioritize High-Value Routes
The analysis identifies **Bangalore → Mumbai** and **Mumbai → Bangalore** as the two highest-revenue city-pair routes.

Vistara's Bangalore → Mumbai route alone generates approximately **₹188.09 million**.

**Recommendation:**
- Prioritize capacity and operational reliability on high-revenue routes.
- Monitor route-level revenue, average fare, and flight volume continuously.
- Use route-level profitability analysis to determine where additional capacity could generate the greatest return.

**Business Impact:**
Focusing resources on high-value corridors can improve revenue efficiency and reduce the risk of under-investing in commercially important routes.

---

### 3. Use Dynamic Pricing for Late Bookings
Bookings made within 7 days of departure have an average ticket price of **₹26,451.23**, compared with **₹19,260.92** for bookings made 31–60 days before departure.

**Recommendation:**
- Apply demand-based pricing as departure approaches.
- Monitor booking velocity and remaining inventory.
- Increase fares selectively when demand is strong and inventory is constrained.
- Avoid excessive price increases when demand signals are weak.

**Business Impact:**
A structured dynamic-pricing strategy can capture additional revenue from customers with higher willingness to pay for late travel.

---

### 4. Optimize Economy-Class Booking Strategy
Economy-class average pricing increases from **₹4,919.20** for 31–60 day bookings to **₹11,633.75** for bookings within 7 days.

**Recommendation:**
- Encourage early Economy bookings through differentiated fare offers.
- Use targeted promotions during periods of low booking velocity.
- Preserve higher fare levels closer to departure when demand supports them.

**Business Impact:**
The large difference in Economy pricing across booking windows creates an opportunity to improve yield without relying entirely on additional passenger volume.

---

### 5. Protect High-Value Vistara Corridors
Vistara appears in **19 of the top 20 airline-route combinations by revenue**.

**Recommendation:**
- Closely monitor Vistara's highest-value city pairs.
- Prioritize service reliability and seat availability on these corridors.
- Investigate whether the observed concentration reflects genuine market strength, route mix, or dataset composition before making network-wide decisions.

**Business Impact:**
Maintaining strong performance across these high-value segments can protect a substantial portion of observed revenue.

---

### 6. Optimize One-Stop Network Capacity
One-stop flights represent approximately **83.6% of flights** and generate approximately **91.6% of total revenue** in the dataset.

**Recommendation:**
- Monitor one-stop routes as a major component of the revenue network.
- Evaluate whether connection-based itineraries are efficiently priced and scheduled.
- Analyze operational performance and passenger demand before reallocating capacity toward or away from connecting routes.

**Business Impact:**
Because one-stop itineraries represent the majority of observed revenue, changes to this segment could have a material effect on overall performance.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------