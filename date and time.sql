CREATE DATABASE IF NOT EXISTS datetime_demo;
USE datetime_demo;

CREATE TABLE orders(
order_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100),
order_date DATETIME
);

INSERT INTO orders( customer_name ,order_date)
VALUES
('Amit','2025-11-22 10:30:00'),
('Riya','2025-11-13 09:15:00'),
('Rahul','2025-10-05 16:45:00');

-- Dplay all recaords
SELECT * FROM orders;

-- Extracting parts of a date
SELECT 
customer_name,
order_date,
YEAR(order_date) AS order_year,
MONTH(order_date) AS oder_month,
DAY(order_date) AS oder_day,
HOUR(order_date) AS order_hour
FROM orders;

-- using current data and time function
-- using current data and time fuction
-- SELECT
-- NOW() AS current_datetime
-- CURDATE ()AS current_datetime
-- CURTIME()AS current_datetime

SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();

-- using data_add, datediff and date_formate
SELECT 
customer_name,
DATE_ADD(order_date, INTERVAL 7 DAY) AS delivery_date,
DATEDIFF(NOW(), order_date) AS days_since_order,
DATE_FORMAT(order_date, '%d-%M-%Y-%H:%i') AS formatted_date
from orders;