-- Lab #7-1: Oracle PL/SQL
SET SERVEROUTPUT ON;

ACCEPT dept PROMPT 'received dept no: '

DECLARE
  maxDigit NUMBER(3,1) := 0.0;
  CURSOR C1 IS
  SELECT AVG(WORKS_ON.HOURS) AS Hours FROM WORKS_ON, EMPLOYEE WHERE EMPLOYEE.DNO = &dept AND WORKS_ON.PNO != 0 GROUP BY WORKS_ON.PNO;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Procedure created.');
  
  FOR hours IN C1 LOOP
    EXIT WHEN C1%NOTFOUND;
    
    IF (maxDigit < hours.Hours) THEN
      maxDigit := hours.Hours;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(ROUND(hours.Hours, 2));
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('¡Ø Max Hours: ' || maxDigit);
  
  CLOSE C1;
END;

-- Lab #7-2: Oracle PL/SQL
SET SERVEROUTPUT ON;

ACCEPT dept PROMPT 'received dept no: '

DECLARE
  maxDigit NUMBER(3,1) := 0.0;
  CURSOR C1 IS
  SELECT AVG(WORKS_ON.HOURS) AS Hours, WORKS_ON.PNO AS Pnumber, EMPLOYEE.DNO AS Dnumber FROM WORKS_ON, EMPLOYEE WHERE EMPLOYEE.DNO = &dept AND WORKS_ON.PNO != 0 GROUP BY WORKS_ON.PNO, EMPLOYEE.DNO ORDER BY WORKS_ON.PNO ASC;

BEGIN
  DBMS_OUTPUT.PUT_LINE('Procedure created.');
  DBMS_OUTPUT.PUT_LINE('dept_number   project number    averaged hours');
  DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
  
  FOR hours IN C1 LOOP
    EXIT WHEN C1%NOTFOUND;
    
    IF (maxDigit < hours.Hours) THEN
      maxDigit := hours.Hours;
    END IF;
    DBMS_OUTPUT.PUT_LINE(hours.Dnumber || ' ' || hours.Pnumber || ' ' || ROUND(hours.Hours, 2));
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('¡Ø Max Hours: ' || maxDigit);
  
  CLOSE C1;
END;