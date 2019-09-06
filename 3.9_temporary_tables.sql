
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
