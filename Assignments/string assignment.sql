-- STRING FUNCTIONS Assignment

-- Q1: Create a new database named 'string_practice_lab' and switch to it.
	CREATE DATABASE string_practice_lab;
	USE string_practice_lab;

-- Q2: Create a table named 'employee_details' having columns:
-- id (INT AUTO_INCREMENT PRIMARY KEY),
-- emp_name (VARCHAR(50)),
-- department (VARCHAR(50)),
-- city (VARCHAR(50)).
	CREATE TABLE employee_details (
		id INT AUTO_INCREMENT PRIMARY KEY,
		emp_name VARCHAR(50),
		department VARCHAR(50),
		city VARCHAR(50)
	);

-- Q3: Insert at least 5 sample records containing different combinations of uppercase, lowercase, 
-- and spaces in employee names and cities.
	INSERT INTO employee_details (emp_name, department, city) VALUES
	('  anita Sharma', 'HR Manager', '  pune'),
	('RAHUL Patil', 'Tech Support', 'Mumbai '),
	('Neha Joshi', 'Finance Manager', ' Delhi'),
	('  AMIT KULKARNI ', 'Admin', 'Nagpur'),
	('Suresh Mane', 'Sales Manager', '  Bangalore ');

-- Q4: Retrieve all employee names combined with their department in a single column, separated by a hyphen.
	SELECT CONCAT(emp_name, '-', department) AS emp_department
	FROM employee_details;

-- Q5: Display each employee’s name prefixed with the text “Employee: ” before their name.
	SELECT CONCAT('Employee: ', emp_name) AS employee_name
	FROM employee_details;

-- Q6: For every record, display the name in uppercase form and the department in lowercase form.
	SELECT 
	UPPER(emp_name) AS name_upper,
	LOWER(department) AS dept_lower
	FROM employee_details;

-- Q7: Display the total number of characters present in each employee’s name.
	SELECT emp_name, CHAR_LENGTH(emp_name) AS total_characters
	FROM employee_details;

-- Q8: Extract and display only the first three characters of each employee’s department name.
	SELECT department, LEFT(department,3) AS first_three
	FROM employee_details;

-- Q9: Remove any extra spaces at the beginning or end of an employee name 
-- and display the cleaned version.
	SELECT emp_name, TRIM(emp_name) AS cleaned_name
	FROM employee_details;

-- Q10: Replace the word “Manager” with “Lead” wherever it appears in the department name.
	SELECT department,
	REPLACE(department,'Manager','Lead') AS updated_department
	FROM employee_details;

-- Q11: For all employee names, display only the first five characters and the last five characters in separate columns.
	SELECT 
	LEFT(emp_name,5) AS first_five,
	RIGHT(emp_name,5) AS last_five
	FROM employee_details;

-- Q12: Find the position of the substring “Tech” within each department name.
	SELECT department,
	LOCATE('Tech', department) AS position
	FROM employee_details;

-- Q13: Display all department names reversed from their original order.
	SELECT department,
	REVERSE(department) AS reversed_department
	FROM employee_details;

-- Q14: For each employee name, align it to the right by padding it with ‘#’ symbols up to a total length of 25 characters.
	SELECT LPAD(emp_name,25,'#') AS padded_name
	FROM employee_details;

-- Q15: For every city name, add extra spaces on the right until the total length becomes 20 characters.
	SELECT RPAD(city,20,' ') AS city_padded
	FROM employee_details;

-- Q16: Display both the character count and byte length of each department name.
	SELECT department,
	CHAR_LENGTH(department) AS character_count,
	LENGTH(department) AS byte_length
	FROM employee_details;

-- Q17: For each city name, show the text repeated twice in the same output column.
	SELECT city,
	REPEAT(city,2) AS repeated_city
	FROM employee_details;

-- Q18: Combine the words “Welcome” and “Team” with a gap of 4 spaces in between them.
SELECT CONCAT('Welcome','    ','Team') AS message;

-- Q19: Identify the position of the word “HR” in the following list: (‘Admin’, ‘Finance’, ‘HR’, ‘Tech’, ‘Sales’).
	SELECT FIELD('HR','Admin','Finance','HR','Tech','Sales') AS position;

-- Q20: From a comma-separated string of department names like 
-- “Admin,Finance,Tech,HR,Sales”, find the index position where “Tech” appears.
	SELECT FIND_IN_SET('Tech','Admin,Finance,Tech,HR,Sales') AS position;