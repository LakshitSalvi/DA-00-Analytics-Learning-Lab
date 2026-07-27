/*
==============================================================================
QUESTION
==============================================================================

Retrieve each employee's monthly salary and calculate their annual salary.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources (HR) department is preparing annual compensation reports.
The employee table stores monthly salaries, but the report requires annual
salary figures.

Your task is to calculate each employee's annual salary without modifying the
database.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Arithmetic Expressions
- Column Alias
- AS Keyword

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
    first_name,
    last_name,
    salary AS "Monthly Salary",
    salary * 12 AS "Annual Salary"
FROM Employees;

/*
==============================================================================
EXPLANATION
==============================================================================

SQL supports arithmetic operations directly within the SELECT statement.

In this query, the monthly salary is multiplied by 12 to calculate the annual
salary.

The calculated value is displayed as a new column using the AS keyword. This
does not change the data stored in the database.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | last_name | Monthly Salary | Annual Salary
----------------------------------------------------------------------
101         | Rahul      | Sharma    | 50000          | 600000
102         | Priya      | Mehta     | 65000          | 780000
103         | Aman       | Verma     | 42000          | 504000
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use aliases for calculated columns to improve readability.

✓ Perform calculations directly in SQL whenever possible instead of processing
  them in application code.

✓ Keep calculations simple and well-documented for easier maintenance.

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ LIMIT
→ Column Aliases

Next:
→ CONCAT()
→ COALESCE()
→ ORDER BY

*/
