-- HISTORIC SALARY Z_SCORE

SELECT avg(salaries.salary) AS avg, stddev(salaries.salary) AS stddev
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)

-- historic Average salary is 63805
-- historic standard deviation is 16900

CREATE TEMPORARY TABLE historic AS 
	select departments.dept_name, avg(salaries.salary) as department_average
		from salaries
		join dept_emp using(emp_no)
		join departments using(dept_no)
		group by departments.dept_name;

alter table historic ADD average FLOAT;
alter table historic ADD stddev FLOAT;

UPDATE historic
SET average = 63805, stddev = 16900;

alter table historic ADD salary_z_score FLOAT;

update historic
set salary_z_score = (department_average - average) / stddev;

select dept_name, salary_z_score from historic;

-- Customer Service	    -0.297907
-- Development	        -0.255982
-- Finance	            0.395525
-- Human Resources	    -0.486989
-- Marketing	        0.479775
-- Production	        -0.248492
-- Quality Management	-0.387795
-- Research	            -0.24496
-- Sales	            0.997787



-- CURRENT SALARY Z_SCORE
SELECT avg(salaries.salary) AS avg, stddev(salaries.salary) AS stddev
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE dept_emp.to_date > now()
and salaries.to_date > now();

-- Average = 72012.2359
-- Standard deviation = 17310

CREATE TEMPORARY TABLE current AS 
	select departments.dept_name, avg(salaries.salary) as department_average
		from salaries
		join dept_emp using(emp_no)
		join departments using(dept_no)
		where dept_emp.to_date > now()
		and salaries.to_date > now()
		group by departments.dept_name;

alter table current ADD average FLOAT;
alter table current ADD stddev FLOAT;

UPDATE current
SET average = 72012.2359, stddev = 17310;

alter table current ADD salary_z_score FLOAT;

update current
set salary_z_score = (department_average - average) / stddev;

select dept_name, salary_z_score from current;

-- Customer Service	    -0.273079
-- Development	        -0.251549
-- Finance	            0.378261
-- Human Resources	    -0.467379
-- Marketing	        0.464854
-- Production	        -0.24084
-- Quality Management	-0.379563
-- Research	            -0.236791
-- Sales	            0.972891






--  Other approaches from Ada walkthroughs:

-- Option 1 from https://github.com/CodeupClassroom/ada-database-exercises/blob/master/temp_tables_exercise.sql produces:
-- Customer Service	-0.2912128350369325
-- Development	-0.25110467869030373
-- Finance	0.38317080372805445
-- Human Resources	-0.47471019840824263
-- Marketing	0.4623032332955057
-- Production	-0.2409183690966711
-- Quality Management	-0.3830264477448974
-- Research	-0.23567480072114852
-- Sales	0.9722682040535907

-- Option 2 from https://github.com/CodeupClassroom/ada-database-exercises/blob/master/temp_tables_exercise.sql produces:
-- Customer Service	    -0.2912128325705482
-- Development      	-0.2511046762239239
-- Finance	            0.38317080619444155
-- Human Resources	    -0.474710195941862
-- Marketing	        0.462303235761892
-- Production	        -0.24091836663028918
-- Quality Management	-0.38302644527851315
-- Research	            -0.2356747982547655
-- Sales	            0.97226820651997