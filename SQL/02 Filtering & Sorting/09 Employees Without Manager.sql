/*
==============================================================================
QUESTION
==============================================================================

Retrieve all employees who do not have a manager assigned.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The HR department is reviewing the organizational structure to identify
employees who do not report to anyone. These employees are typically senior
management or department heads.

Your task is to retrieve employees whose manager information is missing.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- IS NULL

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
WHERE manager_id IS NULL;

/*
==============================================================================
EXPLANATION
==============================================================================

NULL represents the absence of a value in a database.

Since NULL is not considered equal to any value, including another NULL,
comparison operators such as '=' or '!=' cannot be used to check for NULL
values.

The IS NULL operator returns only those rows where the specified column
contains a NULL value.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | last_name | department | salary
-----------------------------------------------------------
101         | Rahul      | Sharma    | Management | 95000
108         | Priya      | Mehta     | Finance    | 90000
115         | Aman       | Verma     | HR         | 88000
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use IS NULL to check for missing values.

✓ Never use '= NULL' because it will not return the expected results.

✓ Handle NULL values carefully when preparing reports and performing data
  analysis.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Organizational Hierarchy Analysis

✓ HR Reporting

✓ Employee Management Systems

✓ Data Quality Assessment

✓ Executive Leadership Reports

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ LIKE Operator

Next:
→ IS NOT NULL
→ ORDER BY
→ LIMIT

*/
