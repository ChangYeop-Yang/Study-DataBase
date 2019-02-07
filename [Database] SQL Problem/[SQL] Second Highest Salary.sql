SELECT Max(Salary) as SecondHighestSalary FROM Employee WHERE Salary < (SELECT Max(Salary) FROM Employee);
