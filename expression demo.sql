CREATE SCHEMA IF NOT EXISTS expression_demo;
USE expression_demo;

CREATE TABLE orders (
ORDER_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(100),
quantity INT,
price DECIMAL(10,2),
discount_percentage INT,
order_date DATE
);

INSERT INTO orders (product_name, quantity, price, discount_percentage, order_date)
VALUES ('latop', 2, 55000, 10, '2025-02-01'),
('mouse', 5, 500, 5, '2025-02-10'),
('keybord', 1, 1500, 0, '2025-02-28'),
('monitor', 3, 8000, 15, '2025-02-20'),
('hedphone', 4, 2000, 20, '2025-02-05');
SELECT * FROM orders;

SELECT product_name,
quantity * price AS Total_Cost
FROM orders;

SELECT
product_name,
price,
discount_percentage,
price - (price * discount_percentage / 100) AS Price_After_Discount from orders;

-- data expressoin
INSERT INTO orders (product_name, quantity, price, discount_percentage, order_date)
VALUES ('latop', 2, 55000, 10, '2026-01-11'),
('mouse', 5, 500, 5, '2025-02-10');
SELECT * from orders;

SELECT * FROM orders 
WHERE order_date > DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT UPPER(product_name) AS product_IPPER,
ROUND(price / 12, 2) AS Monthly_Installment
FROM orders;

SELECT product_name,
price,
(price> 5000) AS Ecpernsiv
from orders;