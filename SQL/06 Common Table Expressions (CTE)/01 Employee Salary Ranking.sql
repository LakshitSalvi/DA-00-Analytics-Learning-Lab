/*
==============================================================================
QUESTION
==============================================================================

Rank employees based on their salary in descending order using a Common Table
Expression (CTE).

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The HR department wants to identify the highest-paid employees across the
organization.

Instead of writing a complex nested query, they want a cleaner and more
maintainable solution using a Common Table Expression (CTE).

Your task is to rank employees based on salary, with the highest salary
receiving Rank 1.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Common Table Expression (CTE)
- WITH Clause
- ROW_NUMBER()
- ORDER BY
- SELECT

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
101         | Rahul      | Sharma    | IT         | 92000
102         | Priya      | Kapoor    | HR         | 70000
103         | Aman       | Verma     | Finance    | 98000
104         | Neha       | Singh     | Marketing  | 65000
105         | Rohan      | Patel     | IT         | 87000
106         | Kavya      | Iyer      | Finance    | 91000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH EmployeeRanking AS
(
    SELECT
        employee_id,
        first_name,
        last_name,
        department,
        salary,
        ROW_NUMBER() OVER
        (
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employees
)

SELECT
    employee_id,
    first_name,
    last_name,
    department,
    salary,
    salary_rank
FROM EmployeeRanking
ORDER BY salary_rank;

/*
==============================================================================
EXPLANATION
==============================================================================

A Common Table Expression (CTE) creates a temporary named result set that can
be referenced within the same SQL statement.

Step 1:
The CTE retrieves employee details and assigns a rank based on salary using
ROW_NUMBER().

Step 2:
The outer query simply retrieves the ranked data from the CTE.

Compared to nested subqueries, CTEs improve readability and make complex SQL
queries easier to maintain.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | last_name | department | salary | salary_rank
-------------------------------------------------------------------------
103         | Aman       | Verma     | Finance    | 98000  | 1
101         | Rahul      | Sharma    | IT         | 92000  | 2
106         | Kavya      | Iyer      | Finance    | 91000  | 3
105         | Rohan      | Patel     | IT         | 87000  | 4
102         | Priya      | Kapoor    | HR         | 70000  | 5
104         | Neha       | Singh     | Marketing  | 65000  | 6

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Give CTEs meaningful names.

✓ Use CTEs to improve query readability.

✓ Keep CTE logic focused on a single task.

✓ Use Window Functions with CTEs for reporting and analytics.

✓ Prefer CTEs over deeply nested subqueries when readability is important.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Employee Performance Reports

✓ Salary Ranking Dashboards

✓ Executive Compensation Analysis

✓ HR Analytics

✓ Workforce Planning

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Subqueries
→ ROW_NUMBER()

Next:
→ Running Monthly Sales
→ Multiple CTEs
→ Recursive CTEs

*/
