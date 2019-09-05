-- Day 1 select statments
use sakila;
SELECT * FROM actor;
SELECT last_name,first_name FROM actor;
SELECT * FROM actor WHERE last_name='Cage';
SELECT last_name AS last, first_name AS first FROM actor;
SELECT * FROM actor WHERE actor_id=6;
select * from actor where last_update = '2006-02-15 04:34:33';

-- Day 2 clauses
USE sakila;
SELECT * FROM film;
SELECT * FROM film WHERE rating LIKE 'PG%';
SELECT * FROM film WHERE replacement_cost BETWEEN 18.99 AND 20.99;
SELECT DISTINCT release_year,rating FROM film;

-- AND/OR logic
SELECT *  FROM payment WHERE (rental_id>1000 AND staff_id=1) OR amount<5.99;
SELECT * FROM payment;

-- or is equivalent to using 'in' operator
SELECT * FROM customer WHERE first_name IN ('BARBARA','JOAQUIN','SANDRA');
SELECT * FROM customer WHERE first_name='BARBARA' OR first_name='JOAQUIN' OR first_name='SANDRA';

-- order by/limit
SELECT *  FROM payment WHERE (rental_id>1000 AND staff_id=1) OR amount<5.99
ORDER BY amount DESC, staff_id ASC LIMIT 10 OFFSET 10
;

-- functions
SELECT CONCAT(title,' ',rating),SUBSTR(release_year,3,2),UPPER(description) FROM film;
SELECT REPLACE(release_year,SUBSTR(release_year,1,2),'') FROM film;
SELECT UNIX_TIMESTAMP(CURDATE()), UNIX_TIMESTAMP(last_update)
FROM film;
SELECT UNIX_TIMESTAMP();
SELECT CAST(rental_rate AS CHAR) from film;

-- group by/aggregation functions
SELECT rental_rate, rating FROM film
GROUP BY rental_rate,rating;

SELECT COUNT(*) FROM film;
SELECT rating,COUNT(rating) FROM film WHERE rating LIKE 'PG%' GROUP BY rating;
SELECT rating,COUNT(*) from film  GROUP BY rating ORDER BY COUNT(*) DESC

