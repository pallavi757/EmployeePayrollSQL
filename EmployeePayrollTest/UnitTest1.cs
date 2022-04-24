using EmployeePayroll;
using NUnit.Framework;
using System;

namespace EmployeePayrollTest
{
    public class Tests
    {
        Employee employee;
        [SetUp]
        public void Setup()
        {
            employee = new Employee();
        }

        [Test]
        public void WhenValidConnectionString_CheckConnetion_ShouldReturn_True()
        {
            bool expected = true;
            Employee empTestObj = new Employee();
            bool result = empTestObj.CheckConnection();
            Assert.AreEqual(expected, result);
        }
    }
}