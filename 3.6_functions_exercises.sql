-- Create a query for employees whose names start and end with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT(first_name, " ", last_name) as full_name
FROM employees
WHERE CONCAT(first_name, " ", last_name) like 'e%e';



SELECT UPPER(CONCAT(first_name, " ", last_name)) as full_name
FROM employees
WHERE CONCAT(first_name, " ", last_name) like 'e%e';



-- Query of employees born on Christmas and hired in the 90s, 
-- use datediff() to find how many days they have been working at the company 
--(Hint: You will also need to use NOW() or CURDATE())
SELECT DATEDIFF(now(), hire_date)
FROM employees
WHERE hire_date between '1990-01-01' AND '1999-12-31'
AND birth_date like '%12-25';


-- Find the smallest and largest salary from the salaries table.
SELECT min(salary) AS "Minimum Salary", max(salary) AS "Largest Salary"
FROM salaries;

-- +------------+------------+-----------+------------+
-- | username   | first_name | last_name | birth_date |
-- +------------+------------+-----------+------------+
-- | gface_0953 | Georgi     | Facello   | 1953-09-02 |
-- | bsimm_0664 | Bezalel    | Simmel    | 1964-06-02 |

-- Produce the username as a function of the first character of the first name, the first 4 characters of the last name, _, birth_month, last_2_of_birth_year

SELECT
    CONCAT(
        LOWER(SUBSTR(first_name, 1, 1)),
        LOWER(SUBSTR(last_name, 1, 4)),
        "_",
        SUBSTR(birth_date, 6,2),
        SUBSTR(birth_date, 3, 2)
    ) as username,
    first_name,
    last_name,
    birth_date
FROM employees;