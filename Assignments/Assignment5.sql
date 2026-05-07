-- Q1: Create a new database named &#39;practice_datetime_join&#39; and use it for this exercise.
	CREATE DATABASE practice_datetime_join;
	USE practice_datetime_join;
    
-- Q2: Create a table named sales_orders  having fields:
-- order_id (INT AUTO_INCREMENT PRIMARY KEY),
-- customer_name (VARCHAR(50)),
-- order_datetime (DATETIME).
	CREATE TABLE sales_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_datetime DATETIME
	);
    
-- Q3: Insert at least 5 sample records with different order dates and times
-- spread across different months and years.
	INSERT INTO sales_orders (customer_name, order_datetime) VALUES
	('Amit', '2023-01-15 10:30:00'),
	('Neha', '2023-05-20 14:45:00'),
	('Rahul', '2024-02-10 09:15:00'),
	('Priya', '2024-07-18 16:20:00'),
	('Karan', '2025-03-05 11:50:00');
    
-- Q4: Display all orders and show the year, month, and day separately for each order.
	SELECT  order_id, customer_name,
	YEAR(order_datetime) AS Year,
	MONTH(order_datetime) AS Month,
	DAY(order_datetime) AS Day
	FROM sales_orders;
    
-- Q5: For each order, display the customers name and the hour and minute
-- when the order was placed.
	SELECT  customer_name,
	HOUR(order_datetime) AS Hour,
	MINUTE(order_datetime) AS Minute
	FROM sales_orders;
    
-- Q6: Retrieve the current date, current time, and the current date-time together
-- in separate columns.
	SELECT 
	CURDATE() AS Current_Date,
	CURTIME() AS Current_Time,
	NOW() AS Current_DateTime;
    
-- Q7: For every order, calculate a delivery date that is exactly 10 days after the order date.
	SELECT order_id, customer_name, order_datetime,
	DATE_ADD(order_datetime, INTERVAL 10 DAY) AS delivery_date
	FROM sales_orders;
    
-- Q8: Show how many days have passed since each order was placed compared to today’s date.
	SELECT order_id, customer_name, order_datetime,
	DATEDIFF(CURDATE(), DATE(order_datetime)) AS Days_Passed
	FROM sales_orders;
    
-- Q9: Display all orders with their date formatted in the pattern &quot;DD-Month-YYYY HH:MM&quot;.
	SELECT  order_id, customer_name,
	DATE_FORMAT(order_datetime, '%d-%M-%Y %H:%i') AS formatted_date
	FROM sales_orders;
    
-- Q10: Create a table named &#39;departments_demo&#39; with columns:
-- dept_id (INT AUTO_INCREMENT PRIMARY KEY),
-- dept_name (VARCHAR(50)),
-- location (VARCHAR(50)).
	CREATE TABLE departments_demo (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
	);
    
-- Q11: Create another table named ;staff_demo with columns:
-- staff_id (INT AUTO_INCREMENT PRIMARY KEY),
-- staff_name (VARCHAR(50)),
-- dept_id (INT),
-- salary (DECIMAL(10,2)) and link it to departments_demo; using a foreign key.
	CREATE TABLE staff_demo (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES departments_demo(dept_id)
	);
    
-- Q12: Insert sample data in both tables such that some departments have no staff
-- and some staff have NULL department assignments.
	INSERT INTO departments_demo (dept_name, location) 
    VALUES
	('HR', 'Mumbai'),
	('IT', 'Pune'),
	('Finance', 'Delhi'),
	('Marketing', 'Bangalore');
    
    INSERT INTO staff_demo (staff_name, dept_id, salary)
    VALUES
	('Rohan', 1, 50000),
	('Sneha', 2, 60000),
	('Ajay', 2, 55000),
	('Pooja', NULL, 45000),
	('Vikas', 3, 70000);
    
-- Q13: Display all staff details along with their department names
-- but only include those staff members who are assigned to a department.
	SELECT s.staff_name, d.dept_name
	FROM staff_demo s
	INNER JOIN departments_demo d -- An INNER JOIN returns only the matching records from both tables.
	ON s.dept_id = d.dept_id;
    
-- Q14: Display all staff details along with department information
-- including those who are not assigned to any department.
	SELECT s.staff_name, d.dept_name, d.location
	FROM staff_demo s
	LEFT JOIN departments_demo d   -- Show all rows from the left table (staff_demo)
	ON s.dept_id = d.dept_id;      -- Show matching rows from the right table (departments_demo)
								   -- If no match exists, the department columns will show NULL

    
-- Q15: Display all department names along with staff working under them,
-- but include those departments that currently have no staff members.
	SELECT d.dept_name, s.staff_name
	FROM staff_demo s
	RIGHT JOIN departments_demo d
	ON s.dept_id = d.dept_id;
    
-- Q16: Retrieve a combined result showing all staff and departments,
-- including staff without departments and departments without staff.
	SELECT s.staff_name, d.dept_name
	FROM staff_demo s
	LEFT JOIN departments_demo d
	ON s.dept_id = d.dept_id

	UNION

	SELECT s.staff_name, d.dept_name
	FROM staff_demo s
	RIGHT JOIN departments_demo d
	ON s.dept_id = d.dept_id;
    
-- Q17: Calculate and display the total salary being paid under each department.
	SELECT d.dept_name,
	SUM(s.salary) AS total_salary
	FROM staff_demo s
	JOIN departments_demo d
	ON s.dept_id = d.dept_id
	GROUP BY d.dept_name;
    
-- Q18: Display the department name along with the total number of staff working in it.
	SELECT d.dept_name,
	COUNT(s.staff_id) AS staff_count
	FROM departments_demo d
	LEFT JOIN staff_demo s
	ON d.dept_id = s.dept_id
	GROUP BY d.dept_name;
    
-- Q19: Retrieve the names of staff members who do not belong to any department.
	SELECT staff_name
	FROM staff_demo
	WHERE dept_id IS NULL;
    
-- Q20: Retrieve the names and locations of all departments
	SELECT dept_name, location
	FROM departments_demo;