CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employee (
     employee_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(50) NOT NULL,
     last_name VARCHAR(50) NOT NULL,
     department VARCHAR(50),
     salary DECIMAL(10, 2)
     
);
DESCRIBE employee;
SELECT * FROM employee;

INSERT INTO employee (first_name, last_name, department, salary)
VALUES ('John' , 'Doe', 'Engineering ', 75000.00);

SELECT * FROM employee;


INSERT INTO employee(first_name, last_name, department, salary)
VALUES
	('John' , 'Doe', 'Marketing', 7500.00),
    ('Michael', 'Johnson', 'Sales', 7200.00),
    ('Emily', 'Williams', 'Engineering' , 8000.00);
    
SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN email VARCHAR(100);

DESCRIBE employee;
SELECT * FROM employee;

UPDATE employee SET email = 'john.doe@cpmpany.com' WHERE employee_id = 1;
UPDATE employee SET email = 'jane.smith@company.com' WHERE employee_id = 2;
UPDATE employee SET email = 'micheal.johnson@company.com' WHERE employee_id = 3;
UPDATE employee SET email = 'email.williams@company.com' WHERE employee_id = 4;


SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN year_of_experience INT AFTER last_name;


DESCRIBE employee;
select * from employee;
 
 UPDATE employee SET year_of_experience = 5 WHERE employee_id = 1; -- John
 UPDATE employee SET year_of_experience = 3 WHERE employee_id = 2; -- Janre
 UPDATE employee SET year_of_experience = 2 WHERE employee_id = 3; -- Michael
 UPDATE employee SET year_of_experience = 1 WHERE employee_id = 4; -- Emily 
 
 SELECT * FROM employee;

INSERT INTO employee (first_name, last_name, department, salary, email)
VALUES ('David', 'Brown', 'HR', 65000.00, 'david.brown@company.com');

SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN hire_date DATE DEFAULT '2024-01-01';

SELECT * FROM employee;

ALTER TABLE epmployee
CHANGE COLUMN department dept_name VARCHAR(50);

DESCRIBE employee;
SELECT * FROM employee;

ALTER TABLE employee
MODIFY COLUMN year_of_experience DECIMAL(4,1);

DESCRIBE employee;
SELECT * FROM employee;

SET SQL_SAFE_UPDATES = 0;   # when we use safe update mode we need to use where for add or insert 

UPDATE employee
SET year_of_experience = year_of_experience + 1
WHERE department = 'Engineering';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM employee;

DELETE FROM employee
WHERE employee_id = 5;

SELECT * FROM employee;

SELECT * FROM employee
ORDER BY salary DESC;

SELECT COUNT(*) AS total_employee FROM employee;

SELECT 
    department,
    COUNt(*) AS total_staff,
    AVG(salary) AS avg_salary,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary
FROM employee
GROUP BY department;

SELECT * FROM employee;

ALTER TABLE employee
ADD CONSTRAINT unique_email UNIQUE (email);

DESCRIBE employee;

SELECT * FROM employee;

COMMIT;

--  1: Display all records from the employees table.
SELECT * FROM employee;

-- 2: Show only the first_name and salary of all employees.
SELECT first_name,salary FROM employee;

-- 3 Display employees who work in the 'Engineering' department.
SELECT * FROM employee WHERE department = 'Engineering';

-- 4: Retrieve employees having salary greater than 70000.
SELECT * FROM employee WHERE salary > 70000;

-- 5 Display employees whose year_of_experience is more than 4 years.
SELECT * FROM employee WHERE year_of_experience >4;

-- 6 Retrieve all employee names in ascending order by their first_name.
SELECT first_name, salary FROM employee
ORDER BY first_name ASC; 

-- 7 Retrieve all employees ordered by salary in descending order.
SELECT * FROM employee
ORDER BY salary DESC;

 -- 9 Find total number of employees working in the company.
SELECT COUNT(*) AS total_employee
FROM employee; 

-- 10: Find the average salary of all employees
SELECT AVG(salary) AS avg_salary
from employee;

-- 11 Display the highest and lowest salary in the employee table
SELECT MAX(salary) AS highest_salary,
	   Min(salary) AS highest_salary from employee;
       
-- 12 count the number of employee in each department
SELECT COUNT(*) AS each_department from employee;

-- 13 show first_name, last_name, and email of employee who have more than 5 years of emperience
SELECT first_name,last_name email
from employee
WHERE year_of_experience >5;

-- 14 retruve employees who were hirded after '2024-01-01'
SELECT* from employee WHERE hire_date  >'2024-01-01';

-- 15 insert a new employee record into the table with your own values
DESCRIBE employee;
SELECT * FROM employee;

INSERT INTO employee (first_name, last_name, department, salary)
VALUES ('jane','smith', 'Manager', 30000);
SELECT * from employee;

-- 16 Update the salary of jane smith to 70000
DESCRIBE employee;
select * from employee WHERE employee_id = 70000;

-- 17 Update the department of michal johnson to makrketing
DESCRIBE employee;
select * from employee;
UPDATE employee 
SET department = 'marketing' WHERE employee_id = 3;

-- 18 delete the recordof the employee named ' DAvid brown'
DELETE from employee
WHERE employee_id= 9;

-- 19 add a new column named 'bonus of type DECIMal(10,2) to the deparment table

ALTER TABLE employee
ADD COLUMN bonus_of_type DECIMAL(10,2);
select * from employee;

-- 20 DISPLay only those employee whose email with '@comapany.com'
SELECT * FROM employee WHERE email = '@company.com';
select * from employee;