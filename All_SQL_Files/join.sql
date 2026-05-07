CREATE DATABASE IF NOT EXISTS join_demo;
USE join_demo;

CREATE TABLE departments(
dept_id INT AUTO_INCREMENT PRIMARY KEY,
dept_name VARCHAR (100) NOT NULL,
location VARCHAR(100)
);

CREATE TABLE employees(
emp_id INT AUTO_INCREMENT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
dept_id INT,
salary DECIMAL(10,2),
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_name, location)
VALUES
('HR', 'Mumbai'),
('finance', 'Delhi'),
('IT', 'Banglor'),
('marketing', 'chennai'),
('sales', 'Mumbai');

INSERT INTO employees (emp_name, dept_id, salary)
VALUES
('Amit sharam', 1, 50000.00),
('Rita meheta', 2, 60000.00),
('karan patel', 3, 75000.00),
('neha joshi', 3, 70000.00),
('Rhit sighn', NULL,50000.00);
 
 SELECT * FROM departments;
 SELECT * from employees;
 
SELECT 
e.emp_id,
e.emp_name,
d.dept_name,
d.location,
e.salary
from employees AS e
INNER JOIN departments AS d
ON e.dept_id = d.dept_id;

-- Explainantion 
-- only employees having a valid department_id appear.
-- employee "rohit singh" (dept_id - null) will not appear.
-- departments with no employee (like 'marketing' and sales) will also be excluded

-- ==================================================================
 -- step 4 LEFT JOIN

-- FELT join return all rows the  left table(employees),
-- and the matching rows from the right table (department).
-- if there no mathch null values appers for right table colums

SELECT
e.emp_id,
e.emp_name,
d.dept_name,
d.location,
e.salary
FROM employees AS e 
LEFT JOIN departments AS d
ON e.dept_id = d.dept;

-- Explainantin 
-- all employees apper in result 
-- "rohit singh" apperar with dept_name = null
-- this helps when you want to include all records from the main(lrft) table

-- STEP 6 
-- FULL OUTER JOIN (NOT DIRECTLY SUPPORTED IN MYSQL)
-- Mysql does not have a full outer join keyword 
-- but ew cat achive the same using UNION of join RIGHt JOIN

SELECT
e.emp_id,
e.emp_name,
d.dept_name,
d.location,
e.salary
FROM employees AS e 
LEFT JOIN departments AS d
ON e.dept_id = d.dept_id

UNION

SELECT
e.emp_id,
e.emp_name,
d.dept_name,
d.location,
e.salary
FROM employees AS e 
LEFT JOIN departments AS d
ON e.dept_id = d.dept_id;

-- Exaplain
-- UNION combaine reslut from both left and right joins
-- so you get all employees (even those without departments)
-- and all departments (even those without employeeds)
-- Removes duplicate rows automaticaly.


-- PRACTICE BUSINESS QUERISS
-- ================================================================================
-- 1 Find salary paid per departmen using INNER join
SELECT 
d.dept_name,
SUM(e.salary) AS total_salary
FROM employees e 
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- List all departments abd number of employees (LEFT JOIN
SELECT 
d.dept_name,
COUNT(e.salary) AS total_employees
FROM departments d 
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 3 FIND employees not assigned to sny departments (LEFT JOIN+ IS NULL)
SELECT 
d.dept_name,
e.salary
FROM employees e 
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL; 

-- 4 Find departments with no employees (RIGHT JOIN + NULL)
SELECT 
d.dept_name,
d.location
FROM employees e 
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;