CREATE SCHEMA IF NOT EXISTS groupby_demo;
USE groupby_demo;

CREATE TABLE employee_salary(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
department VARCHAR(100),
salary DECIMAL(10,2)
);

INSERT INTO employee_salary( name , department, salary)
VALUES ('Rahul', 'IT', 55000),
('sneha', 'HR', 48000),
('arjun', 'Fianance', 61000),
('priya', 'IT', 72000),
('manish', 'Marketing', 45000),
('neeta', 'Finance', 55000);

SELECT* FROM employee_salary;

-- Basic group by 
SELECT department,
AVG(salary) AS avg_salary
from employee_salary
GROUP BY department;

-- GROUP BY with count
SELECT department, COUNt(*) AS total_employees
from employee_salary
GROUP BY department;

-- Group by with sum and alias
SELECT department, SUM(salary) AS total_salary_budget
from employee_salary
GROUP BY department;