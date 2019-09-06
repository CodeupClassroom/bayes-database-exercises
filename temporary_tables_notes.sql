-- use your own database where you have write access. Your number is the number in your login.
USE bayes_123;

CREATE TEMPORARY TABLE employee_salary AS 
	SELECT first_name, last_name, salary
	FROM employees.employees
	JOIN employees.salaries USING(emp_no);


CREATE TEMPORARY TABLE favorite_actors
	SELECT first_name
	FROM sakila.actors
	WHERE first_name LIKE '%ryan%'
	
select * 
from employee_salary;






-- table creation syntax (for permanent tables, remove the temporary keyword)
CREATE TEMPORARY TABLE captains (
    name VARCHAR(256) not null,
    ship VARCHAR(256) not null
);

-- How to add new records to a table
INSERT INTO captains (name, ship) VALUES ("Captain Ahab", "Pequad");

INSERT INTO captains (name, ship) VALUES 
	("Jean Luc Piccard", "USS Starship Enterprise NCC1701D"), 
	("James Tiberius Kirk", "USS Starship Enterprise NCC1701A");

SELECT * FROM captains;

-- If you ever need to delete a row or rows, create the select statement first.
SELECT * FROM captains WHERE name = "Captain Ahab";

-- Using the select to double check what you're going to delete
-- If you ever need to delete a row or rows, create the select statement first.
DELETE FROM captains WHERE name = "Captain Ahab";


CREATE TEMPORARY TABLE fruits (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(256) NOT NULL,
	primary key(id)
);

INSERT INTO fruits (name) VALUES ("Mango");
INSERT INTO fruits (name) VALUES ("Kiwi");

INSERT INTO fruits (name) VALUES 
	("Tangerine"),
	("Gala Apple"),
	("Banana");
	
SELECT * from fruits;
-- delete from fruits where name = "Tangerine";







-- Add a new column to the fruits temporary table named quantity and the datatype is positive integers
ALTER TABLE fruits ADD quantity INT UNSIGNED;

ALTER TABLE fruits DROP COLUMN id;

SELECT * from fruits;

-- syntax for updating an entire column
UPDATE fruits
SET quantity = 10;

SELECT * from fruits;

-- How to update a specific row's column value
UPDATE fruits
SET quantity = quantity * 10;

select * from fruits;

-- change gala apple to red apple
UPDATE fruits
SET name = "Red Apple"
WHERE name = "Gala Apple";

select * from fruits;
