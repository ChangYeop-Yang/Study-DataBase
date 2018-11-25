-- 1) Display the output (in the TYPICAL format by default) of EXPLAIN PLAN for the following query
-- Q: Which join algorithm is used for this query? 72
EXPLAIN PLAN FOR SELECT e1.Fname, e1.Lname FROM EMPLOYEE e1 WHERE e1.Salary = (SELECT MAX(Salary) FROM EMPLOYEE e2);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- 2) Display the output in the BASIC format by default of EXPLAIN PLAN for the following query
-- Q: Which join algorithm is used for this query? SORT
EXPLAIN PLAN FOR SELECT COUNT(*) FROM DEPARTMENT d WHERE d.Dnumber IN (SELECT E.Dno FROM EMPLOYEE E WHERE E.Salary > 20000);
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- 3) Display the output in the BASIC format by default of EXPLAIN PLAN for the following query
-- Q: What join algorithms are used for this plan? MERGE JOIN, SORT JOIN, HASH JOIN
-- Q: How many operators are used for this plan? 6 (SELECT STATEMENT, SORT ORDER BY, MERGE JOIN, SORT JOIN, MERGE JOIN, TABLE ACCESS BY INDEX ROWID| PROJECT)
-- Q: Which table is fully scanned in outer loop? PROJECT
EXPLAIN PLAN FOR SELECT /*+ USE_MERGE(EMPLOYEE PROJECT WORKS_ON) */ Fname, Lname FROM EMPLOYEE, PROJECT, WORKS_ON WHERE Ssn = Essn AND Pno = Pnumber AND Pname = 'ProjectX' ORDER BY Lname desc;
SELECT * FROM TABLE(SYS.DBMS_XPLAN.DISPLAY);