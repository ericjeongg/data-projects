-- CREATE DATABASE projects;
Use projects;

drop table HR_copy;

-- Create a copy of original table to manipulate and do analysis on
create table HR_copy AS
	SELECT * FROM HR;

-- Rename column from 'ï»¿id' to emp_id
ALTER TABLE HR_copy
RENAME COLUMN ï»¿id to emp_id;
-- Rename hire_date to hiredate to follow existing format
ALTER TABLE HR_copy
RENAME COLUMN hire_date to hiredate;
    
-- Convert birthdate to DATE type and store in birth_date
-- Create new birth_date column
ALTER TABLE HR_copy
ADD COLUMN birth_date DATE;
-- To fix safe update mode error
SET SQL_SAFE_UPDATES = 0;
UPDATE HR_copy
SET birth_date = CASE
	-- Converting dates with formate '1/20/2022'
    WHEN birthdate LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
	-- Converting dates with format '01-20-22'
	WHEN birthdate LIKE '__-__-__' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%y'), '%Y-%m-%d') 
    ELSE NULL
END;
-- Fix the two-digit year conversion issue (1966 -> 2066)
UPDATE HR_copy
SET birth_date = DATE_SUB(birth_date, INTERVAL IF(YEAR(birth_date) > YEAR(CURDATE()), 100, 0) YEAR);

-- Convert hiredate to DATE type and store in hire_date
-- Create new hire_date column
ALTER TABLE HR_copy
ADD COLUMN hire_date DATE;
UPDATE HR_copy
SET hire_date = CASE
	-- Converting dates with formate '1/20/2022'
    WHEN hiredate LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(hiredate, '%m/%d/%Y'), '%Y-%m-%d')
	-- Converting dates with format '01-20-22'
	WHEN hiredate LIKE '__-__-__' THEN DATE_FORMAT(STR_TO_DATE(hiredate, '%m-%d-%y'), '%Y-%m-%d') 
    ELSE NULL
END;
-- Fix the two-digit year conversion issue (1966 -> 2066)
UPDATE HR_copy
SET hire_date = DATE_SUB(hire_date, INTERVAL IF(YEAR(hire_date) > YEAR(CURDATE()), 100, 0) YEAR);

-- Convert termdate to DATE type and store in term_date
-- Create new term_date column
ALTER TABLE HR_copy
ADD term_date DATE;
UPDATE HR_copy
SET term_date = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL and termdate != '';

-- Add age column
ALTER TABLE HR_copy
ADD COLUMN age INT;
UPDATE HR_copy
SET age = TIMESTAMPDIFF(YEAR, birth_date, CURDATE());
SET SQL_SAFE_UPDATES = 1;
    
SELECT * FROM HR_copy;
