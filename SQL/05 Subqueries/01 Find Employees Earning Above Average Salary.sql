/*
==============================================================================
QUESTION
==============================================================================

Retrieve all employees whose salary is greater than the average salary of all
employees.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to identify employees earning above the
company's average salary. This report can be used for compensation analysis,
performance reviews, and salary benchmarking.

Your task is to retrieve employees whose salary exceeds the average salary of
all employees.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- Aggregate Functions
- AVG()
- WHERE Clause
- Comparison Operators

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

Sample Data
-----------

employee_id | first_name | last_name | department | salary
------------------------------------------------------------
201         | Amit       | Sharma    | IT         | 75000
202         | Priya      | Kapoor    | HR         | 60000
203         | Rahul      | Mehta     | Finance    | 90000
204         | Sneha      | Verma     | Marketing  | 65000
205         | Aman       | Singh     | IT         | 82000
206         | Neha       | Patel     | Sales      | 58000

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
    department,
    salary
FROM Employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employees
);

/*
==============================================================================
EXPLANATION
==============================================================================

The subquery calculates the average salary of all employees.

    SELECT AVG(salary)
    FROM Employees

The outer query compares each employee's salary with this calculated average.

Only employees whose salary is greater than the average salary are returned.

Since the subquery returns a single value, it is known as a Single-Row
Subquery.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

Average Salary = 71,666.67

employee_id | first_name | last_name | department | salary
------------------------------------------------------------
201         | Amit       | Sharma    | IT         | 75000
203         | Rahul      | Mehta     | Finance    | 90000
205         | Aman       | Singh     | IT         | 82000

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use single-row subqueries when only one value is required.

✓ Ensure the subquery returns exactly one row when using comparison operators.

✓ Format subqueries with proper indentation for readability.

✓ Consider Common Table Expressions (CTEs) for complex calculations.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Salary Benchmarking

✓ Performance Analysis

✓ HR Compensation Reports

✓ Employee Analytics

✓ Payroll Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Next:
→ Multiple-Row Subqueries
→ Correlated Subqueries
→ EXISTS
→ IN

*/
