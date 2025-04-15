Use Bharat_digital;
Select * From Student_information; 

Select Department, Year, GPA From Student_information
Where Department = "Science" And Year = "Freshman";

Select Gender, Age, Year, GPA From Student_information
Where Gender = "Male" or Age > 19;

Select * From Student_information
Where Not Gender= "Male";

Select * From Student_information
Where Age Between 20 And 24;

Select * From Student_information
where First_Name like "R%";

Select * From Student_information
where Age in (20,22,21);

Select * From Student_information
Where GPA > 3.8
limit 5;

/* Today Task 2 */

Select * From customers;
Select *,char_length(Email) AS Email_length From customers;
Select *, Concat(FirstName, " ",LastName) AS Full_Name From customers;
Select *, Lower(AccountStatus) As Lower_Status From customers;
Select *, Upper(FirstName) As Upper_Name From Customers;
Select *, Trim(AccountStatus) AS Trim_Status From customers;
Select *,replace(AccountStatus, "Suspended" ,"Suspended_Now") AS Updated_Accountstatus From customers;

/* Today Task 3 */

-- Step 1: Create the table
CREATE TABLE drop_idx_tab (
    StudentID INT,
    StudentNames VARCHAR(255),
    Age INT
);

-- Step 2: Insert the values
INSERT INTO drop_idx_tab (StudentID, StudentNames, Age) 
VALUES(1, 'Alex', 18),(2, 'Akash', 27),(3, 'Ramisha', 21);

-- Step 3: Create a UNIQUE index on StudentID
CREATE UNIQUE INDEX idx_unique ON drop_idx_tab (StudentID);

-- Step 4: Drop the index
DROP INDEX idx_unique ON drop_idx_tab;

Select * From drop_idx_tab;