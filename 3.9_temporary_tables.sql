
-- EXERCISE 1
-- Create the employees_with_departments table.
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
-- Update the table so that full name column contains the correct data
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table?
USE employees;

CREATE TEMPORARY TABLE employees_with_departments AS
	SELECT first_name, last_name, dept_name, dept_no
	FROM employees
	JOIN dept_emp USING(emp_no);

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

UPDATE employees_with_departments
SET full_name = concat(first_name, " ", last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
 	
SELECT * FROM employees_with_departments;


-- EXERCISE 2
-- Create a temporary table based on the payment table from the sakila database.
-- Write SQL to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

USE sakila;

CREATE TEMPORARY TABLE hundreds_of_pennies AS
	SELECT amount from payment;

ALTER TABLE hundreds_of_pennies ADD hundred_pennies INT;

UPDATE hundreds_of_pennies
SET hundred_pennies = amount * 100;

SELECT * from hundreds_of_pennies;


-- EXERCISE 3
-- Find out how the average pay in each department compares to the overall average pay. 
-- Use the Z-score for salaries. In terms of salary, what is the best department to work for? The worst?
-- +--------------------+-----------------+
-- | dept_name          | salary_z_score  | 
-- +--------------------+-----------------+
-- | Customer Service   | -0.065641701345 | 
-- | Development        | -0.060466339473 | 
-- | Finance            | 0.090924841177  |

-- Generate a temporary table holding the current salary average and standard deviation
CREATE TEMPORARY TABLE salary_avg_stddev AS 
	SELECT avg(salaries.salary) AS avg, stddev(salaries.salary) AS stddev
	FROM departments
	JOIN dept_emp USING(dept_no)
	JOIN salaries USING(emp_no)
	WHERE salaries.to_date > NOW()
	AND dept_emp.to_date > NOW()

SELECT * from salary_avg_stddev;
-- Company average salary = 72012
-- Company standard deviation = 17310

CREATE TEMPORARY TABLE dept_average_salaries AS 
	select departments.dept_name, avg(salaries.salary) as department_average
	from salaries
	join dept_emp using(emp_no)
	join departments using(dept_no)
	where salaries.to_date > now()
	and dept_emp.to_date > now()
	group by departments.dept_name;


alter table dept_average_salaries ADD average FLOAT;
alter table dept_average_salaries ADD stddev FLOAT;

UPDATE dept_average_salaries
SET average = 72012, stddev = 17310;

SELECT * from dept_average_salaries;

-- add the zscore column
alter table dept_average_salaries add zscore float;

-- Populate the z-score column
UPDATE dept_average_salaries
SET zscore = (department_average - average) / stddev;

SELECT * from dept_average_salaries;