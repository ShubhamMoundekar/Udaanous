Use digital;
SELECT * FROM Sales_data; 

-- 1.	Total Sales Value

SELECT SUM(Quantity * Price) AS Total_sales FROM sales_data;

-- 2.	Monthly Sales Trends

SELECT FORMAT(order_date, '%Y-%M') AS Month,SUM(quantity * price) AS total_sales FROM sales_data
GROUP BY FORMAT(order_date, '%Y-%M')
ORDER BY Month;
    
-- 3.	Top 5 Products by Sales Value

SELECT Product_Name, SUM(Quantity * Price) AS Total_Revenue FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Revenue
LIMIT 5;

-- 4.	Show total sales value per region.

SELECT Region, SUM(Quantity * Price) AS Total_Sale FROM sales_data
GROUP BY Region;

-- 5.	Find the number of orders placed by each customer. Return top 10 most frequent buyers.

SELECT Customer_id, COUNT(Order_id) AS Total_Order FROM sales_data
GROUP BY customer_id
ORDER BY Total_order DESC
LIMIT 10; 

-- 6.	What percentage of total revenue does each product category contribute?

SELECT Category, SUM(Quantity * Price) AS Total_Revenue,
ROUND(SUM(Quantity * Price) * 100.0 / (SELECT SUM(Quantity * Price) FROM Sales_data), 2) AS Percentage
FROM Sales_data
GROUP BY Category;

SELECT Category, SUM(Quantity * Price) * 100 / (SELECT SUM(Quantity * Price) FROM Sales_data) AS Percentage_Category
FROM Sales_data 
GROUP BY Category;

-- 7  .	Calculate how many customers have made more than one purchase.

SELECT Count(*) AS Total_customer FROM (SELECT Customer_id FROM sales_data GROUP BY Customer_id 
Having customer_id > 1) AS Customers;


