/*
==============================================================================
QUESTION
==============================================================================

Retrieve the top 5 highest-paid employees.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department is preparing a compensation report to identify
the organization's highest-paid employees. The report should display the top
five employees based on their monthly salary.

Your task is to retrieve the employees with the highest salaries.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- ORDER BY
- DESC
- LIMIT

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
ORDER BY salary DESC
LIMIT 5;

/*
==============================================================================
EXPLANATION
==============================================================================

The ORDER BY clause sorts the records by salary in descending order, placing
the highest salaries first.

The LIMIT clause then restricts the output to the first five rows.

Combining ORDER BY with LIMIT is a common technique for retrieving the top or
bottom records in a dataset.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | last_name | department | salary
-----------------------------------------------------------
104         | Neha       | Kapoor    | IT         | 95000
112         | Rahul      | Sharma    | Sales      | 91000
108         | Priya      | Mehta     | Finance    | 89000
115         | Aman       | Verma     | HR         | 87000
106         | Riya       | Singh     | Marketing  | 84000

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always use ORDER BY before LIMIT when retrieving the highest or lowest
  records.

✓ Explicitly specify ASC or DESC to improve query readability.

✓ Verify the sorting column to ensure the correct records are returned.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Executive Compensation Reports

✓ Employee Salary Analysis

✓ Top Performer Dashboards

✓ HR Analytics

✓ Payroll Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ IS NOT NULL

Next:
→ Latest Records
→ Aggregate Functions
→ Window Functions

*/
