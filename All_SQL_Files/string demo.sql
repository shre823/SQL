CREATE DATABASE IF NOT EXISTS string_demo;
USE string_demo;

CREATE TABLE customers (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR (100),
city VARCHAR(100)
);

INSERT INTO customers (first_name , last_name, city) 
VALUES 
('Amit', 'Sharma', 'pune'),
('riya', 'meheta','mumbai'),
('rahul', 'verma', 'delhi');

SELECT * FROM customers;
-- using strig literal
SELECT 'Customers List' AS message;

-- string concatenation using CONCAT()
SELECT CONCAT(first_name, ' ' ,last_name) AS full_name from customers;

-- combinig literal and colum 
SELECT CONCAT('Mr./Ms. ',first_name, ' ',last_name) AS greeting from customers;

-- using string functin 
SELECT 
first_name,
UPPER(last_name) AS upper_name,
LOWER(city) AS lower_city,
LENGTH(first_name) AS name_length,
SUBSTRING(first_name, 2, 3) AS first_three_letters
from customers;

-- using TRIM and REPLACE 
SELECT 
TRIM('    Hello world      ') AS trimmed,
REPLACE('MySQL Database', 'Database', 'Workbench') AS replaced_text;