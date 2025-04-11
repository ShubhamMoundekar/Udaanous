/*Today Task 1*/

Use Bharat_digital;
Select * From Employies_data;
Create index Sal
on Employies_data(Salary);

Create unique index Salary_1
on employies_data(id);

Alter Table Employies_data
Drop index Sal;

---------------------------------------------------------------------------------------------

/*Task 2*/

Select * from Employies_data;

Select * from employies_data
where salary is not null;

Select * From employies_data
where salary is null;
