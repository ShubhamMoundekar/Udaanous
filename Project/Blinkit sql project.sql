-- To check total data imported

select * from sales;
select count(*) from sales;

-- To see the data types of every column

describe sales;

# Data cleaning

-- changing quoted identifiers to unquoted identifiers for easy and effiecient querying 

ALTER TABLE sales
CHANGE `Item Fat Content` Item_Fat_Content VARCHAR(50),
CHANGE `Item Identifier` Item_Identifier VARCHAR(50),
CHANGE `Item Type` Item_Type VARCHAR(50),
CHANGE `Outlet Establishment Year` Outlet_Establishment_Year INT,
CHANGE `Outlet Identifier` Outlet_Identifier VARCHAR(50),
CHANGE `Outlet Location Type` Outlet_Location_Type VARCHAR(50),
CHANGE `Outlet Size` Outlet_Size VARCHAR(50),
CHANGE `Outlet Type` Outlet_Type VARCHAR(50),
CHANGE `Item Visibility` Item_Visibility DECIMAL(5,2),
CHANGE `Item Weight` Item_Weight DECIMAL(6,2),
CHANGE `Total Sales` Total_Sales DECIMAL(10,2);

-- Standardizing item_fat_content names to improve data quality

update sales
set item_fat_content =
case when item_fat_content in ( 'LF', 'low fat') then 'Low Fat'
when item_fat_content =  'reg' then 'Regular'
else item_fat_content
end;

-- To check whether the above query standardised data or not

select distinct (item_fat_content) from sales;

# KPI's 

-- Total sales

select cast(sum(total_sales)/1000000 as decimal(10,2)) as total_sales_millions
from sales;

-- Average sales

select cast(avg(total_sales)as decimal(10,1)) as avg_sales_millions
from sales;

-- Number of items

select count(*) as No_of_items from sales;

-- Average rating

select cast(avg(rating) as decimal(10,2)) as avg_rating from sales;

-- Total sales & other metrics based on fat content

select Item_fat_content ,
          sum(total_sales) as Total_sales,
          cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
          count(*) AS No_of_items,
          cast(avg(rating) as decimal(10,2)) as Avg_rating
from sales
group by item_fat_content
order by total_sales desc;
          
-- sales by item type

select Item_type ,
          sum(total_sales) as Total_sales,
          cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
          count(*) AS No_of_items,
          cast(avg(rating) as decimal(10,2)) as Avg_rating
from sales
group by item_type
order by total_sales desc ;

-- Fat content based sales with outlet type

SELECT
    Outlet_Location_Type,
    IFNULL(SUM(CASE WHEN Item_Fat_Content = 'Low Fat' THEN Total_Sales ELSE 0 END), 0) AS Low_Fat,
    IFNULL(SUM(CASE WHEN Item_Fat_Content = 'Regular' THEN Total_Sales ELSE 0 END), 0) AS Regular
FROM
    sales
GROUP BY
    Outlet_Location_Type
ORDER BY
    Outlet_Location_Type;

-- Total sales by outlet establishment 

select outlet_establishment_year ,
          sum(total_sales) as Total_sales,
          cast(avg(total_sales) as decimal(10,1)) as Avg_sales,
          count(*) AS No_of_items,
          cast(avg(rating) as decimal(10,2)) as Avg_rating
from sales
group by outlet_establishment_year
order by total_sales desc ;

-- Percentage of sales by outlet size (is it correlated?)

select outlet_size,
       cast(sum(total_sales) as decimal(10,2)) as total_sales,
       cast((sum(total_sales)*100.0 /sum(sum(total_sales)) over()) as decimal(10,2)) as sales_percentage
from sales
group by outlet_size
order by total_sales desc;      

	--   OR   --
       
WITH total AS (
    SELECT SUM(total_sales) AS grand_total
    FROM sales
)
SELECT
    outlet_size,
    CAST(SUM(total_sales) AS DECIMAL(10,2)) AS total_sales,
    CAST(SUM(total_sales) * 100.0 / total.grand_total AS DECIMAL(10,2)) AS sales_percentage
FROM sales
cross join total
GROUP BY outlet_size, total.grand_total
ORDER BY total_sales DESC;

-- Total sales by outlet location

select outlet_location_type ,
          sum(total_sales) as Total_sales,
          count(*) AS No_of_items,
          cast((sum(total_sales)*100.0 /sum(sum(total_sales)) over()) as decimal(10,2)) 
          as sales_percentage
from sales
group by outlet_location_type
order by total_sales desc ;

-- Total sales by outlet type

select outlet_type ,
          sum(total_sales) as Total_sales,
          count(*) AS No_of_items,
          cast((sum(total_sales)*100.0 /sum(sum(total_sales)) over()) as decimal(10,2)) 
          as sales_percentage
from sales
group by outlet_type
order by total_sales desc ;