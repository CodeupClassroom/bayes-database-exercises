SELECT DISTINCT first_name
from employees;

select first_name
from employees
group by first_name;

select first_name, last_name
from employees
group by first_name DESC, last_name ASC;

select first_name, last_name
from employees
group by first_name DESC, last_name DESC;

select concat(first_name, " ", last_name) as full_name
from employees
group by full_name;

SELECT concat(first_name, " ", last_name) as full_name, count(*)
from employees
group by full_name
order by count(*) DESC;



