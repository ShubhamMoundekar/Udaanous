Use Bharat_Digital;
Select * From student_information;
Select * From enrollments_data;

-- Exsits 

SELECT E.*
FROM enrollments_data as E
WHERE EXISTS (
    SELECT 1 
    FROM student_information as S
    WHERE e.`Student ID` = s.Student_id
      AND e.Grade = 'B'
);

SELECT E.*
FROM enrollments_data AS E
WHERE EXISTS (
    SELECT 1
    FROM student_information AS S
    WHERE (S.Student_id = E.`Student ID` and S.Age > 18)
);


-- Any

Select E.* From enrollments_data AS E
Where E.`Student ID` = Any
(Select S.Age From student_information As S Where S.Age > 18);

-- Having 

Select First_Name, Last_Name, Age, Gender, Max(GPA) From student_information
Where Age < 20
group by First_Name, Last_Name, Age, Gender
Having Gender = "Male";

-- Create the table
CREATE TABLE student_info (
    StudentID INT PRIMARY KEY,
    FirstNames VARCHAR(50),
    LastNames VARCHAR(50)
);
 
-- Insert 10 values for each variable
INSERT INTO student_info (StudentID, FirstNames, LastNames) 
VALUES
(1, 'John', 'Doe'),(2, 'Alice', 'Smith'),(3, 'Bob', 'Johnson'),(4, 'Emily', 'Brown'),
(5, 'Michael', 'Davis'),(6, 'Sarah', 'Wilson'),(7, 'David', 'Lee'),(8, 'Jessica', 'Taylor'),
(9, 'Chris', 'Evans'),(10, 'Emma', 'Thompson');

-- Create the table
CREATE TABLE exam_info_5 (
    StudentID INT PRIMARY KEY,
    Subjects VARCHAR(50),
    Scores integer
);
 
-- Insert 10 values for each variable
INSERT INTO exam_info_5 (StudentID, Subjects, Scores) 
VALUES
(1, 'Math',  80),(2, 'English',  75),(3, 'Science',  78),(4, 'Math',  60),(5, 'English', 86),
(6, 'Science', 90),(7, 'Science', 75),(8, 'English', 75),(9, 'Math',  55),(10, 'Math',  67);

Select * From Student_info;
Select * From exam_info_5;

-- That means you are finding the information of the students who scored more than 75 in the exam.

Select * From Student_info
Join Exam_info_5
on Student_info.StudentID = Exam_info_5.StudentID
Where Scores > 75;

-- That means you are finding the information of the students who scored more than 75 in the exam. in Exsits

Select S.* From Student_info as S
join exam_info_5 as E
on S.studentID = E.StudentId
Where exists(Select E.* From exam_info_5 As E Where S.studentID=E.StudentID And Scores > 75);

-- That means you are finding the information of the students who scored more than 75 in the exam. in Any

Select S.* From Student_info as S
join Exam_info_5 As e
on S.studentid = E.StudentID
where E.scores > Any(Select 3 From Exam_info_5 As E Where S.studentid = E.studentid and Scores > 75);

