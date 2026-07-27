/*
==============================================================================
QUESTION
==============================================================================

Calculate the average salary of all employees.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to determine the average employee salary
to analyze compensation trends and support salary benchmarking across the
organization.

Your task is to calculate the average salary of all employees.

*/

/*
==============================================================================
CONCEPTS COVER==
==============================================================================

- SELECT
- AVG()
- Column Alias (AS)

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
manager_id

Sample Data
-----------

employee_id | first_name | last_name | department | salary | manager_id
-------------------------------------------------------------------------
101         | Rahul      | Sharma    | Sales      | 50000  | 201
102         | Priya      | Mehta     | IT         | 65000  | 202
103         | Aman       | Verma     | HR         | 45000  | 203
104         | Neha       | Kapoor    | Finance    | 70000  | 204
105         | Rohan      | Singh     | Marketing  | 55000  | 205

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    AVG(salary) AS average_salary
FROM Employees;

/*
==============================================================================
EXPLANATION
==============================================================================

The AVG() function calculates the arithmetic mean of a numeric column.

SQL adds all salary values together and divides the total by the number of
rows, returning a single summarized value.

The AS keyword assigns a meaningful alias to the calculated result.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

average_salary
--------------
57000.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use AVG() only with numeric columns.

✓ Apply meaningful aliases to improve the readability of reports.

✓ Be aware that AVG() ignores NULL values automatically.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Salary Benchmarking

✓ Payroll Analysis

✓ HR Dashboards

✓ Compensation Reports

✓ Workforce Planning

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ SUM()

Next:
→ MIN()
→ MAX()
→ GROUP BY

*/
