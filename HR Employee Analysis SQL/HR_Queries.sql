-- QUESTIONS
SELECT * FROM HR_copy;

-- Question 1. What is the gender breakdown of current employees in the company?
SELECT gender, count(*) as count
FROM HR_copy
WHERE term_date is NULL or termdate < CURDATE() and hiredate < CURDATE()
GROUP BY gender
ORDER BY count(*) desc;
-- ANS 1: Males: 10508, Females: 9570, Non-Conforming: 562

-- Question 2. What is the race/ethnicity breakdown of current employees in the company?
SELECT race, count(*) as count
FROM HR_copy
WHERE term_date is NULL or termdate < CURDATE() and hiredate < CURDATE()
GROUP BY race
ORDER BY count(*) desc;
-- ANS 2: White with the most at 5882, Native Hawaiian or Other Pacific Islander at the least 

-- Question 3. What is the age distribution of current employees in the company? Is there a difference between genders?
SELECT CASE
	WHEN age < 18 THEN '0-18'
    WHEN age >= 18 AND age <= 24 THEN '18-24'
	WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-44'
    WHEN age >= 45 AND age <= 54 THEN '45-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    WHEN age >= 65 THEN '65 and over'
    END AS age_group, gender,
    count(*) as count
FROM HR_copy
WHERE term_date is NULL or termdate < CURDATE() and hiredate < CURDATE()
GROUP BY age_group, gender
ORDER BY age_group, gender;
-- ANS 3: A bell curve distribution that is skewed to the left (younger age group), no substantial difference between genders 


-- Question 4. How many employees work at headquarters versus remote locations?
SELECT location, count(*) as count
FROM HR_copy
WHERE term_date is NULL or termdate < CURDATE() and hiredate < CURDATE()
GROUP BY location;
-- ANS 4: Headquarters: 15513, Remote: 5127

-- Question 5. What is the average length of employment for employees who have been terminated?
SELECT round(AVG(DATEDIFF(term_date, hire_date))/365, 1) AS duration
FROM HR_copy
WHERE term_date IS NOT NULL;
-- ANS 5: 10.4 years

-- Average length of employment for employees who have been terminated by age group
SELECT sub.age_group, round(AVG(DATEDIFF(sub.term_date, sub.hire_date))/365, 1) AS duration
FROM (
    SELECT CASE
        WHEN age < 18 THEN '0-18'
        WHEN age >= 18 AND age <= 24 THEN '18-24'
        WHEN age >= 25 AND age <= 34 THEN '25-34'
        WHEN age >= 35 AND age <= 44 THEN '35-44'
        WHEN age >= 45 AND age <= 54 THEN '45-54'
        WHEN age >= 55 AND age <= 64 THEN '55-64'
        WHEN age >= 65 THEN '65 and over'
		END AS age_group, term_date, hire_date
    FROM HR_copy
    WHERE term_date IS NOT NULL
) AS sub
GROUP BY sub.age_group
ORDER BY sub.age_group;
-- ANS: 18-24: 10.5 years, 25-34: 10.6 years, 35-44: 10.3 years, 45-54: 10.4 years, 55-64: 10.7 years

-- Question 6. How does the gender distribution vary across departments and job titles?
SELECT department, jobtitle, gender, COUNT(*) AS count
FROM HR_copy
GROUP BY department, jobtitle, gender
ORDER BY department, jobtitle, gender;
-- ANS 6: Male and Female roles across job titles are always higher than Non-Conforming

-- Question 7. What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS count, (COUNT(*) / (SELECT COUNT(*) FROM HR_copy)) * 100 AS percentage
FROM HR_copy
GROUP BY jobtitle
ORDER BY count DESC;
-- ANS 7: Top 3 are Research Assistant II, Business Analyst, Human Resources Analyst II, Lowest is Assistant Professor

-- Question 8. Which department has the highest turnover rate?
SELECT department, COUNT(*) AS total_emp,
    SUM(CASE WHEN term_date IS NOT NULL THEN 1 ELSE 0 END) AS term_emp,
    (SUM(CASE WHEN term_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS turnover_rate
FROM HR_COPY
GROUP BY department
ORDER BY turnover_rate DESC;
-- ANS 8: Auditing has the highest turnover rate at 23%

-- Question 9. What is the distribution of current employees across locations by city and state?
SELECT location_city, location_state, COUNT(*) as count, (count(*)/(SELECT count(*) FROM HR_copy)) * 100 as percentage
FROM HR_copy
WHERE term_date IS NULL
GROUP BY locatioN_city, location_state
ORDER BY percentage desc;
-- ANS 9: Cleveland Ohio has 62% of the employees, while Frankfort Kentucky has 0.03%. Second highest was Chicago Illinois at 1.3%

-- Question 10. How has the company's employee count changed over time based on hire and term dates?
SELECT hire_year, hired_count, termed_count, net_count, 
	SUM(net_count) OVER (ORDER BY hire_year) AS running_total
FROM (
	SELECT DATE_FORMAT(date_period, '%Y') AS hire_year,
		   SUM(hired_count) AS hired_count,
		   SUM(termed_count) AS termed_count,
		   SUM(hired_count) - SUM(termed_count) AS net_count
	FROM (
		SELECT hire_date AS date_period, COUNT(*) AS hired_count, 0 AS termed_count
		FROM HR_COPY
		GROUP BY hire_date
		UNION ALL
		SELECT term_date AS date_period, 0 AS hired_count, COUNT(*) AS termed_count
		FROM HR_COPY
		WHERE term_date IS NOT NULL
		GROUP BY term_date
		) as result
	WHERE DATE_FORMAT(date_period, '%Y') <= DATE_FORMAT(CURDATE(), '%Y')
	GROUP BY hire_year
	ORDER BY hire_year
	) as result1
ORDER BY hire_year;
-- ANS 10: Employee count has increased until 2021 when hiring stopped

-- Question 11. What is the tenure distribution for each department?
SELECT department, round(avg(tenure)/365, 1) as avg_tenure
FROM (
	SELECT department,
		CASE
			WHEN term_date IS NULL THEN DATEDIFF(CURDATE(), hire_date)
			ELSE DATEDIFF(term_date, hire_date)
			END AS tenure
	FROM HR_copy
	ORDER BY department
	) as result
GROUP BY department
ORDER BY avg_tenure desc;
-- ANS 11: Auditing with highest at 12.8 years, Legal with lowest at 11.6 years 