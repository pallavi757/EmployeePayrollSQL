using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeePayroll
{
    public class Employee
    {
        public static string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=payroll_service;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        public bool CheckConnection()
        {
            try
            {
                using (this.connection)
                {
                    this.connection.Open();
                    Console.WriteLine("Connection is opened");
                    Console.WriteLine("Connection good");
                    this.connection.Close();
                    Console.WriteLine("Connection is closed");
                    return true;
                }
            }
            catch (Exception)
            {
                throw new EmployeeException(EmployeeException.ExceptionType.Connection_Failed, "connection failed"); ;
                //Console.WriteLine(e.Message);
                //return false;
            }
        }
    }
}
