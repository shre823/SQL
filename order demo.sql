CREATE SCHEMA IF NOT EXISTS order_demo;
USE order_demo;

CREATE TABLE sales(
 sale_id INT PRIMARY KEY AUTO_INCREMENT,
 product VARCHAR(100),
 quantity INT,
 price DECIMAL(10,2),
 sale_date DATE
 );
 
 INSERT INTO sales (product, quantity, price, sale_date)
 values ('Laptop', 2, 55000, '2025-02-01'),
 ('Laptop', 10, 500, '2025-02-10'),
 ('mouse', 1, 12000, '2025-01-25'),
 ('Laptop', 5, 1500, '2025-01-20'),
 ('Laptop', 1, 53000, '2025-02-11'),
 ('Laptop', 3, 450, '2025-02-15');
 
SELECT * FROM sales;

SELECT*FROM sales ORDER BY price ASC;

SELECT * FROM sales ORDER BY price DESC;

SELECT * FROM sales ORDER BY product ASC, price DESC;

SELECT product, quantity * price AS total_amount
from sales 
ORDER BY total_amount DESC;