/* Write your PL/SQL query statement below */
SELECT W1.Id 
FROM Weather W1 
WHERE W1.RecordDate - 1 IN (SELECT W2.RecordDate FROM Weather W2 WHERE W1.Temperature > W2.Temperature);
