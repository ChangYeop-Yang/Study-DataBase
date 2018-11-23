-- #1 Create an index, named
CREATE INDEX EMPLOYEE_FIRST_LAST_NAME_IDX ON EMPLOYEE(FNAME, LNAME);
SELECT * FROM EMPLOYEE WHERE FNAME = 'John' AND LNAME = 'Smith';

-- #2 Create an index, named dept_dname_mgrssn_idx, on multiple columns of Dname and Mgr_ssn on DEPARTMENT.
CREATE INDEX dept_dname_mgrssn_idx ON DEPARTMENT(Dname, Mgr_ssn);
SELECT * FROM DEPARTMENT WHERE Dname = 'Administration' AND to_number(Mgr_ssn) = 987654321;

-- #3 Write your query to view all the indexes created for the PROJECT table.
SELECT * FROM all_indexes WHERE table_name = 'PROJECT';
SELECT * FROM ALL_IND_COLUMNS WHERE table_name = 'PROJECT';

-- #4 How many indexes are created for the WORKS_ON and DEPT_LOCATIONS tables, respectively?
SELECT INDEX_NAME FROM ALL_INDEXES WHERE table_name = 'WORKS_ON';
SELECT INDEX_NAME FROM ALL_INDEXES WHERE table_name = 'DEPT_LOCATIONS';

-- #5 Create an index for the Relationship column in the DEPENDENT table.
CREATE INDEX DEPENDENT_Relationship_IDX ON DEPENDENT(Relationship);
SELECT * FROM DEPENDENT WHERE Relationship = 'Spouse';
SELECT * FROM DEPENDENT WHERE DEPENDENT_NAME = 'Alice';