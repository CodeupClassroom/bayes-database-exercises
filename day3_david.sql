USE david;
CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

SELECT * FROM users;
SELECT * FROM roles;

SELECT u.name as user_name, r.name as role_name
FROM users as u
JOIN roles as r ON u.role_id = r.id;

-- left join example
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- right join
SELECT users.name AS user_name, roles.name AS role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

-- employees example
USE employees;
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

USE sakila;
SHOW CREATE TABLE rental;

-- join example to find the movie name starting at the payment table
USE sakila;
SELECT
f.film_id,
f.title
FROM payment AS p
JOIN rental AS r
ON(p.rental_id=r.rental_id)
JOIN inventory AS i
ON (r.inventory_id=i.inventory_id)
JOIN film AS f
ON (i.film_id=f.film_id);

-- subquery curriculum example
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;


-- find the title of movies that are at our second location(optional only at second location)
USE sakila;
SELECT title 
FROM film
WHERE film_id IN (
SELECT film_id FROM inventory WHERE store_id=2)
-- AND film_id NOT IN(SELECT film_id FROM inventory WHERE store_id=1)
