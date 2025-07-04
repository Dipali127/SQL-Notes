-- employee table
USE temp;
CREATE TABLE employee(id INT PRIMARY KEY, emp_name VARCHAR(255), department VARCHAR(50),salary INT);
INSERT INTO employee(id, emp_name, department, salary)
VALUES
(1, "sumita", "HR", 223),
(2, "rima", "tech", 2256),
(3, "sima", "HR", 1243),
(4, "riya", "tech", 3342),
(5, "jiya", "HR", 1254);

SET SQL_SAFE_UPDATES = 0;
-- update the salary of employee where department is hr
UPDATE employee 
SET salary = 20000
WHERE department = "HR";
SELECT * FROM employee;
DELETE FROM employee
WHERE id = 1;
DROP TABLE employee;
--  counts only the rows where the department column is 'tech'
SELECT COUNT(*) FROM employee WHERE department = 'tech';
-- write a query to find all the employee that have their name starting from R
SELECT * FROM employee WHERE emp_name like 'R%'; 
SELECT DISTINCT salary FROM employee;
-- return maximum salaray among all salary 
SELECT MAX(salary) FROM employee;
-- return minimum salary among all salary
SELECT MIN(salary) FROM employee;
-- Write a query to return the second highest salary from employee table
SELECT MAX(salary) FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);
-- Write a query to return the nth highest salary in table
-- The nth highest salary is the “last” salary in the top n salaries when ordered from highest to lowest.
SELECT DISTINCT salary 
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;
-- Write a query to find the top 2 highest salaries from the table
SELECT salary FROM employee
ORDER BY salary DESC
LIMIT 2;
-- Write a query to calculate the total_salary and average_salary in a each department
-- First, the query groups the employees by their department, then for each department group, it calculates
-- the total salary (sum of all salaries) and the average salary of the employees in that department.
SELECT department, SUM(salary) AS total_salary, AVG(salary) As average_salary 
FROM employee
GROUP BY department;
-- Write a query to find the rows where a department has null values
SELECT * FROM employee
WHERE department IS NULL;
-- Write a query to find the duplicate rows in the employee table for column department.
-- It first groups the employees by their department using the GROUP BY clause, then counts the number of
-- employees in each department using COUNT(*),
-- and finally returns only those departments where the count of employees is greater than 1 using the HAVING clause.
SELECT department, COUNT(*)
FROM employee
GROUP by department
HAVING COUNT(*) > 1;




