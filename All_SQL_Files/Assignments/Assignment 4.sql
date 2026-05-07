-- 1) Create a new database named 'sales_db' and switch to it.
	CREATE DATABASE sales_db;
	use sales_db;

-- 2) Create a table named 'employees' with columns: emp_id (INT, PRIMARY KEY), emp_name (VARCHAR(100)), department (VARCHAR(50)), salary (DECIMAL(10,2)).
	CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
	);

-- 3) Insert at least 10 sample records into the 'employees' table with a mix of departments like 'HR', 'Sales', 'IT', and different salary ranges.
	INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
	(1, 'Amit Sharma', 'HR', 35000.00),
	(2, 'Neha Verma', 'Sales', 42000.50),
	(3, 'Rahul Patil', 'IT', 60000.00),
	(4, 'Sneha Joshi', 'HR', 38000.75),
	(5, 'Vikram Singh', 'Sales', 50000.00),
	(6, 'Priya Nair', 'IT', 72000.25),
	(7, 'Rohan Mehta', 'IT', 65000.00),
	(8, 'Kavita Desai', 'HR', 33000.00),
	(9, 'Arjun Kapoor', 'Sales', 48000.00),
	(10, 'Meera Iyer', 'IT', 80000.00);

-- 4) Create another table named 'departments' with columns: dept_id (INT, PRIMARY KEY), dept_name (VARCHAR(50)), location (VARCHAR(100)).
	CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(100)
	);
    
-- 5) Insert at least 5 sample department records with various locations.
	INSERT INTO departments (dept_id, dept_name, location) VALUES
	(1, 'HR', 'Mumbai'),
	(2, 'Sales', 'Delhi'),
	(3, 'IT', 'Bangalore'),
	(4, 'Finance', 'Pune'),
	(5, 'Marketing', 'Chennai');
    
-- 6) Retrieve all employees who have a salary greater than 50000.
	select emp_name from employees where salary > 50000;

-- 7) Retrieve the top 3 highest-paid employees.
	SELECT *
	FROM employees
	ORDER BY salary DESC
	LIMIT 3;

-- 8) Retrieve the top 5 lowest-paid employees.
	SELECT *
	FROM employees
	ORDER BY salary ASC
	LIMIT 5;

-- 9) Display all employee names and their departments in alphabetical order, but show only the first 4 records.
	SELECT emp_name, department
	FROM employees
	ORDER BY emp_name ASC
	LIMIT 4;
    
-- 10) Display total salary paid in each department and show only departments where the total salary exceeds 100000.
	SELECT department,
       SUM(salary) AS total_salary
	FROM employees
	GROUP BY department
	HAVING SUM(salary) > 100000;

-- 11) Display the average salary of employees in each department, but include only those departments having more than 2 employees.
	SELECT department,
       AVG(salary) AS avg_salary
	FROM employees
	GROUP BY department
	HAVING COUNT(*) > 2;

-- 12) Display departments and the count of employees in each department, but only show departments where count is greater than 3.
	SELECT department,
       COUNT(*) AS total_employees
	FROM employees
	GROUP BY department
	HAVING COUNT(*) > 3;

-- 13) Retrieve all employees and display a new column 'Salary_Status' that shows 'High' if salary > 70000, 'Medium' if between 40000 and 70000, else 'Low'.
	SELECT emp_name,
       salary,
       CASE
           WHEN salary > 70000 THEN 'High'
           WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Status
	FROM employees;

-- 14) Display employee names, salaries, and a remark column where:'Bonus Eligible' if salary > 80000, 'No Bonus' otherwise.
	SELECT emp_name,
       salary,
       CASE
           WHEN salary > 80000 THEN 'Bonus Eligible'
           ELSE 'No Bonus'
       END AS remark
	FROM employees;

-- 15) Create another table named 'contract_employees' with columns:emp_id (INT), emp_name (VARCHAR(100)), department (VARCHAR(50)), salary (DECIMAL(10,2)).
	CREATE TABLE contract_employees (
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
	);

-- 16) Insert at least 5 records into 'contract_employees' table with a few departments common to 'employees'.
	INSERT INTO contract_employees (emp_id, emp_name, department, salary)
	VALUES
	(101, 'Rahul', 'IT', 60000),
	(102, 'Sneha', 'HR', 45000),
	(103, 'Amit', 'Finance', 75000),
	(104, 'Priya', 'IT', 50000),
	(105, 'Karan', 'Marketing', 40000);

-- 17) Combine all employee names and departments from both 'employees' and 'contract_employees' tables.
	SELECT emp_name, department FROM employees
	UNION ALL
	SELECT emp_name, department FROM contract_employees;

-- 18) Combine all employee names from both tables, but display unique names only.
	SELECT emp_name FROM employees
	UNION
	SELECT emp_name FROM contract_employees;

-- 19) Combine the records of both tables and show only the first 5 results.
	SELECT emp_id, emp_name, department, salary FROM employees
	UNION ALL
	SELECT emp_id, emp_name, department, salary FROM contract_employees
	LIMIT 5;

-- 20) Display total number of employees in each department (from both permanent and contract tables)  but show only those departments having total employees greater than 2.
	SELECT department,
       COUNT(*) AS total_employees
	FROM (
    SELECT department FROM employees
    UNION ALL
    SELECT department FROM contract_employees
	) AS combined
	GROUP BY department
	HAVING COUNT(*) > 2;