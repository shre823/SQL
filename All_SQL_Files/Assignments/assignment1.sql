-- Question 1: Create a new database named  PracticeSet1 and switch to it.
  CREATE DATABASE PracticeSet1;
  USE PracticeSet1;

-- Question 2: Create a table named employees; with columns for employee ID, first name,last name, department, and salary.
   CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

	drop table employees;
    
-- Question 3: Insert one employee record (John Doe, Engineering, 75000.00) into the employees table.
   INSERT INTO employees (first_name, last_name, department, salary)
   VALUES ('John', 'Doe', 'Engineering', 75000.00);

-- Question 4: Insert multiple employee records (Jane, Michael, Emily) into the employees table in a single query.
    INSERT INTO employees (first_name, last_name, department, salary)
    VALUES 
    ('Jane', 'Smith', 'HR', 60000.00),
    ('Michael', 'Johnson', 'Engineering', 80000.00),
    ('Emily', 'Williams', 'Finance', 72000.00);
    
-- Question 5: Display all records from the employees table.
    SELECT * FROM employees;
    
-- Question 6: Add a new column named &quot;email&quot; to the employees table.
    ALTER TABLE employees
    ADD email VARCHAR(100);
    
-- Question 7: Update the email addresses of all existing employees.
    UPDATE employees SET email = 'john.doe@example.com' WHERE employee_id = 1;
	UPDATE employees SET email = 'jane.smith@example.com' WHERE employee_id = 2;
	UPDATE employees SET email = 'michael.johnson@example.com' WHERE employee_id = 3;
	UPDATE employees SET email = 'emily.williams@example.com' WHERE employee_id = 4;
    
-- Question 8: Add a column named &quot;year_of_experience&quot; after the &quot;last_name&quot; column.
    ALTER TABLE employees
	ADD year_of_experience INT
	AFTER last_name;
    
-- Question 9: Update the &quot;year_of_experience&quot; values for all employees.
	DESCRIBE employees;
	UPDATE employees
	SET year_of_experience = 2
	WHERE employee_id IS NOT NULL;
    
-- Question 10: Insert a new employee named &quot;David Brown&quot; into the HR department with a salary of 65000.00.
	INSERT INTO employees (first_name, last_name, department, salary)
	VALUES ('David', 'Brown', 'HR', 65000.00);
    
-- Question 11: Add a new column named &quot;hire_date&quot; with a default value of &#39;2024-01-01&#39;.
	ALTER TABLE employees
	ADD hire_date DATE DEFAULT '2024-01-01';	
    
-- Question 12: Insert a new employee named &quot;Sarah Davis&quot; into the Finance department with a custom hire date.
	INSERT INTO employees (first_name, last_name, department, salary, hire_date)
	VALUES ('Sarah', 'Davis', 'Finance', 72000.00, '2023-06-15');
    
-- Question 13: Rename the column &quot;department&quot; to &quot;dept_name&quot;.
	ALTER TABLE employees
	CHANGE department dept_name VARCHAR(50);
    
-- Question 14: Modify the data type of &quot;year_of_experience&quot; to DECIMAL(4,1).
	ALTER TABLE employees
	MODIFY year_of_experience DECIMAL(4,1);
    
-- Question 15: Temporarily disable SQL safe updates and increase the &quot;year_of_experience&quot; by 1 for all Engineering employees.
	SET SQL_SAFE_UPDATES = 0;
	UPDATE employees
	SET year_of_experience = year_of_experience + 1 WHERE dept_name = 'Engineering';
	SET SQL_SAFE_UPDATES = 1;
    
-- Question 16: Delete the record of the employee whose ID is 5.
	DELETE FROM employees
	WHERE employee_id = 5;
    
-- Question 17: Display all employees sorted by salary in descending order.
	SELECT * FROM employees
	ORDER BY salary DESC;
    
-- Question 18: Count the total number of employees in the table.
	SELECT COUNT(*) AS total_employees
	FROM employees;
    
-- Question 19: Display each department’s total staff, average salary, maximum salary, and minimum salary.
	SELECT dept_name,
    COUNT(*) AS total_staff,
    AVG(salary) AS average_salary,
    MAX(salary) AS maximum_salary,
    MIN(salary) AS minimum_salary
	FROM employees
	GROUP BY dept_name;
    
-- Question 20: Add a UNIQUE constraint on the &quot;email&quot; column to prevent duplicate email entries
	ALTER TABLE employees
	ADD CONSTRAINT unique_email UNIQUE (email);