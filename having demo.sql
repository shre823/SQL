CREATE SCHEMA IF NOT EXISTS having_demo; 
USE having_demo; 

CREATE TABLE orders(
orders_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (100),
quantity INT,
price DECIMAL(10,2)
);
 INSERT INTO orders (product_name , quantity, price)
 values  
 (' Laptop', 2, 55000),
 (' mouse', 10, 500),
 (' keybord', 5, 1500),
 (' Laptop', 1, 53000),
 (' monitor', 1, 12000);
 
 SELECT * FROM orders;
 
 -- HAVING USED AFTER GROUP BY
 SELECT 
 product_name,
 SUM(quantity) AS total_quantity
 from oreders
 GROUP BY product_name
 HAVING SUM(quantity) >= 3;
 
 -- HAVING WITH expression 
 SELECT 
 product_name,
 SUM(quantity * price) AS revenue 
 GROUP BY product_name
 HAVING revenue > 50000;

 -- CREATE SCHEMA IF NOT EXISTS limit_demo;
 USE limit_demo;
 
 CREATE TABLE customers (
 cust_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 city VARCHAR(100),
 purchase_amount DECIMAL (10,2)
 );
 
 INSERT INTO customers (name, city, purchase_amount)
 VALUES 
 ('Amit', 'pune', 1500),
 ('neha', 'mumbai', 2300),
 ('ravi', 'pune', 800),
 ('kiran', 'delhi', 1200),
 ('smita', 'mumbai', 500),
 ('roshant', 'indore', 700);
 
 SELECT * FROM customers;
 
 -- GET top 3 customers
 SELECT * FROM customers ORDER BY purchase_amount DESC LIMIT 3 ;
 
 -- GET bottom 2 customers 
  SELECT * FROM customers ORDER BY purchase_amount ASC LIMIT 2 ;
 
 -- pagination Concept
 SELECT * FROM customers LIMIT 2 OFFSET 2;

 SELECT * FROM customers LIMIT 2 OFFSET 0;
 
  SELECT * FROM customers LIMIT 2 OFFSET 4;
 
 
 -- Uunion clause

 CREATE SCHEMA IF NOT EXISTS union_demo;
 USE union_demo;
 
 CREATE TABLE online_sale(
 sale_id INT,
 product VARCHAR(100),
 amount DECIMAL (10,2)
 );
 
 CREATE TABLE store_sale(
 sale_id INT,
 product VARCHAR(100),
 amount DECIMAL(10,2)
 );
INSERT INTO online_sales VALUES
 (1, 'Laptop', 55000),
 (2, 'Mouse', 500);
 
  INSERT INTO store_sales VALUES
 (1, 'Laptop', 54000),
 (2, 'Mouse', 1500);
 
 SELECT * FROM online_sale;
 SELECT * FROM store_sale;
 
 -- UNIOIN (remove duplication)
  SELECT * FROM online_sales
  UNION 
  SELECT * FROM store_sales;
  
-- UNION ALL ( keeps duplication)
SELECT * FROM online_sales
UNION ALL
SELECT * FROM store_sales;
 


