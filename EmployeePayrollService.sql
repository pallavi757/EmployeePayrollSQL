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
--add coloumn 'Address' with default value and add column phone,department
alter table employee_payroll 
add Phone varchar(15), Address varchar(100), Department varchar(100);
update employee_payroll set Address = 'India';
update employee_payroll set Department = 'HR' where Name in ('Omkar','Arjun');
update employee_payroll set Department = 'Manager' where Name not in ('Omkar','Arjun');
update employee_payroll set Phone = 9922100977 where Name = 'Omkar';
update employee_payroll set Phone = 8890100907 where Name = 'Anjali';
update employee_payroll set Phone = 7778147670 where Name = 'Arjun';
update employee_payroll set Phone = 8613780911 where Name = 'Pratik';
update employee_payroll set Phone = 8999005678 where Name = 'Arnav';

--ability to add column Basic Pay,Deductions,Taxable Pay,Income Tax, Net Pay
alter table employee_payroll add BasicPay bigint,Deductions bigint,TaxablePay bigint,IncomeTax bigint,NetPay bigint;

--inserted terissa having with differnt id and department
insert into employee_payroll(Id,Name,Salary,StartDate,Gender,Phone,Address,Department,BasicPay,Deductions,TaxablePay,IncomeTax,NetPay)values
(6,'Terissa',20000,'2022-06-22','F',7788123423,'India','Sales',20000,2000,1100,200,16700),
(7,'Terissa',30000,'2022-03-10','F',9988002033,'India','Marketing',30000,2000,1100,200,26700);

select * from employee_payroll;

--set Basic Pay,Deductions,Taxable Pay,Income Tax, Net Pay to particular person 
update employee_payroll set BasicPay=40000, Deductions = 2000,TaxablePay = 1100, IncomeTax =200, NetPay = 36700 where Name = 'Omkar';
update employee_payroll set BasicPay=25000, Deductions = 2000,TaxablePay = 1100, IncomeTax =200, NetPay = 21700 where Name = 'Anjali';
update employee_payroll set BasicPay=40000, Deductions = 2000,TaxablePay = 1100, IncomeTax =200, NetPay = 36700 where Name = 'Arjun';
update employee_payroll set BasicPay=30000, Deductions = 2000,TaxablePay = 1100, IncomeTax =200, NetPay = 26700 where Name = 'Pratik';
update employee_payroll set BasicPay=45000, Deductions = 2000,TaxablePay = 1100, IncomeTax =200, NetPay = 41700 where Name = 'Arnav';

select * from employee_payroll where Name = 'Terissa';