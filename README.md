# SQL Complete Notes

## What is SQL?

SQL (Structured Query Language) is a programming language used to interact with relational databases such as MySQL, SQL Server, and Oracle to perform CRUD (Create, Read, Update, Delete) operations.

---

## History of SQL

* SQL was initially called SEQUEL (Structured English Query Language) and was developed by IBM. Later, the name was shortened to SQL.

---

## SQL vs MySQL

SQL is a structured query language used to interact with relational databases to perform CRUD operations, whereas MySQL is a popular open-source Relational Database Management System (RDBMS) that uses SQL to manage data.

| SQL                                 | MySQL                           |
| ----------------------------------- | ------------------------------- |
| Language to interact with databases | A database system that uses SQL |
| Used for querying and managing data | Stores and executes SQL queries |

---

## SQL Data Types

Common SQL data types include:

* `INT`, `DECIMAL`, `FLOAT` – Numbers
* `VARCHAR(n)` – Variable-length strings
* `TEXT` – Large text fields
* `DATE`, `DATETIME` – Date/time values
* `BOOLEAN` – True/False

---

## SQL Command Categories

### 1. DDL – Data Definition Language

DDL commands are used to define and modify the structure of a database and its tables.

| Command    | Description                                        |
| ---------- | -------------------------------------------------- |
| `CREATE`   | Creates a new table or database                    |
| `ALTER`    | Modifies structure of existing table               |
| `DROP`     | Deletes table or database permanently              |
| `TRUNCATE` | Removes all records from a table (keeps structure) |
| `RENAME`   | Renames a table                                    |

**DDL Examples:**

```sql
-- Create a new table
CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

-- Drop a table if exists
DROP TABLE IF EXISTS users;

-- Create a database
CREATE DATABASE IF NOT EXISTS myDatabase;

-- Drop a database if exists
DROP DATABASE IF NOT EXISTS myDatabase;

-- Truncate a table
TRUNCATE TABLE users;

-- Rename a table
RENAME TABLE users TO customers;

-- Add new column
ALTER TABLE users ADD phone VARCHAR(15);

-- Drop a column
ALTER TABLE users DROP adharcard_number;

-- Modify an existing column
ALTER TABLE users MODIFY name VARCHAR(100) NOT NULL;

-- Change old column name to new column name
ALTER TABLE student CHANGE name student_name VARCHAR(255);
```

---

### 2. DML – Data Manipulation Language

DML commands are used to manipulate data from an existing table (such as insert a new row, update existing row, delete row).

| Command  | Description            |
| -------- | ---------------------- |
| `INSERT` | Adds new data          |
| `UPDATE` | Modifies existing data |
| `DELETE` | Removes data           |

**Example:**

```sql
INSERT INTO users (name, email) VALUES ('John', 'john@example.com');
UPDATE users SET name = 'Johnny' WHERE id = 1;
DELETE FROM users WHERE id = 2;
```

---

### 3. DQL/DRL – Data Query Language / Data Retrieval Language

DQL commands are used to retrieve/read data from the table.

| Command  | Description    |
| -------- | -------------- |
| `SELECT` | Retrieves data |

**Example:**

```sql
SELECT * FROM users;
SELECT name, email FROM users WHERE age > 25;
```

---

### 4. DCL – Data Control Language

DCL are used to control permissions to data in the database.

| Command  | Description       |
| -------- | ----------------- |
| `GRANT`  | Give privileges   |
| `REVOKE` | Remove privileges |

**DCL (Data Control Language):** DCL are used to control permissions to data in the database.

---

### 5. TCL – Transaction Control Language

TCL (Transaction Control Language) are used to manage transactions within the database.

| Command             | Description               |
| ------------------- | ------------------------- |
| `START TRANSACTION` | Begins a transaction      |
| `COMMIT`            | Saves changes permanently |
| `ROLLBACK`          | Undo changes              |
| `SAVEPOINT`         | Intermediate checkpoint   |

**TCL (Transaction Control Language):** are used to manage transactions within the database.

---

## Constraints in SQL

SQL Constraints are used to specify the rules for data in a table.

Most Commonly Used Constraints in SQL:

* `PRIMARY KEY`: Uniquely identifies rows
* `FOREIGN KEY`: References primary key in another table
* `NOT NULL`: Value must not be null
* `UNIQUE`: Value must be unique
* `CHECK`: Restrict values
* `DEFAULT`: Provide default value

**Example:**

```sql
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  status VARCHAR(10) DEFAULT 'active'
);
```

---

## SQL JOINS

A JOIN is used to combine rows from two or more tables based on a related column between them.

| Type                      | Description                                                                         |
| ------------------------- | ----------------------------------------------------------------------------------- |
| `INNER JOIN`              | Returns only the matched rows from both tables.                                     |
| `LEFT JOIN` (OUTER JOIN)  | Returns all the rows from the left table and the matched rows from the right table. |
| `RIGHT JOIN` (OUTER JOIN) | Returns all the rows from the right table and the matched rows from the left table. |
| `FULL JOIN` (OUTER JOIN)  | Returns all the rows from both tables, including unmatched rows from each table.    |
| `LEFT EXCLUSIVE`          | Returns rows from the left table that do not have matching rows in the right table. |
| `RIGHT EXCLUSIVE`         | Returns rows from the right table that do not have matching rows in the left table. |

**Example:**

```sql
SELECT * FROM student s LEFT JOIN course c ON s.id = c.student_id;

-- Left Exclusive Join
SELECT * FROM student s LEFT JOIN course c ON s.id = c.student_id WHERE c.student_id IS NULL;
```

---

## Aggregate Functions

Aggregate functions perform a calculation on a set of values and return a single value.

| Function  | Description   |
| --------- | ------------- |
| `COUNT()` | Count of rows |
| `SUM()`   | Total sum     |
| `AVG()`   | Average value |
| `MAX()`   | Maximum value |
| `MIN()`   | Minimum value |

**Example:**

```sql
SELECT AVG(marks) FROM student;
```

---

## SQL Clauses

| Clause     | Use                                             |
| ---------- | ----------------------------------------------- |
| `WHERE`    | Used to filter rows before grouping             |
| `GROUP BY` | Used to group rows based on one or more columns |
| `HAVING`   | Used to filter groups after applying GROUP BY   |
| `ORDER BY` | Sort the result set (default is ascending)      |
| `LIMIT`    | Restricts number of rows returned               |
| `OFFSET`   | Skips rows before returning result              |

**Query Example Using All Clauses:**

```sql
SELECT city 
FROM users 
WHERE age > 20 
GROUP BY city 
HAVING MAX(age) > 50 
ORDER BY MAX(age) DESC;
```

---

## Subqueries

A subquery in SQL is a query nested inside another query. It is used to retrieve data based on the result of another query.

**Example:**

```sql
SELECT * FROM students WHERE marks > (SELECT AVG(marks) FROM students);
```

---

## Views

A view is a virtual table created from one or more real tables. It does not store data itself but provides a way to represent and query data from existing tables.

**Example:**

```sql
CREATE VIEW student_view AS SELECT id, name FROM students;
```

---

## UNION vs UNION ALL

Both UNION and UNION ALL are used to combine the result sets of two or more SELECT statements. However, UNION removes duplicate rows from the result set, whereas UNION ALL includes all rows, including duplicates.

**Example:**

```sql
SELECT name FROM students
UNION
SELECT name FROM teachers;

SELECT name FROM students
UNION ALL
SELECT name FROM teachers;
```

---

## SQL Operators

* **Logical Operators**: `AND`, `OR`, `NOT`
* **Comparison Operators**: `=`, `>`, `<`, `>=`, `<=`, `!=`
* **Set Operators**: `IN`, `NOT IN`, `BETWEEN`, `LIKE`
* **Pattern Matching**: `%` (wildcard), `_` (single character)

**Example Using Multiple Operators:**

```sql
SELECT * FROM users
WHERE age BETWEEN 20 AND 30
AND city IN ('Delhi', 'Mumbai')
AND email LIKE '%@gmail.com';
```

---

## SQL String Functions

| Function               | Description                       | Example                                               |
| ---------------------- | --------------------------------- | ----------------------------------------------------- |
| `CONCAT()`             | Combines two or more strings      | `SELECT CONCAT('Hello', ' World');` → `'Hello World'` |
| `LENGTH()`             | Returns length of a string        | `SELECT LENGTH('SQL');` → `3`                         |
| `LOWER()`              | Converts string to lowercase      | `SELECT LOWER('SQL');` → `'sql'`                      |
| `UPPER()`              | Converts string to uppercase      | `SELECT UPPER('sql');` → `'SQL'`                      |
| `TRIM()`               | Removes leading/trailing spaces   | `SELECT TRIM('  SQL  ');` → `'SQL'`                   |
| `SUBSTRING()`          | Extracts part of a string         | `SELECT SUBSTRING('Database', 1, 4);` → `'Data'`      |
| `REPLACE()`            | Replaces occurrences of substring | `SELECT REPLACE('abcabc', 'a', 'x');` → `'xbcxbc'`    |
| `INSTR()` / `LOCATE()` | Returns position of substring     | `SELECT INSTR('abcdef', 'cd');` → `3`                 |

---

This document covers all **core SQL concepts** along with **syntax, examples, and best practices**. You can use it as a complete learning or revision guide or add it as a `README.md` on GitHub.

Let me know if you want:

* Practice Questions
* Real SQL Interview Tasks
* Cheat Sheet Version
* Export as Markdown or PDF
