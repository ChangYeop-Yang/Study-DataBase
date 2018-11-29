-- Lab #12-1: A Single Transaction
SET TRANSACTION NAME 'comp322-tran';
CREATE TABLE BOOK (
  bookid  NUMBER  PRIMARY KEY NOT NULL,
  bookname  VARCHAR(100),
  publisher VARCHAR(20),
  price NUMBER
);
SAVEPOINT create_table;

INSERT INTO BOOK Values (1, 'Database', 'Pearson', 30000);
SELECT bookname "bookname1" FROM BOOK WHERE bookid = 1;
SAVEPOINT insert_1;

UPDATE BOOK SET bookname = 'Intro. to Database' WHERE bookid = 1;
SELECT bookname "bookname2" FROM BOOK WHERE Bookid = 1;
SAVEPOINT update_1;

UPDATE BOOK SET bookname = 'Database Lab.' WHERE bookid = 1;
SELECT bookname FROM BOOK WHERE Bookid = 1;

ROLLBACK TO update_1;

SELECT bookname FROM BOOK WHERE bookid = 1;
ROLLBACK to insert_1;

SELECT bookname FROM BOOK WHERE bookid = 1;
COMMIT;

UPDATE BOOK SET bookname = 'Database lab2' WHERE bookid = 1;
SELECT bookname FROM BOOK WHERE Bookid = 1;

ROLLBACK;

SELECT bookname FROM BOOK WHERE Bookid = 1;
DELETE FROM BOOK WHERE bookid = 1;

ROLLBACK;

SELECT bookname FROM BOOK WHERE Bookid = 1;
COMMIT;