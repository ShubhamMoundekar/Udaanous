Use Bharat_digital;
Select * From courses_data;
Select * From Enrollments_data;
Select * From Student_information;

truncate table Courses_data;

Create Table Employee_Data(Id int unique,Name varchar(255) not null, Department Varchar(50) not null,
Salary int not null);

Insert into Employee_Data(ID, Name, Department, Salary)
values (101, "Vinit", "DA", 20000),(102,"Piyush","DA",25000),(103,"Kunal","Frontend",25000),
(104,"Aman","Backend",40000);

Select * From Employee_Data;

Update Employee_Data
Set Salary = "40000", Salary = "30000"
Where Id = "104";

Delete From Employee_Data
Where Id = 102;

truncate Table Employee_Data;

Drop Table Employee_data;

-----------------------------------------------------------------------------------------------

Create Table Employies_Data(Id int unique,Name varchar(255) not null, Department Varchar(50) not null,
Salary int not null);

Insert into Employies_Data(ID, Name, Department, Salary)
values (101, "Vinit", "DA", 20000),(102,"Piyush","DA",25000),(103,"Kunal","Frontend",25000),
(104,"Aman","Backend",40000);

Select * From Employies_Data;

Alter Table Employies_Data
Add Gmail varchar(255);

Alter Table Employies_data
rename Column Gmail to Email;

Alter Table Employies_data
Drop column Email;

Alter Table Employies_data
Add constraint pk_id primary key (id);


CREATE TABLE Department_Data (
    Dept_Name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Department_Data (Dept_Name)
VALUES ('DA'), ('Frontend'), ('Backend');

CREATE TABLE Employiess_Data (
    Id INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary INT NOT NULL
);

INSERT INTO Employiess_Data (Id, Name, Department, Salary)
VALUES 
    (101, 'Vinit', 'DA', 20000),
    (102, 'Piyush', 'DA', 25000),
    (103, 'Kunal', 'Frontend', 25000),
    (104, 'Aman', 'Backend', 40000);
    
ALTER TABLE Employee_Data
ADD CONSTRAINT FK_Department
FOREIGN KEY (Department)
REFERENCES Department_Data (Dept_Name);

