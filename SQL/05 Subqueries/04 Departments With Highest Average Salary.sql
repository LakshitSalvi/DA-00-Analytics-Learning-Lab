/*
==============================================================================
QUESTION
==============================================================================

Retrieve the department that has the highest average salary.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to identify which department offers the
highest average salary. This information can be used for salary benchmarking,
budget planning, and organizational analysis.

Your task is to determine the department with the highest average salary.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- GROUP BY
- AVG()
- MAX()
- HAVING
- Aggregate Functions

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
207         | Rohan      | Joshi     | Finance    | 85000
208         | Kavya      | Iyer      | HR         | 70000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    department,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) =
(
    SELECT MAX(average_salary)
    FROM
    (
        SELECT
            AVG(salary) AS average_salary
        FROM Employees
        GROUP BY department
    ) AS DepartmentAverages
);

/*
==============================================================================
EXPLANATION
==============================================================================

The inner subquery calculates the average salary for each department.

The outer subquery finds the highest average salary among all departments.

The main query groups employees by department and returns only the department
whose average salary matches the highest calculated average.

This demonstrates how multiple levels of subqueries can be combined with
aggregate functions.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

department | average_salary
---------------------------
Finance    | 87500.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Break complex problems into smaller subqueries.

✓ Give derived tables meaningful aliases.

✓ Use GROUP BY before applying aggregate filters.

✓ Format nested queries with proper indentation for readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Department Salary Benchmarking

✓ Budget Planning

✓ HR Compensation Analysis

✓ Executive Reporting

✓ Workforce Analytics

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Single-Row Subqueries
→ Aggregate Functions

Next:
→ EXISTS
→ NOT EXISTS
→ Correlated Subqueries
→ Common Table Expressions (CTEs)

*/
