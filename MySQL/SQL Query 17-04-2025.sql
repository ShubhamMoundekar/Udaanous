Use Bharat_Digital;
-- Create the table
CREATE TABLE purchases (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
 
-- Insert values
INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-05'),(2, '2024-01-02', '2024-01-06'),(3, '2024-01-03', '2024-01-07'),
(4, '2024-01-04', '2024-01-08'),(5, '2024-01-05', '2024-01-09'),(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-11'),(8, '2024-01-08', '2024-01-12'),(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-14');

Select * From purchases;

-- Write necessary code to format the dates in PurchaseDate column like this "24-January-1st". 
-- Store the output in FormatedDate.

SELECT *,
    CONCAT(
        DATE_FORMAT(PurchaseDate, '%Y-%M-'),
        CASE 
            WHEN DAY(PurchaseDate) IN (11,12,13) THEN CONCAT(DAY(PurchaseDate), 'th')
            WHEN DAY(PurchaseDate) % 10 = 1 THEN CONCAT(DAY(PurchaseDate), 'st')
            WHEN DAY(PurchaseDate) % 10 = 2 THEN CONCAT(DAY(PurchaseDate), 'nd')
            WHEN DAY(PurchaseDate) % 10 = 3 THEN CONCAT(DAY(PurchaseDate), 'rd')
            ELSE CONCAT(DAY(PurchaseDate), 'th')
        END
    ) AS FormattedDate
FROM purchases;

Select *,date_format(purchasedate, "%y-%M-%D") as purchase_date from purchases;

-- Write necessary code to find the difference between PurchaseDate and ReturnDate columns. 
-- Store the output in DateDifference.

-- Create the table --
CREATE TABLE purchases_1 (
    CustomerID INT,
    PurchaseDate DATE,
    ReturnDate DATE
);
 
-- Insert values
INSERT INTO purchases_1 (CustomerID, PurchaseDate, ReturnDate) VALUES
(1, '2024-01-01', '2024-01-09'),(2, '2024-01-02', '2024-01-16'),(3, '2024-01-03', '2024-01-11'),
(4, '2024-01-04', '2024-01-08'),(5, '2024-01-05', '2024-01-09'),(6, '2024-01-06', '2024-01-10'),
(7, '2024-01-07', '2024-01-21'),(8, '2024-01-08', '2024-01-29'),(9, '2024-01-09', '2024-01-13'),
(10, '2024-01-10', '2024-01-24');

Select *, datediff(ReturnDate,PurchaseDate) AS Date_difference From Purchases_1;

SELECT *,ReturnDate - PurchaseDate AS Date_difference FROM Purchases_1;

-- Write necessary code to extract the years from the column ReturnDate. Store the output in YearsData.

Select *,Year(Purchasedate) as Year_date From Purchases;
SELECT *,YEAR(PurchaseDate) AS Year_date FROM Purchases WHERE YEAR(PurchaseDate) >= 2023;

-- Group by / Order by

Select * From `sales dataset`;

Select Category, `Sub-Category`, Avg(Profit) As Avg_profit From `sales dataset`
Group by Category, `Sub-Category`Order by Category DESC;

Select State, City, Quantity,`Sub-Category` From `sales dataset`Order by Quantity asc;

-- Inner Join 

Select * From enrollments_data;
Select * From student_information;

Select S.Semester, S.Grade,S.`Student ID`, F.First_Name, F.Last_Name, F.GPA, F.Student_id
From enrollments_data as S
inner Join student_information as F
on F.Student_id = S.`Student ID`;

-- Left Join

Select S.Semester, S.Grade,S.`Student ID`, F.First_Name, F.Last_Name, F.GPA, F.Student_id
From student_information as F
Left Join enrollments_data as S
on F.Student_id = S.`Student ID`;

-- Right Join 

Select S.Semester, S.Grade,S.`Student ID`, F.First_Name, F.Last_Name, F.GPA, F.Student_id
From student_information as F
Right Join enrollments_data as S
on F.Student_id = S.`Student ID`;

-- Cross join 

Select S.Semester, S.Grade,S.`Student ID`, F.First_Name, F.Last_Name, F.GPA, F.Student_id
From enrollments_data as S
inner Join student_information as F
on F.Student_id = S.`Student ID`;


