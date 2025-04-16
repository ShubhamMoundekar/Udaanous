Use Bharat_Digital;

/* Task 1 */

Select * From product_financial_data;
Select ABS(Profit) As Update_profit From product_financial_data;
Select Sum(Amount) AS Total_Amount From product_financial_data;
Select Avg(Revenue) AS Avg_Profit From product_financial_data;
Select count(`Product ID`) As Total_Id From product_financial_data;
Select Revenue Div Amount As Update_Column From product_financial_data;
Select Min(Revenue) As Min_Revenue From product_financial_data;
Select Max(Profit) AS Max_Profit From product_financial_data;

/* Task 2*/

Select Power(Profit, 2) From product_financial_data;
Select Round(Revenue, 1) From product_financial_data;
Select SQRT(Amount) From product_financial_data;
Select log(Profit) From product_financial_data;

-- Create the table
CREATE TABLE exam_info (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores integer
);

-- Insert 10 values for each variable
INSERT INTO exam_info (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80),('Alice', 'Smith',  75),('Bob', 'Johnson',  78),('Emily', 'Brown',  60),
('Michael', 'Davis', 86),('Sarah', 'Wilson', 90),('David', 'Lee', 75),('Jessica', 'Taylor', 75),
('Chris', 'Evans',  55),('Emma', 'Thompson',  67);

Select * From exam_info;

Select *, power(Scores, 3) AS Cubescores From exam_info;

/*Create the table */
CREATE TABLE exam_info_2 (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50),
    Scores float
);

-- Insert 10 values for each variable
INSERT INTO exam_info_2 (FirstNames, LastNames, Scores) VALUES
('John', 'Doe',  80.345544),('Alice', 'Smith',  75.6355),('Bob', 'Johnson',  78.5364565),
('Emily', 'Brown',  60.3565),('Michael', 'Davis', 86.5353656),('Sarah', 'Wilson', 90.535464),
('David', 'Lee', 75.567765),('Jessica', 'Taylor', 75.34242),('Chris', 'Evans',  55.09098),
('Emma', 'Thompson',  67.34535);

Select *, round(Scores, 2) As RoundScores From Exam_info_2;

Select * From `sales dataset`;
SELECT *,DATE_FORMAT(`Order Date`, '%d-%m-%Y') AS Date_format FROM `sales dataset`;
Select datediff(Curdate(),`Order Date`) As Difference_Date From `sales dataset`;
Select Day(`Order Date`) As Day_Cl From `sales dataset`;
Select Month(`Order Date`) AS Month_cl From `sales dataset`;
Select Year(`Order Date`) As Year_cl From `sales dataset`; 