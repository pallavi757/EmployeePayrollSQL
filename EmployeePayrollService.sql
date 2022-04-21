--creates new database
create database payroll_service;
--selects the payroll_service database for use
use payroll_service;
--creates table named employee_payroll in payroll_service database
create table employee_payroll(
Id int not null primary key,
Name varchar(50),
Salary bigint,
StartDate datetime);
--gives the info about the table named employee_payroll
select * from employee_payroll;
--Insert data in table employee_payroll
insert into employee_payroll(Id,Name,Salary,StartDate)values
(1,'Omkar',40000,'2022-04-21'),
(2,'Anjali',25000,'2022-02-25'),
(3,'Arjun',40000,'2022-01-17'),
(4,'Pratik',30000,'2022-04-01'),
(5,'Arnav',45000,'2022-07-20')
;
--retrive all data from employee_payroll table
select * from employee_payroll;
--to retrieve data of omkar's salary
select salary from employee_payroll where name = 'Omkar';

--adds new column named 'Gender'
alter table employee_payroll add Gender char(1);
--set values of Gender for Omkar,Pratik,Arnav,Arjun and Anjali 
update employee_payroll set Gender = 'M' where Name = 'Omkar' or Name = 'Arjun'or Name='Pratik'or Name='Arnav';
update employee_payroll set Gender = 'F' where Name = 'Anjali';
--gives the info about the table named employee_payroll
select * from employee_payroll;
--Retrives Sum, Average, Minimun, Maximum salaries and count for male and female 
select Gender,SUM(Salary) as 'Sum of Salaries', AVG(Salary) as 'Average Salary', MIN(Salary) as 'Minimum Salary', MAX(Salary) as 'Maximum Salary', COUNT(Gender) as 'Count' from employee_payroll
group by Gender;
