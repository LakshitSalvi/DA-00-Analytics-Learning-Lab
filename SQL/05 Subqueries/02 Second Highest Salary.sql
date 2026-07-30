/*
==============================================================================
QUESTION
==============================================================================

Retrieve the employee(s) earning the second highest salary.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to identify employees who earn the
second highest salary in the company. This report is useful for salary
benchmarking, succession planning, and identifying top-performing employees
without selecting the highest-paid employee.

Your task is to retrieve all employees whose salary is equal to the second
highest salary.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- Nested Subquery
- MAX()
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
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employees
    WHERE salary <
    (
        SELECT MAX(salary)
        FROM Employees
    )
);

/*
==============================================================================
EXPLANATION
==============================================================================

This query uses two nested subqueries.

Step 1:
The innermost subquery finds the highest salary in the Employees table.

    SELECT MAX(salary)
    FROM Employees

Result:
90000

Step 2:
The second subquery finds the maximum salary that is less than the highest
salary.

    SELECT MAX(salary)
    FROM Employees
    WHERE salary < 90000

Result:
82000

Step 3:
The outer query retrieves the employee(s) whose salary equals the second
highest salary.

This approach works even if multiple employees share the second highest
salary.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | last_name | department | salary
------------------------------------------------------------
205         | Aman       | Singh     | IT         | 82000

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use nested subqueries for ranking-based retrieval.

✓ Avoid hardcoding salary values.

✓ Ensure duplicate salaries are handled correctly.

✓ Consider DENSE_RANK() when using Window Functions for ranking problems.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Salary Benchmarking

✓ HR Analytics

✓ Employee Compensation Reports

✓ Performance Reviews

✓ Executive Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Employees Above Average Salary

Next:
→ Customers with Maximum Orders
→ Window Functions (DENSE_RANK)
→ LIMIT / TOP
→ ROW_NUMBER()

*/
