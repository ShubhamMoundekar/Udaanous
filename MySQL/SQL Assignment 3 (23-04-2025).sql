USE Digital;

-- Select Data

SELECT * FROM customers;
SELECT * FROM ORDERS;
SELECT * FROM Products;
SELECT * FROM order_items;

-- 1.	Monthly Revenue
-- o	Calculate total revenue per month.
-- o	Format: YYYY-MM, total_revenue

SELECT date_format(OD.Order_date,"%Y-%M") AS Month ,SUM(O.Quantity * O.Price) AS Total_Revenue FROM order_items AS O
JOIN Orders AS OD ON O.Order_ID = OD.Order_ID
GROUP BY month
ORDER BY Month DESC;

-- 1.	Monthly Revenue
-- o	Calculate total revenue per month.
-- o	Format: YYYY-MM, total_revenue

SELECT C.customer_id, SUM(O.Total_amount) As Lifetime_Value
FROM customers AS C
JOIN orders AS O ON C.customer_id = O.customer_id
GROUP BY C.customer_id
ORDER BY Lifetime_value DESC
LIMIT 5;

-- 3.	Most Popular Product by Region
-- o	Join data to find the most frequently ordered product in each region.

WITH ProductSalesByRegion AS (
    SELECT C.Region,P.Product_Name, SUM(OI.Quantity) AS total_quantity FROM orders O
    JOIN customers C ON O.Customer_ID = C.Customer_ID
    JOIN order_items OI ON O.Order_ID = OI.Order_ID
    JOIN products P ON OI.Product_ID = P.Product_ID
    GROUP BY C.Region, P.Product_Name
),
RankedProducts AS (SELECT *, RANK() OVER (PARTITION BY Region ORDER BY total_quantity DESC) AS Total_rank
    FROM ProductSalesByRegion
)
SELECT Region,Product_Name,total_quantity FROM RankedProducts
WHERE Total_rank = 1
ORDER BY Region;

-- 4.	Profit Analysis o	For each product, compute total profit: 	Profit = (price - cost) * quantity
-- o	Show top 5 most profitable products.

SELECT P.Product_Name, Sum((OD.Price - P.Cost) * OD.Quantity) AS Total_Profit FROM products AS P
JOIN order_items AS OD ON OD.product_id = P.product_id
GROUP BY P.product_name
ORDER BY Total_Profit DESC
LIMIT 5;

-- 5.	New vs Returning Customers o	In each month, count how many orders were placed by:
-- 	New customers (first-time order) 	Returning customers (second order or later)

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
CASE WHEN order_date = (SELECT MIN(o2.order_date) FROM orders o2 WHERE o2.customer_id = o.customer_id) THEN 'new'
    ELSE 'returning'
    END AS type, COUNT(*) AS total FROM orders o
GROUP BY month, type
ORDER BY month;











