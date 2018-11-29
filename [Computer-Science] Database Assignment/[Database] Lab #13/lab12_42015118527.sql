-- LAB #12-4: DEADLOCK - 001
INSERT INTO BOOK VALUES (2, 'Machine Learning', 'McGrawHill', 20000);
COMMIT;

COLUMN bookname format a20;
SET TRANSACTION NAME 'T1';

SELECT bookname, price FROM BOOK;
UPDATE BOOK SET price = price + 10000 WHERE bookid = 1;

SELECT bookname, price FROM BOOK;
UPDATE BOOK SET price = price + 1000 WHERE bookid = 2;
COMMIT;

-- LAB #12-4: DEADLOCK - 002
COLUMN bookname format a20;
SET TRANSACTION NAME 'T2';

SELECT bookname, price FROM BOOK;
UPDATE BOOK SET price = price * 1.2 WHERE bookid = 2;

SELECT bookname, price FROM BOOK;
UPDATE BOOK SET price = price * 1.1 WHERE bookid = 1;

SELECT bookname, price FROM BOOK;
COMMIT;