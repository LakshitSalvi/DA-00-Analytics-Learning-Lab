/*
==============================================================================
QUESTION
==============================================================================

Retrieve the department with the highest total payroll.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Finance department wants to identify which department incurs the highest
salary expense. This information is useful for budgeting, workforce planning,
and cost optimization.

Your task is to retrieve the department whose total payroll is the highest.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- Nested Subquery
- GROUP BY
- SUM()
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
    SUM(salary) AS total_payroll
FROM Employees
GROUP BY department
HAVING SUM(salary) =
(
    SELECT MAX(total_payroll)
    FROM
    (
        SELECT
            SUM(salary) AS total_payroll
        FROM Employees
        GROUP BY department
    ) AS DepartmentPayroll
);

/*
==============================================================================
EXPLANATION
==============================================================================

The query executes in three stages.

Step 1:
The innermost subquery calculates the total payroll for each department.

    SELECT
        SUM(salary) AS total_payroll
    FROM Employees
    GROUP BY department

Result:

department | total_payroll
---------------------------
IT         | 157000
HR         | 130000
Finance    | 175000
Marketing  | 65000
Sales      | 58000

Step 2:
The outer subquery finds the maximum payroll value.

    SELECT MAX(total_payroll)
    FROM (...)

Result:

175000

Step 3:
The main query groups employees by department and returns the department
whose total payroll equals the maximum payroll.

This solution automatically handles ties if multiple departments have the same
highest payroll.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

department | total_payroll
---------------------------
Finance    | 175000

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use SUM() to calculate total departmental payroll.

✓ Use derived tables for complex aggregate calculations.

✓ Avoid hardcoding aggregate values.

✓ Design queries that naturally handle ties.

✓ Format nested subqueries for readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Department Budget Analysis

✓ Payroll Reporting

✓ Workforce Cost Analysis

✓ Financial Planning

✓ Executive Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Products More Expensive Than Average

Next:
→ Customers Who Never Ordered
→ Correlated Subqueries
→ EXISTS
→ NOT EXISTS

*/
