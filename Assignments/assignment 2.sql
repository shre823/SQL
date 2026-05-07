-- 1) Create a new schema named select_practice; and make it active for use.
	CREATE DATABASE select_practice;
	USE select_practice;

-- 2) Create a table named employees; with columns: emp_id (auto increment), first_name,last_name, department, salary (decimal), and joining_date (date).
	CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

-- 3) Insert at least five records into the employees; table with sample data representing different departments and joining dates.
	INSERT INTO employees (first_name, last_name, department, salary, joining_date)
	VALUES
	('John', 'Doe', 'Engineering', 75000.00, '2021-05-10'),
	('Jane', 'Smith', 'HR', 60000.00, '2022-03-15'),
	('Michael', 'Johnson', 'Finance', 72000.00, '2020-11-20'),
	('Emily', 'Williams', 'Marketing', 68000.00, '2023-01-05'),
	('David', 'Brown', 'Engineering', 80000.00, '2019-07-25');

-- 4) Display all records from the employees; table using the SELECT statement.
	SELECT * FROM employees;

-- 5) Display only first_name, last_name, and salary columns from the employees table.
	SELECT first_name, last_name, salary FROM employees;

-- 6) Display first_name and last_name with column aliases as First Name; and Last Name;.
	SELECT first_name AS 'First Name',
		   last_name AS 'Last Name'
	FROM employees;

-- 7) Concatenate first_name and last_name to form a new column named Full Name; and display it along with department name.
	SELECT CONCAT(first_name, ' ', last_name) AS 'Full Name',department
	FROM employees; -- concat use to join last and first name 

-- 8) Select first_name along with a static value Active Employee; as a new column name Status;.
	SELECT first_name,'Active Employee' AS Status
	FROM employees;

-- 9) Retrieve first_name, salary, and calculate 10% bonus using the ROUND() function -- with an alias ;Bonus;.
	SELECT first_name,
       salary,
       ROUND(salary * 0.10, 2) AS Bonus
	FROM employees;

-- 10) Display the department names in uppercase letters using the UPPER() function.
	SELECT UPPER(department) AS Department
	FROM employees;

-- 11) Retrieve only unique department names using the DISTINCT keyword.
	SELECT DISTINCT department FROM employees;

-- 12) Create a new schema named &#39;where_practice; and make it active for use.
	CREATE DATABASE where_practice;
	USE where_practice;

-- 13) Create a table named customers; with columns: cust_id (auto increment), name, city,age, purchase_amount, and last_purchase_date.
	CREATE TABLE customers (
    cust_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT,
    purchase_amount DECIMAL(10,2),
    last_purchase_date DATE
);


-- 14) Insert at least five customer records with different cities, ages, and purchase amounts.
	INSERT INTO customers (name, city, age, purchase_amount, last_purchase_date)
	VALUES
	('Amit', 'Pune', 28, 1200.00, '2023-01-10'),
	('Priya', 'Mumbai', 35, 2000.00, '2023-02-15'),
	('Anjali', 'Delhi', 40, 1800.00, '2023-03-20'),
	('Rahul', 'Pune', 22, 900.00, '2023-04-05'),
	('Arjun', 'Mumbai', 30, 2500.00, '2023-05-12');

-- 15) Retrieve all customers who belong to the city Pune.
	SELECT * FROM customers
	WHERE city = 'Pune';

-- 16) Retrieve all customers whose age is greater than 30.
	SELECT * FROM customers
	WHERE age > 30;

-- 17) Retrieve customers who belong to Mumbai; and have age greater than 25.
	SELECT * FROM customers
	WHERE city = 'Mumbai' AND age > 25;

-- 18) Retrieve customers who belong to Pune; OR have a purchase_amount greater than 1500.
	SELECT * FROM customers
	WHERE city = 'Pune' OR purchase_amount > 1500;

-- 19) Retrieve customers whose age is between 25 and 40 using the BETWEEN operator.
	SELECT * FROM customers
	WHERE age BETWEEN 25 AND 40;

-- 20) Retrieve all customers whose name starts with the letter A; using the LIKE operator.
	SELECT * FROM customers
	WHERE name LIKE 'A%';

-- 21) Retrieve all customers who live in either Pune or Delhi using the IN operator.
	SELECT * FROM customers
	WHERE city IN ('Pune', 'Delhi');

-- 22) Retrieve all customers who do NOT live in Mumbai using the NOT operator.
	SELECT * FROM customers
	WHERE city NOT IN ('Mumbai');

-- 23) Retrieve customers whose purchase_amount is NOT NULL.
	SELECT * FROM customers
	WHERE purchase_amount IS NOT NULL;
	USE select_practice;
    
-- 24) Retrieve all employees who joined before the year 2022.
	SELECT * FROM employees
	WHERE YEAR(joining_date) < 2022;
    
-- 25) Retrieve all employees whose salary is greater than or equal to 60000.
	SELECT * FROM employees
	WHERE salary >= 60000;