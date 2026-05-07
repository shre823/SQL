CREATE DATABASE if NOT EXISTS string_functions_extended;
USE string_functions_extended;

CREATE TABLE sample_texts(
 id INT AUTO_INCREMENT PRIMARY KEY,
 text_value VARCHAR(100)
 );
 
 INSERT INTO sample_texts( text_value) VALUES
 ('   MYSQL String Functions    '),
 ('hello word'),
 ('DATA ANALYSIS'),
 ('database managment system'),
 ('OpenAI GPT Models'),
 ('MYSQL Workbench Practice');
 
 SELECT * FROM sample_texts;
  -- extract first 5 charactoers
 SELECT text_value, LEFT(text_value, 5) AS first_five_chars
 from sample_texts;
 
 -- extract last 6 charactoers
SELECT text_value, RIGHT(text_value, 6) AS first_six_chars
 from sample_texts;
 
 -- using LOCATE()
 SELECT text_value, LOCATE('SQL', text_value) AS position_SQL
 from sample_texts;
 
 -- using INSTR() (same as LOCATE)
 SELECT text_value, INSTR(text_value, 'data') AS position_data
  from sample_texts;

SELECT text_value, POSITION( 'AI' IN text_value ) AS position_AI
  from sample_texts;
  
SELECT text_value, REVERSE(text_value) AS reverse_text
  from sample_texts;

-- left pad string to length 25 with;'"'
SELECT text_value, LPAD( text_value, 25, '*' ) AS left_padded
  from sample_texts;
  
-- left pad string to length 25 with;'#'
SELECT text_value, RPAD( text_value, 30, '#' ) AS gight_padded
  from sample_texts;

SELECT 
text_value,
LTRIM(text_value) AS left_trimmed,
RTRIM(text_value) AS right_trimmed
 from sample_texts;
 
SELECT 
text_value,
CHAR_LENGTH(text_value) AS character_count,
LENGTH(text_value) AS byte_length
 from sample_texts;
 
 SELECT text_value, REPEAT(text_value, 2) AS repeated_twice
  from sample_texts;
  
SELECT CONCAT('MYSQL', SPACE(5), 'Database') AS spaced_string; -- cocat 1 string

-- FIELD() returns the positin of the string in the list
SELECT FIELD('Data', 'MYSQL', 'DATA', 'ANALYSIS') AS position_of_data;

-- find_in_set() search a string within a comma-seprated list
SELECT FIND_IN_SET('GPT','SQL,DATA,GPT,MODEL<MYSQL') AS position_of_data;

SELECT ELT(3, 'first', 'second', 'Third', 'Fourth') AS third_value;

-- exmaple binary 5= 0101 (position 1 and 3)
SELECT MAKE_SET(5,'A', 'B','C', 'D') AS formatted_date;

-- sytanx insert(original , position, lengthh_into_replace, new_text)
SELECT INSERT('MYSQL Database', 7,8, 'Workbench') AS modified_text;

SELECT CONCAT_WS('-','2025', '11', '22') AS formatted_date;
SELECT CONCAT_WS('| ' ,'MYSQL', 'String', 'Functions') AS joined_text;

SELECT 
SUBSTRING_INDEX('www.mysql.com','.',1) AS befor_first_dot,
SUBSTRING_INDEX('www.mysql.com','.',-1) AS befor_last_dot;

SELECT QUOTE('Hello "World" and It\'s SQL!') AS quoted_text;

SELECT CONVERT('123' "World" USING utf8mb4) AS coverted_utf8;

-- cast string to integer 
SELECT CAST('456'  AS SIGNED) + 44 AS numeric_addition;