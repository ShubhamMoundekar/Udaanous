Create Database Bharat_Digital;
Use Bharat_Digital;
Select * From student_information;
Select Age, Gender, Department From Student_information;

ALTER TABLE Student_information
CHANGE `Student id` Student_id INT;

Alter Table Student_information
change `First Name` First_Name Varchar(255);

Alter Table Student_information
change `Last Name` Last_Name Varchar(255);

Select * From Student_information;

Select distinct(First_Name) From Student_information;

Select First_Name as FN From Student_information;

SELECT S.Student_id, S.First_name, S.Gender 
FROM Student_information AS S;

select t.Age, t.Department From student_information as t;

Select Age, Gender From Student_information
Where Age = "18";

Select Age, Department, Year, GPA From Student_information 
Where GPA > 3.8;

Select Age, GPA, Gender From Student_information
Where GPA < 3.8;

Select Age, GPA, Department From Student_information
Where Age <= 18;

Select Age, GPA, Gender From Student_information
Where GPA >= 3.8;

Select GPA, Age, Gender, Department From Student_information
Where Age != 19;

Select * From Courses_data;
Select * From Enrollments_data;

Select t1.Credits, t2.Semester, t3.Age from Courses_data as t1, 
enrollments_data as t2, student_information as t3;

Select courses_data.`Course Name`, Courses_data.`Course ID`, enrollments_data.Semester From 
Courses_data 
inner join Enrollments_data
on Courses_data.`Course ID` = Enrollments_data.`Course ID`;