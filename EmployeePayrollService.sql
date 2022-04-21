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
--retrivew all data from employee_payroll table
select * from employee_payroll;
