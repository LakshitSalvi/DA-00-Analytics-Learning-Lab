/*
==============================================================================
QUESTION
==============================================================================

Retrieve departments that have more than 10 employees.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The Human Resources department wants to identify departments with a large
workforce to assist in resource allocation, budgeting, and workforce planning.

Your task is to retrieve departments that have more than 10 employees.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- COUNT()
- GROUP BY
- HAVING
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
101         | Rahul      | Sharma    | IT         | 65000  | 201
102         | Priya      | Mehta     | HR         | 55000  | 202
103         | Aman       | Verma     | IT         | 60000  | 201
104         | Neha       | Kapoor    | Finance    | 70000  | 203
105         | Rohan      | Singh     | HR         | 52000  | 202
106         | Sneha      | Jain      | IT         | 58000  | 201
107         | Vikram     | Patel     | IT         | 62000  | 201
108         | Pooja      | Shah      | Sales      | 50000  | 204
109         | Arjun      | Joshi     | IT         | 64000  | 201
110         | Nisha      | Gupta     | IT         | 61000  | 201
111         | Karan      | Malhotra  | HR         | 56000  | 202
112         | Simran     | Kaur      | IT         | 63000  | 201
113         | Aditya     | Rao       | IT         | 59000  | 201
114         | Isha       | Desai     | IT         | 60000  | 201
115         | Mohit      | Arora     | IT         | 61000  | 201
116         | Anjali     | Nair      | IT         | 62000  | 201

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    department,
    COUNT(*) AS total_employees
FROM Employees
GROUP BY department
HAVING COUNT(*) > 10;

/*
==============================================================================
EXPLANATION
==============================================================================

The GROUP BY clause groups employees based on their department.

The COUNT() function calculates the number of employees in each department.

The HAVING clause filters grouped results, returning only departments where
the employee count is greater than 10.

Unlike WHERE, which filters individual rows before grouping, HAVING filters
groups after aggregation.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

department | total_employees
----------------------------
IT         | 11

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use WHERE to filter individual rows before grouping.

✓ Use HAVING to filter aggregated results after GROUP BY.

✓ Use descriptive aliases to improve report readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Workforce Planning

✓ Department Performance Reports

✓ HR Analytics

✓ Organizational Structure Analysis

✓ Executive Workforce Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ GROUP BY

Next:
→ COUNT(DISTINCT)
→ Multiple Aggregate Functions
→ Window Functions

*/
