Use Digital;

-- Basic Select 

Select * From Customers;
Select * From Orders;
Select * From Products;

-- •	List all customers and their cities.

Select First_Name, City From customers;

-- •	Display each order with customer full name, product name, and total price (quantity × price).

Select Concat(C.First_Name," ",C.Last_Name) As Full_Name, P.Product_Name, O.Quantity * P.Price AS Total_Price From Orders as O
join Customers as C on C.Customer_ID = O.Customer_id
join Products as p on P.Product_id = O.Product_id;

-- •	Show all orders placed in March 2024.

Select * From Orders
Where Order_date between "2024-03-01" and "2024-03-31";

-- •	Count how many times each product has been ordered.

Select p.Product_name, Count(O.Order_id) From Products as p
join orders as o on P.product_id = o.product_id
group by p.product_name;

-- •	Calculate total revenue generated from each product.

Select p.product_name, Sum(O.Quantity * P.Price) As Total_revenue From Products as p
join Orders as O on P.Product_id = O.Product_id
group by P.product_name;

-- •	Identify the customer who spent the most.

Select concat(C.First_Name, " ", C.Last_Name) As Full_name, Sum(o.Quantity * P.Price) as Total_Spent from Orders as o
join Customers as C on C.customer_id = O.Customer_id
join products as p on P.Product_id = O.product_id
group by C.customer_id, C.First_name, C.last_name
order by Total_spent desc
limit 1;

-- •	Which city has the highest average spending per customer?

Select C.city, Avg(O.Quantity * P.Price) as Avg_spend from orders as o
join customers as c on c.customer_id = o.customer_id
join products as p on p.product_id = O.product_id
group by C.city   
order by Avg_spend desc; 

