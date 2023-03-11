Creating the Superstore table

    CREATE TABLE superstore (
    Row_ID INT NOT NULL,
    Order_ID VARCHAR(255) NOT NULL,
    Order_Date DATE NOT NULL,
    Ship_Date DATE NOT NULL,
    Ship_Mode VARCHAR(255),
    Customer_ID VARCHAR(255) NOT NULL,
    Customer_Name VARCHAR(255),
    Segment VARCHAR(255),
    Country VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    Postal_Code VARCHAR(255),
    Region VARCHAR(255),
    Product_ID VARCHAR(255) NOT NULL,
    Category VARCHAR(255),
    Sub_Category VARCHAR(255),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10, 2),
    PRIMARY KEY (Row_ID)
    );


# Task 1 : What percentage of total orders were shipped on the same date?
           SELECT (((SELECT COUNT(*) FROM superstore  WHERE Order_Date = Ship_Date)/count(*))*100) 
           FROM superstore;

# Task 2 : Name top 3 customers with highest total value of orders.
         SELECT Customer_Name, SUM(Sales) AS TotalOrderValue
         FROM superstore
         GROUP BY customer_name
         ORDER BY SUM(sales) DESC
         LIMIT 3

# Task 3 : Find the top 5 items with the highest average sales per day.
         SELECT Product_ID, AVG(Sales) as avg_sales_per_day
         FROM superstore
         GROUP BY Product_ID
         ORDER BY AVG(Sales) DESC
         LIMIT 5

# Task 4 : Write a query to find the average order value for each customer, and rank the customers by their average order value.
          SELECT Customer_ID, Customer_Name, AVG(Sales) AS avg_order_value, RANK() OVER (ORDER BY AVG(Sales) DESC) AS Avg_Order_Value
          FROM superstore
          GROUP BY Customer_ID, Customer_Name
          ORDER BY avg_order_value DESC

# Task 5 : Give the name of customers who ordered highest and lowest orders from each city.
           SELECT 
           City, 
           MAX(Sales) AS highest_order_sales, 
           MIN(Sales) AS lowest_order_sales,
           MAX(Customer_Name) AS highest_order_customer, 
           MIN(Customer_Name) AS lowest_order_customer
           FROM 
           superstore
           GROUP BY 
           City 
           ORDER BY City ASC

# Task 6 : What is the most demanded sub-category in the west region?
           SELECT Sub_Category , SUM(sales) AS Most_demanded_Sub_category
           FROM superstore
           WHERE Region = 'West'
           GROUP BY Sub_Category
           ORDER BY SUM(sales) DESC
           LIMIT 1

# Task 7 : Which order has the highest number of items?
           SELECT Order_ID, COUNT(Order_ID) AS total_items
           FROM superstore
           GROUP BY Order_ID
           ORDER BY total_items DESC
           LIMIT 1

# Task 8 : Which order has the highest cumulative value?
          SELECT Order_ID, SUM(Sales) AS Cumulative_value
          FROM superstore
          GROUP BY Order_ID
          ORDER BY SUM(Sales) DESC
          LIMIT 1
# Task 9 : Which segment’s order is more likely to be shipped via first class?
          SELECT Segment, 
          COUNT(*) AS TotalOrders, 
          COUNT(CASE WHEN `Ship_Mode` = 'First Class' THEN 1 END) AS FirstClassOrders
          FROM superstore
          GROUP BY Segment
          LIMIT 0

# Task 10 : Which city is least contributing to total revenue?
           SELECT city, SUM(Sales) AS total_revenue
           FROM superstore
           GROUP BY city
           ORDER BY total_revenue ASC
           LIMIT 1

# Task 11 : What is the average time for orders to get shipped after order is placed?
            SELECT FORMAT(AVG(DATEDIFF(Ship_Date, Order_Date)) ,8)  AS avg_ship_time 
            FROM superstore 
            WHERE Ship_Date IS NOT NULL

# Task 12 : Which segment places the highest number of orders from each state and which segment places the largest individual orders from each state?
            SELECT Segment,State,Count(distinct Order_ID) 
            FROM superstore
            GROUP BY State,Segment
            ORDER BY Count(distinct Order_ID) desc 
            LIMIT 1

