SELECT D1.Name AS Department, E1.Name AS Employee, E1.Salary AS Salary
FROM (SELECT RANK() OVER (PARTITION BY E2.DepartmentId ORDER BY E2.Salary DESC) AS dep_rank, E2.Id AS ID FROM Employee E2) E3, Employee E1, Department D1
WHERE E3.dep_rank = 1 AND E3.ID = E1.Id AND D1.Id = E1.DepartmentId;
