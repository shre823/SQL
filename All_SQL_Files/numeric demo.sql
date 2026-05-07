CREATE DATABASE IF NOT EXISTS numeric_demo;
USE numeric_demo;

CREATE TABLE products(
id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL (10,2),
discount DECIMAL(5,2)
);

INSERT INTO products(product_name, price, discount) VALUES
('Laptop', 74999.99, 10.5),
('Table', 18999.45, 5.75),
('Mouse', 799.99, NULL);
SELECT * FROM products;

-- Basic arithmetic opratoers
SELECT 
product_name,
price,
discount,
price - (price * discount / 100) AS discounted_price
from products;

-- using raound , ceil, and floor 
SELECT 
product_name,
ROUND(price, 2) AS rounded_price,
CEIL(price) AS ceilling_value,
FLOOR(price) AS floor_values
from product;

-- using POWER ,SQRT, MOD
SELECT
price,
POWER(price, 2) AS qsuared_price,
SQRT(price) AS sqrt_price,
MOD(price, 2) AS remainder
from products;