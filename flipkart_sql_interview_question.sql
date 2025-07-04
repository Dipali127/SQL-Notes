CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(55),
    salary INT,
    department_id INT
);

INSERT INTO employee (id, name, salary, department_id)
VALUES 
    (1, 'joe', 7000, 1),
    (2, 'jim', 9000, 1),
    (3, 'henry', 8000, 2),
    (4, 'max', 9000, 1);

CREATE TABLE department (
    id INT,
    name VARCHAR(55)
);

INSERT INTO department (id, name)
VALUES 
    (1, 'it'),
    (2, 'sales');

-- problem:
-- Return the employee name, salary, and department id of the employee(s) who earn the highest salary in each department.

-- Since we have to select employee's name, salary and department id who earn maximum salary in each department id,
-- for this, first we have to find out the maximum salary in each department id from employee table because only 
-- employee's table gives the department id and employee salary information.
-- To solve this, I use 'self join' where I create an alias of the same employee table which returns a temporary table 
-- including the column department_id along with maximum salary in each department.
-- Now I can easily compare the employees who earn maximum salary in each department using that temporary table  
-- by comparing employee's salary and department_id with temporary table's maximum salary and department id.

SELECT e.name, e.salary, e.department_id 
FROM employee AS e
INNER JOIN (
    SELECT department_id, MAX(salary) AS max_salary 
    FROM employee 
    GROUP BY department_id
) AS d
ON e.department_id = d.department_id AND e.salary = d.max_salary;
