 -- case when clause 
 CREATE SCHEMA IF NOT EXISTS case_demo;
 USE case_demo;
 CREATE TABLE employees(
 emp_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 salary DECIMAL (10,2)
 );
 
 INSERT INTO employees( name, salary)
  VALUES ('Rahul', 55000),
 ('sneha', 45000),
 ('arjun', 80000),
 ('Rriya', 30000);
 
 -- Csse when for grade
 SELECT 
 name,
 salary,
 CASE
     WHEN salary >=70000 THEN 'High'
      WHEN salary >=50000 THEN 'Medium'
      ELSE 'Low'
      END AS salary_Grade 
      from employees;