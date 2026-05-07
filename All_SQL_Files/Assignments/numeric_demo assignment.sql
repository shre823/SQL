-- PRACTICAL BASED QUESTIONS ON NUMERIC FUNCTIONS

-- Q1: Create a new database named 'numeric_practice_lab' and switch to it.
	CREATE DATABASE numeric_practice_lab;
	USE numeric_practice_lab;

-- Q2: Create a table named 'calculation_data' having fields:
-- id (INT AUTO_INCREMENT PRIMARY KEY),
-- value1 (DECIMAL(10,4)),
-- value2 (DECIMAL(10,4)).
	CREATE TABLE calculation_data (
		id INT AUTO_INCREMENT PRIMARY KEY,
		value1 DECIMAL(10,4),
		value2 DECIMAL(10,4)
	);

-- Q3: Insert at least 5 records in the table with both positive and negative decimal values.
	INSERT INTO calculation_data (value1, value2) VALUES
	(12.4567, 3.5678),
	(-8.3456, 2.1111),
	(5.7890, -4.2222),
	(-9.8765, -3.3333),
	(0.0000, 6.5555);

-- Q4: Display all the data from the table to verify the inserted values.
	SELECT * FROM calculation_data;

-- Q5: Display each value from 'value1' along with its non-negative equivalent form.
	SELECT value1, ABS(value1) AS non_negative_value
	FROM calculation_data;

-- Q6: For each 'value1', show a new column that indicates whether the number is positive, negative, or zero.
	SELECT value1,
	CASE
		WHEN value1 > 0 THEN 'Positive'
		WHEN value1 < 0 THEN 'Negative'
		ELSE 'Zero'
	END AS number_type
	FROM calculation_data;

-- Q7: For every record, display the remainder obtained when 'value1' is divided by 'value2'.
	SELECT value1, value2, MOD(value1, value2) AS remainder
	FROM calculation_data;

-- Q8: Display each 'value1' in three forms — 
-- the original number, its value limited to two decimal places without rounding, 
-- and its whole number form without decimals.
	SELECT 
	value1 AS original,
	TRUNCATE(value1,2) AS two_decimal_no_round,
	TRUNCATE(value1,0) AS whole_number
	FROM calculation_data;

-- Q9: For each record, round 'value2' to two decimal points and to the nearest integer separately.
	SELECT 
	value2,
	ROUND(value2,2) AS round_two_decimal,
	ROUND(value2) AS nearest_integer
	FROM calculation_data;

-- Q10: Show each 'value1' and display the smallest integer that is greater than or equal to it 
-- and also the largest integer that is less than or equal to it.
	SELECT 
	value1,
	CEILING(value1) AS smallest_integer_greater_equal,
	FLOOR(value1) AS largest_integer_less_equal
	FROM calculation_data;

-- Q11: For each record, find the square of 'value1' and also compute the exponential value of (value1 divided by 5).
	SELECT 
	value1,
	POW(value1,2) AS square_value1,
	EXP(value1/5) AS exponential_value
	FROM calculation_data;

-- Q12: Display the natural logarithm and base 10 logarithm of the positive magnitude of 'value1'.
	SELECT 
	value1,
	LN(ABS(value1)) AS natural_log,
	LOG10(ABS(value1)) AS log_base10
	FROM calculation_data
	WHERE value1 != 0;

-- Q13: Convert all 'value1' values into their radian equivalents 
-- and convert all 'value2' values into their degree equivalents.
	SELECT 
	value1,
	RADIANS(value1) AS value1_radians,
	value2,
	DEGREES(value2) AS value2_degrees
	FROM calculation_data;

-- Q14: Display the sine, cosine, and tangent values for each 'value1'.
	SELECT 
	value1,
	SIN(value1) AS sine_value,
	COS(value1) AS cosine_value,
	TAN(value1) AS tangent_value
	FROM calculation_data;

-- Q15: For a fixed input of 0.7, display its inverse sine, inverse cosine, and inverse tangent values.
	SELECT 
	ASIN(0.7) AS inverse_sine,
	ACOS(0.7) AS inverse_cosine,
	ATAN(0.7) AS inverse_tangent;

-- Q16: Add a new record where both numbers are negative. 
-- Then, display all numbers with their positive equivalent magnitude values.
	INSERT INTO calculation_data (value1, value2)
	VALUES (-7.6543, -2.3456);

	SELECT 
	value1,
	value2,
	ABS(value1) AS value1_positive,
	ABS(value2) AS value2_positive
	FROM calculation_data;

-- Q17: Display each record’s 'value1' rounded to 1, 2, and 3 decimal places in three separate columns.
	SELECT 
	value1,
	ROUND(value1,1) AS round_1_decimal,
	ROUND(value1,2) AS round_2_decimal,
	ROUND(value1,3) AS round_3_decimal
	FROM calculation_data;

-- Q18: For all entries, calculate the result of (value1 squared) + (value2 squared) 
-- and name that column as 'combined_square'.
	SELECT 
	value1,
	value2,
	POW(value1,2) + POW(value2,2) AS combined_square
	FROM calculation_data;

-- Q19: Find the difference between the upper integer limit and lower integer limit 
-- for each 'value1' and label it as 'integer_gap'.
	SELECT 
	value1,
	CEILING(value1) - FLOOR(value1) AS integer_gap
	FROM calculation_data;

-- Q20: For each record, compute the ratio of 'value1' to 'value2' 
-- and round the result to two decimal places before displaying.
	SELECT 
	value1,
	value2,
	ROUND(value1/value2,2) AS ratio_result
	FROM calculation_data;