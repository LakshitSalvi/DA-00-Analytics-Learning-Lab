/*
==============================================================================
QUESTION
==============================================================================

Retrieve all employees and display them in descending order of their salary.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The HR department wants to identify the highest-paid employees for salary
benchmarking and compensation planning.

Your task is to sort employee records so that employees with the highest
salaries appear first.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- ORDER BY
- DESC
- ASC

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Employees

Columns
--------
employee_id
first_name
last_name
department
salary
hire_date

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS "Employee Name",
    department,
    salary
FROM Employees
ORDER BY salary DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

The ORDER BY clause is used to sort query results.

By default, SQL sorts data in ascending (ASC) order. Using DESC sorts the
records from the highest value to the lowest.

In this query, employees are sorted by salary in descending order, making it
easy to identify the highest-paid employees.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | Employee Name   | department | salary
----------------------------------------------------
104         | Neha Kapoor     | IT         | 95000
102         | Priya Mehta     | Finance    | 85000
101         | Rahul Sharma    | Sales      | 72000
103         | Aman Verma      | HR         | 60000
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always use ORDER BY when the order of results matters.

✓ Explicitly specify ASC or DESC for better readability, even though ASC is
  the default.

✓ Sort only when necessary, as sorting large datasets can impact query
  performance.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Employee Salary Reports

✓ Sales Leaderboards

✓ Customer Ranking Dashboards

✓ Financial Reports

✓ Inventory Analysis

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ COALESCE()

Next:
→ LIMIT + ORDER BY
→ GROUP BY
→ Aggregate Functions

*/
