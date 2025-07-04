CREATE DATABASE ORGA;
SHOW DATABASES;
USE ORGA;

CREATE TABLE worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(25)
);

INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES
    (1, 'Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

CREATE TABLE bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000, '16-02-20'),
		(2, 3000, '16-06-11'),
		(3, 4000, '16-02-20'),
		(1, 4500, '16-02-20'),
		(2, 3500, '16-06-11');
	
CREATE TABLE title (
	WORKER_REF_ID INT,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (1, 'Manager', '2016-02-20 00:00:00'),
 (2, 'Executive', '2016-06-11 00:00:00'),
 (8, 'Executive', '2016-06-11 00:00:00'),
 (5, 'Manager', '2016-06-11 00:00:00'),
 (4, 'Asst. Manager', '2016-06-11 00:00:00'),
 (7, 'Executive', '2016-06-11 00:00:00'),
 (6, 'Lead', '2016-06-11 00:00:00'),
 (3, 'Lead', '2016-06-11 00:00:00');

 --                                             SQL QUERY
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 SELECT FIRST_NAME AS worker_name FROM worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 SELECT UPPER(FIRST_NAME) FROM worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT distinct department FROM worker;
SELECT DISTINCT(department) from worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME, 1, 3) FROM worker;
SELECT substr(FIRST_NAME, 1, 3) FROM worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
-- INSTR stands for "INSTRing" — short for "IN STRing" — meaning “position in string"
SELECT INSTR(first_name, 'B') FROM worker WHERE first_name = 'Amitabh';
--                                            OR
SELECT POSITION('b' IN first_name) AS position
FROM worker
WHERE first_name = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(first_name) FROM worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(department) FROM worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT department, LENGTH(department) FROM worker;
SELECT DISTINCT(department), Length(department) FROM worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(FIRST_NAME, 'a', 'A')  FROM worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME, ' ' ,LAST_NAME) AS COMPLETE_NAME FROM worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM worker
ORDER BY first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
 SELECT * FROM worker
 ORDER BY FIRST_NAME ASC, department DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM worker WHERE FIRST_NAME IN ('Vipul', 'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where first_name NOT IN ('Vipul', 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
 SELECT * FROM worker WHERE DEPARTMENT LIKE 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker where first_name LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
 SELECT * FROM worker WHERE FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
 SELECT * FROM worker WHERE FIRST_NAME LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;
--                                             OR
 SELECT * FROM worker WHERE salary >= 100000 AND salary <= 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2020.
 SELECT * FROM worker WHERE YEAR(JOINING_DATE) = 2020 AND MONTH(JOINING_DATE) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) AS count_admin_department 
FROM worker
WHERE department = 'Admin';
--                                   OR
SELECT COUNT(department) AS count_admin_department 
FROM worker
WHERE department = 'Admin';
 
-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS full_name, salary
FROM worker
WHERE salary BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT, COUNT(*) AS total_worker FROM worker
 GROUP BY DEPARTMENT
 ORDER BY total_worker DESC;
-- Here, COUNT(*) counts all workers in each department group, even if other columns are NULL.
-- Even if the department is NULL, it creates a group for that and includes it in the result.
-- But if we use COUNT(department), it excludes NULL values from the count.
-- The GROUP BY clause groups the rows based on the DEPARTMENT column, combining all rows with the same department
-- into a single group. Then, the COUNT(*) function counts the number of workers in each department.
-- Finally, the ORDER BY total_worker DESC clause sorts the result in descending order based on the worker count.

-- Q-24. Write an SQL query to print details of the Workers who are also Managers from title table.
SELECT * FROM worker AS w
INNER JOIN title AS t
ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles from title table.
SELECT WORKER_TITLE, COUNT(WORKER_TITLE) AS SAME_TITLE
FROM TITLE
GROUP BY WORKER_TITLE
HAVING COUNT(WORKER_TITLE) > 1;

-- Q-26. Write an SQL query to show only odd rows from a worker table.
-- select * from worker where MOD (WORKER_ID, 2) != 0; 
SELECT * FROM worker
WHERE WORKER_ID % 2 != 0;
--                                    OR
SELECT * FROM worker WHERE MOD (WORKER_ID, 2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM worker
WHERE WORKER_ID % 2 = 0;
--                              OR
SELECT * FROM worker WHERE MOD (WORKER_ID, 2) = 0;

-- Q-28. Write an SQL query to clone a new worker table from another worker table.
-- Physical Table (creates a new table with data copied from 'worker').
-- AS means: Create a new table named new_table that has the same columns and contains all the rows from the worker table.
CREATE TABLE new_worker AS
SELECT * FROM worker;

-- Virtual Table (creates a view, no data copied, just a stored query)
CREATE VIEW new_viewWorker AS
SELECT * FROM worker;

-- Note: When asked to create a clone of an existing table, 
-- create a physical table using CREATE TABLE AS SELECT statement.

-- Q-29. Write an SQL query to fetch intersecting records of both worker and new_worker tables.
SELECT w.* FROM worker AS w
INNER JOIN new_worker AS nw
ON w.WORKER_ID = nw.WORKER_ID;
-- NOTE:- w. before SELECT will remove the duplicate columns in both table while joining.

-- Q-30. Write an SQL query to show records from the worker table that the title table does not have.
-- We can achieve this using a left exclusive join.
-- First, the query returns all the rows from the worker table and matching rows from both tables.
-- But before returning the result, it filters out the records where WORKER_REF_ID in the title table is NULL.
-- This means it returns those workers who do not have a corresponding entry in the title table.
SELECT w.*
FROM worker AS w
LEFT JOIN title AS t
ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_REF_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
SELECT NOW();
SELECT CURRENT_DATE();
-- NOTE:-
-- CURDATE() returns only the current date in YYYY-MM-DD format.
-- NOW() returns the current date and time in YYYY-MM-DD HH:MM:SS format.

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM worker
ORDER BY salary DESC
LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM worker
ORDER BY salary DESC
LIMIT 1 OFFSET 4;
-- Note:-
-- ORDER BY salary DESC: Sorts salaries from highest to lowest.
-- OFFSET 4: Skips the top 4 records.
-- LIMIT 1: Then fetches 1 record, which is the 5th highest.

-- 1. General formula for finding the Nth Highest Salary (including duplicates):
SELECT * 
FROM worker
ORDER BY salary DESC
LIMIT 1 OFFSET N-1;
--  2. Nth Highest Unique Salary:
SELECT DISTINCT salary 
FROM worker
ORDER BY salary DESC
LIMIT 1 OFFSET N-1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT MAX(salary) AS fifth_highest_salary FROM worker
WHERE salary < (SELECT max(salary) FROM worker WHERE salary < 
    (SELECT max(salary) FROM worker WHERE salary < 
        (SELECT max(salary) FROM worker WHERE salary < 
            (SELECT max(salary) FROM worker)
        )
    )
);


-- Q-35. Write an SQL query to fetch the list of employees who share the same salary with someone else.
-- To find employees who have the same salary, I use the worker table twice by giving it two different names (w1 and w2).
-- Then, I look for rows where the salary is the same but the worker IDs are different. 
-- This way, I make sure not to match the same employee with themselves
SELECT w1.* from worker AS w1
inner join worker AS w2
ON w1.salary = w2.salary AND w1.WORKER_ID != w2.WORKER_ID;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT MAX(salary) AS second_highest_salary FROM worker
WHERE salary < (SELECT MAX(salary) FROM worker);

-- Q-37. Write an SQL query to show one row twice in results from a table(single table).
SELECT * FROM worker
UNION ALL
SELECT * FROM worker
ORDER BY WORKER_ID;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
-- using left exclusive join
-- First, the query returns all the rows from the worker table and matching rows from both tables.
-- But before returning the result, it filters out the records where WORKER_REF_ID in the bonus table is NULL.
-- This means it returns those workers who does not get any bonus in the bonus table.
SELECT worker_id FROM worker AS w
LEFT JOIN bonus AS b
ON w.worker_id = b.WORKER_REF_ID
WHERE b.WORKER_REF_ID IS NULL;

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM worker 
WHERE WORKER_ID <= (SELECT COUNT(*) / 2 FROM worker);
-- returns those workers whose WORKER_ID is less than or equal to half of the total number of workers.

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT department, COUNT(*) AS number_of_people 
FROM worker
GROUP BY department
HAVING COUNT(*) < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT department, COUNT(*) AS number_of_people 
FROM worker
GROUP BY department;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM worker
ORDER BY WORKER_ID DESC
LIMIT 1;

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM worker
LIMIT 1;


-- Q-44. Write an SQL query to fetch the last five records from a table.
SELECT * FROM (
    SELECT * FROM worker
    ORDER BY WORKER_ID DESC
    LIMIT 5
) AS last_five 
ORDER BY WORKER_ID ASC;
-- This will fetch the last 5 records based on WORKER_ID and then sort them back in ascending order.

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- here, first the subquery returns a temporary table d by grouping the workers by their department and selecting the 
-- maximum salary for each department.
-- Then, the outer query selects the FIRST_NAME, salary, and department from the worker table (aliased as w).
-- The two tables w and d are then joined using an INNER JOIN, which returns only the rows where both the department 
-- and salary match in tables w and d.
SELECT w.FIRST_NAME, w.salary, w.department FROM worker AS w 
INNER JOIN(
SELECT department, MAX(salary) AS max_salary FROM worker
GROUP BY department)AS d
ON w.department = d.department AND w.salary = d.max_salary;

-- Q-46. Write an SQL query to fetch the two highest salaries from the worker table
-- First, the query sorts the salaries of workers in descending order, then returns the top two highest salaries using 
-- the LIMIT clause.
SELECT salary
FROM worker
ORDER BY salary DESC
LIMIT 2;

-- Q-47. Write an SQL query to fetch three min salaries from a worker table
-- First, the query sorts the workers' salaries in ascending order and then returns the top three minimum salaries
-- using the LIMIT clause.
SELECT salary
FROM worker
ORDER BY salary ASC
LIMIT 3;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
-- First, the query, sort the salaries in descending order (to get highest salaries first).
-- Then use OFFSET 3 to skip the top 3 salaries (since OFFSET is 0-based).
-- Use LIMIT 1 to return just the 4th highest salary.
SELECT salary
FROM worker
ORDER BY salary DESC
LIMIT 1 OFFSET 3;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
-- first , the query groups the department that have same department into one using group by clause then compute sum of 
-- salaries given to each employee in that department.
SELECT department, SUM(salary) AS total_sum_for_each_department
FROM worker
GROUP BY department;

-- Q-50. Write an SQL query to fetch the name of worker who earn the highest salary.
-- First, the subquery finds the maximum salary among all the employees in the worker table.
-- Then, the outer query selects the FIRST_NAME of the workers whose salary is equal to the maximum salary.
SELECT FIRST_NAME from worker
WHERE salary = (SELECT MAX(salary) FROM worker);

--                                  OR
SELECT first_name FROM worker WHERE salary IN(SELECT MAX(salary) FROM worker);


