-- EXISTS cluse 
 CREATE SCHEMA IF NOT EXISTS exists_demo;
 USE exists_demo;
 
 CREATE TABLE customers(
 cust_id INT PRIMARY KEY,
 name VARCHAR(100)
 );
 
 CREATE TABLE oreders(
 order_id INT,
 cust_id INT,
 amount DECIMAL(10,2)
 );
 
 INSERT INTO customers VALUES
 (1, 'Amit'),
 (2, 'Sneha'),
 (3, 'Ravi');
  
 INSERT INTO orders VALUES
 (101, 1, 1200),
 (102, 3,900);
 
 SELECT * FROM customers;
 SELECT * FROM orders;
 
 -- SELECT customers who made a least one order
 SELECT name FROM customers c
 WHERE EXISTS (
     select 1 FROM orders o
     WHERE o.cust_id = c.cust_id
 );
 

 