# [COMP322] 데이타베이스 (Database)

This course introduces the fundaemental concepts necessary for designing, using and implementing database systems and database 
applications. In this course, we learn the fundaementals of database modeling and design, the languages and models provided by the database management systems (DBMSes), and database system implementation techniques. The main goal of this course is to give you in-depth and up-to-date knowledge of of the most important aspects of database systems and applications. Specifically, the major topics of this course is as follows: (1) logical design (relational, semi-structural, NoSQL), (2) DBMS installation and plays, (3) SQL, (4) JDBC programming, (5) indexing, (6) transaction processing, (7) web server programming, and (8) up-to-date technologies including Big Data, MapReduce and Hadoop/Spark if time permits. Through strong lab practices and programming assignments, the students are expected to be more familiar with data management.

## ★ Detail Syllabus

|PAGE 1|PAGE 2|PAGE 3|
|:----:|:----:|:----:|
|![](https://user-images.githubusercontent.com/20036523/46244210-56d62700-c416-11e8-84ec-1ae2655586fe.jpg)|![](https://user-images.githubusercontent.com/20036523/46244211-56d62700-c416-11e8-8263-6537abaea053.jpg)|![](https://user-images.githubusercontent.com/20036523/46244209-56d62700-c416-11e8-8892-756210071a17.jpg)|

## ★ Assignment Result

#### ※ Lab-#5 SQL Source Code
```SQL
sqlplus "/" as sysdba

grant all privileges to knu;

conn knu/comp322;

DROP TABLE DEPARTMENT CASCADE CONSTRAINT;

-- Lab #5-1: Defining the Database Tables
CREATE TABLE EMPLOYEE(
	Fname	VARCHAR(15)	NOT NULL,
	Minit	CHAR,
	Lname	VARCHAR(15),
	Ssn	CHAR(9),
	Bdate	DATE,
	Address	VARCHAR(30),
	Sex	CHAR,
	Salary	NUMBER(10,2),
	Super_ssn	CHAR(9),
	Dno	NUMBER DEFAULT 1 NOT NULL,
	PRIMARY KEY	(Ssn)
);

CREATE TABLE DEPARTMENT(
	Dname		VARCHAR(15)	NOT NULL,
	Dnumber		NUMBER		NOT NULL,
	Mgr_ssn		CHAR(9)		DEFAULT '888665555' NOT NULL,
	Mgr_start_date	DATE,
	PRIMARY KEY	(Dnumber),
	UNIQUE		(Dname),
	FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
);

CREATE TABLE DEPT_LOCATIONS(
	Dnumber		NUMBER		NOT NULL,
	Dlocation		VARCHAR(15)	NOT NULL,
	PRIMARY KEY	(Dnumber, Dlocation),
	FOREIGN KEY	(Dnumber) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE PROJECT(
	Pname		VARCHAR(15)	NOT NULL,
	Pnumber		NUMBER		NOT NULL,
	Plocation		VARCHAR(15),
	Dnum		NUMBER 		NOT NULL,
	PRIMARY KEY	(Pnumber),
	UNIQUE		(Pname),
	FOREIGN KEY 	(Dnum) REFERENCES DEPARTMENT(Dnumber)
);

CREATE TABLE DEPENDENT(
	Essn		CHAR(9)		NOT NULL,
	Dependent_name	VARCHAR(15)	NOT NULL,
	Sex		CHAR,
	Bdate		DATE,
	Relationship	VARCHAR(8),
	PRIMARY KEY	(Essn, Dependent_name),
	FOREIGN KEY	(Essn) REFERENCES EMPLOYEE(Ssn)
);

CREATE TABLE WORKS_ON(
	Essn	CHAR(9)		NOT NULL,
	Pno	NUMBER		NOT NULL,
	Hours	NUMBER(3,1),
	PRIMARY KEY	(Essn, Pno),
	FOREIGN KEY	(Essn) 	REFERENCES EMPLOYEE(Ssn),
	FOREIGN KEY	(Pno) 	REFERENCES PROJECT(Pnumber)
);

INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', '888665555', TO_DATE('1937-11-10', 'yyyy-mm-dd'), '450 Stone Houston, TX', 'M', 55000, NULL, 1);
INSERT INTO EMPLOYEE VALUES ('Jennifer', 'S', 'Wallace', '987654321', TO_DATE('1941-06-20', 'yyyy-mm-dd'), '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO EMPLOYEE VALUES ('Franklin', 'T', 'Wong', '333445555', TO_DATE('1968-01-19', 'yyyy-mm-dd'), '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
INSERT INTO EMPLOYEE VALUES ('John', 'B', 'Smith', '123456789', TO_DATE('1965-01-09', 'yyyy-mm-dd'), '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Alicia', 'J', 'Zelaya', '999887777', TO_DATE('1968-01-19', 'yyyy-mm-dd'), '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES ('Ramesh', 'K', 'Narayan', '666884444', TO_DATE('1962-09-15', 'yyyy-mm-dd'), '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Joyce', 'A', 'English', '453453453', TO_DATE('1972-07-31', 'yyyy-mm-dd'), '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Ahmad', 'V', 'Jabbar', '987987987', TO_DATE('1969-03-29', 'yyyy-mm-dd'), '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);

INSERT INTO DEPARTMENT VALUES ('Headquarters', 1, '888665555', TO_DATE('1981-06-19', 'yyyy-mm-dd'));
INSERT INTO DEPARTMENT VALUES ('Administration', 4, '987654321', TO_DATE('1995-01-01', 'yyyy-mm-dd'));
INSERT INTO DEPARTMENT VALUES ('Reserarch', 5, '333445555', TO_DATE('1988-05-22', 'yyyy-mm-dd'));

ALTER TABLE DEPARTMENT ADD FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) ON DELETE SET NULL;
ALTER TABLE EMPLOYEE ADD FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn) ON DELETE SET NULL;

-- Labl #5-2: Populating Database
INSERT INTO DEPT_LOCATIONS VALUES (1, 'Houston');
INSERT INTO DEPT_LOCATIONS VALUES (4, 'Stafford');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Houston');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Sugarland');

INSERT INTO PROJECT VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT VALUES ('NewBenefits', 30, 'Stafford', 4);

INSERT INTO DEPENDENT VALUES ('333445555', 'Alice', 'F', TO_DATE('1986-04-05', 'yyyy-mm-dd'), 'Daughter');
INSERT INTO DEPENDENT VALUES ('333445555', 'Theodore', 'M', TO_DATE('1983-11-25', 'yyyy-mm-dd'), 'Son');
INSERT INTO DEPENDENT VALUES ('333445555', 'Joy', 'F', TO_DATE('1958-05-03', 'yyyy-mm-dd'), 'Spouse');
INSERT INTO DEPENDENT VALUES ('987654321', 'Abner', 'M', TO_DATE('1942-02-28', 'yyyy-mm-dd'), 'Spouse');
INSERT INTO DEPENDENT VALUES ('123456789', 'Michael', 'M', TO_DATE('1988-01-04', 'yyyy-mm-dd'), 'Son');
INSERT INTO DEPENDENT VALUES ('123456789', 'Alice', 'F', TO_DATE('1988-12-30', 'yyyy-mm-dd'), 'Daughter');
INSERT INTO DEPENDENT VALUES ('123456789', 'Elizabeth', 'F', TO_DATE('1967-05-05', 'yyyy-mm-dd'), 'Spouse');

INSERT INTO WORKS_ON VALUES ('123456789', 1, 32.5);
INSERT INTO WORKS_ON VALUES ('123456789', 2, 7.5);
INSERT INTO WORKS_ON VALUES ('666884444', 3, 40);
INSERT INTO WORKS_ON VALUES ('453453453', 1, 20);
INSERT INTO WORKS_ON VALUES ('453453453', 2, 20);
INSERT INTO WORKS_ON VALUES ('333445555', 2, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 3, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 10, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 20, 10);
INSERT INTO WORKS_ON VALUES ('999887777', 30, 30);
INSERT INTO WORKS_ON VALUES ('999887777', 10, 10);
INSERT INTO WORKS_ON VALUES ('987987987', 10, 35);
INSERT INTO WORKS_ON VALUES ('987987987', 30, 5);
INSERT INTO WORKS_ON VALUES ('987654321', 30, 20);
INSERT INTO WORKS_ON VALUES ('987654321', 20, 15);
INSERT INTO WORKS_ON VALUES ('888665555', 20, NULL);

-- Lab #5-3: Database Querying
SELECT Fname, Minit, Lname FROM EMPLOYEE WHERE Salary >= 25000 AND Dno=4 ORDER BY Lname ASC;
SELECT Fname, Lname FROM EMPLOYEE WHERE ADDRESS LIKE '%Houston, TX%' AND Super_ssn='333445555';
SELECT Lname FROM EMPLOYEE, PROJECT WHERE PROJECT.PNUMBER=20 ORDER BY Lname DESC;

-- Lab #5-4: Database Modification
DELETE FROM DEPENDENT WHERE Essn='987654321';
SELECT * FROM DEPENDENT;

DELETE FROM DEPARTMENT WHERE Dnumber=1;
SELECT * FROM DEPARTMENT;

DELETE FROM WORKS_ON WHERE Pno=30;
SELECT * FROM WORKS_ON;

UPDATE PROJECT SET Plocation='Houston', Dnum=1 WHERE Dnum=5;
SELECT * FROM PROJECT;

UPDATE EMPLOYEE SET Super_ssn=null WHERE Super_ssn='888665555';
SELECT * FROM EMPLOYEE;

UPDATE PROJECT SET Pnumber=40 WHERE Pnumber=30;
SELECT * FROM PROJECT;
```
