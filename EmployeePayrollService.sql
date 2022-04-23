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

--UC11 For ER diagram generate new table

--created table employee
create table employee
(
employee_id int identity(1,1) primary key,
name varchar(150) not null,
gender char(1),
phone_no bigint,
start_date date,
address varchar(150) not null default('India')
);

--inserted values in employee table
insert into  employee values
('Arvind','M','9999999999','2020-05-12','Nagar colony'),
('Tina', 'F', '8888888888','2019-06-22',default),
('Mukesh', 'M', '8888888888','2021-8-27', 'MG Street'),
('Sarang','M','4545454545','2022-10-6','Andheri road');

--created table department
create table department
(
dept_id int identity(100,1) primary key,
dept_name varchar(50) not null,
);

--inserted values in department table
insert into department values
('Marketing'),
('Sales'),
('Engineering'),
('HR');
--created table employee_department for many to many relationship
create table employee_department
(
employee_id int not null foreign key references employee(employee_id),
dept_id int not null foreign key references department(dept_id) 
);

--inserted values in employee_department table
insert into employee_department values
(1,100),
(2,100),
(2,101),
(3,103),
(4,102);
--created table payroll. Here taxable_pay and net_pay are derived attributes
create table payroll
(
employee_id int not null foreign key references employee(employee_id),
basic_pay bigint not null,
deduction bigint,
taxable_pay as basic_pay-deduction,
income_tax bigint,
net_pay as basic_pay-(income_tax+deduction)
);

--inserted values in payroll table. Only employee_id,start_date,basic_pay,deductions,income_tax inserted. Others are derived
insert into payroll values
(1,200000,12000,10000),
(2,300000,15000,20000),
(3,100000,5000,2000),
(4,30000,2000,0);

--for viewing inserted values
select * from employee;
select * from department;
select * from employee_department; 
select * from payroll;

--retrives data for all employee
select e.employee_id,name,gender,phone_no,start_date, address,d.dept_id,d.dept_name,basic_pay,deduction,taxable_pay,income_tax,net_pay
from employee e

inner join employee_department ed on ed.employee_id = e.employee_id
inner join department d on d.dept_id= ed.dept_id
inner join payroll p on p.employee_id = e.employee_id;