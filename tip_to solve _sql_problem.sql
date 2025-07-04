-- Tip: When to consider one table as twice?
-- When you're comparing a row to other rows of the same table — it's time to use a self-join.
-- And when you do a self-join, always use table aliases.
-- For example:
-- worker A — refers to the current row in the worker table.
-- worker B — refers to another row in the same table you're comparing it to.

-- That means:
-- worker B iterates through all other rows of the worker table except the current row pointed to by worker A, and 
-- compares them based on the condition(such as has the same salary, or has a lower salary ).
-- Whichever worker meets the condition (e.g., has the same salary, or has a lower salary), is included in the result set.
--Then worker A moves to the next row, and worker B again iterates through all other rows except the current worker A,
-- and so on.

-- Difference Between Self-Join and Self Cross Join:

--  Self-Join:
-- Used when you're comparing one row with another row of the same table **with a condition**.
-- Typical use cases include:
--    - Finding duplicates or matching on values
--    - Comparing rows with other rows in the same table (e.g., by department or salary)

--  Self Cross Join:
-- Used when you're comparing one row with another row of the same table **without any condition**.
-- This creates a Cartesian product, meaning every row from the table is joined with every other row (including itself).
-- Rarely used directly unless you specifically want all possible combinations.

-- Example:
SELECT *
FROM worker A
CROSS JOIN worker B;

-- Note:
-- At the beginning of a self-join, it may seem like a cross join is happening,
-- but the condition in the ON clause filters the result, turning it into a meaningful self-join.

-- problems under self join:
-- (1) Finding duplicates or matching on values
-- Problem: “Find all employees who share the same salary with someone else.”
-- This means you have to find those employees from the worker table where two or more employees have the same salary.
-- Example:-
SELECT A.first_name, A.salary
FROM worker as A
inner join worker as B
ON A.salary = B.salary AND A.worker_id != B.worker_id;

-- (2) Comparing rows with other rows in the same table
-- Problem: “Find employees who earn more than other employees in the same department.”
-- This means you're comparing one employee with all others in the same department.
-- This is a self-join, because in this query you're comparing one employee’s salary with the salaries of other 
-- employees in the same department
-- You include that employee in the result set if they earn more than at least one other employee in their department.
-- Example:
SELECT A.first_name, A.salary, A.department 
FROM worker as A
JOIN worker as B
ON A.department = B.department AND A.salary > B.salary;

-- Consider the HR department with the following employees and salaries:
-- Employee	Salary
-- Aman	     10
-- Rahul	   5
-- Manish	   4

-- when the above self-join query runs:
-- Aman earns more than Rahul and Manish → he is included in the result.
-- Rahul earns more than Manish → he is also included.
-- Manish earns less than both → he is not included.
-- So the result set includes:
-- Aman AND rahul

                                            