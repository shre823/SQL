CREATE SCHEMA IF NOT EXISTS where_practice;

USE where_practice;

CREATE TABLE customers(
cust_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
city VARCHAR(100),
age INT,
purchase_amount DECIMAL(10,2),
last_purchase_date DATE
);


INSERT INTO customers (name,city,age,purchase_amount,last_purchase_date)
VALUES('Amit','Pune',28,1500,'2025-01-10'),
      ('Kiran','Mumbai',35,2700,'2025-12-25'),
      ('Ravi','Kolkata',42,800,'2025-02-05'),
      ('Kiran','Delhi',31,1200,'2024-11-10'),
      ('Smita','Banglore',22,500,'2025-01-15');
      
      
SELECT*FROM customers WHERE city='Pune';

SELECT*FROM customers WHERE age>30; 

SELECT*FROM customers WHERE age BETWEEN 25 AND 40; ----------- WHERE WITH BETWEEN

 SELECT*FROM customers WHERE name LIKE 'A%';   ----------- WHERE LIKE
 
SELECT*
FROM customers
 WHERE city='Mumbai' AND age>25; ---------- WHERE AND

SELECT*
FROM customers
 WHERE city='Pune' OR purchase_amount>1500; ---- WHERE OR