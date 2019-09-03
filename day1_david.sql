use sakila;
SELECT * FROM actor;
SELECT last_name,first_name FROM actor;
SELECT * FROM actor WHERE last_name='Cage';
SELECT last_name AS last, first_name AS first FROM actor;
SELECT * FROM actor WHERE actor_id=6;
select * from actor where last_update = '2006-02-15 04:34:33'