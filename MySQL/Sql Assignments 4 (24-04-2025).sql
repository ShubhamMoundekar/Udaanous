Create Database Udaanous;
USE Udaanous;

-- Basic Select

SELECT * FROM `customers (1)`;
SELECT * FROM Orders;

ALTER TABLE `customers (1)` CHANGE `Name` `Customer_name` VARCHAR(255);


WITH r AS (
  SELECT A.customer_name, A.region, SUM(o.total_amount) as s, COUNT(*) as n,
         ROW_NUMBER() OVER (PARTITION BY A.region ORDER BY SUM(o.total_amount) DESC) r
  FROM `customers (1)` as A JOIN orders as o ON A.customer_id = o.customer_id
  WHERE o.order_date >= DATE_SUB(CURRENT_DATE, INTERVAL 12 MONTH)
  GROUP BY A.customer_id, A.customer_name, A.region
  HAVING COUNT(*) > 3
)
SELECT customer_name, region, s, n FROM r WHERE r <= 3;

 
