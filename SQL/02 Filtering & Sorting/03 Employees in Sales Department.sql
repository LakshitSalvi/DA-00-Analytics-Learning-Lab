/*
==============================================================================
QUESTION
==============================================================================

Retrieve all employees who work in the Sales department and earn more than
₹50,000 per month.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The HR department is reviewing compensation for employees in the Sales
department. They need a report showing only Sales employees whose monthly
salary exceeds ₹50,000.

Your task is to retrieve employees who satisfy both conditions.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- AND Operator
- Multiple Conditions

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
WHERE department = 'Sales'
  AND salary > 50000;

/*
==============================================================================
EXPLANATION
==============================================================================

The AND operator combines multiple conditions in a WHERE clause.

A row is returned only if every condition evaluates to TRUE.

In this query, an employee must:
- Belong to the Sales department, and
- Have a monthly salary greater than ₹50,000.

If either condition is not satisfied, the employee is excluded from the
result.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | last_name | department | salary
-----------------------------------------------------------
101         | Rahul      | Sharma    | Sales      | 62000
108         | Priya      | Mehta     | Sales      | 58000
115         | Aman       | Verma     | Sales      | 71000
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use the AND operator when all specified conditions must be satisfied.

✓ Write each condition on a separate line for better readability.

✓ Place related conditions together to make complex queries easier to
  understand and maintain.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Department-wise Employee Reports

✓ Salary Eligibility Analysis

✓ Performance Review Reports

✓ HR Compensation Analysis

✓ Workforce Planning

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Greater Than Operator (>)
→ Equality Operator (=)

Next:
→ OR Operator
→ BETWEEN
→ IN

*/
