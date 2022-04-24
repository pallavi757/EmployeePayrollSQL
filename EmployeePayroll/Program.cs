using System;
namespace EmployeePayroll 
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Employee Payroll ADO.NET Assignment");
            Console.WriteLine("======================================");
            Employee empObj = new Employee();
            empObj.CheckConnection();
        }
    
    }
 }