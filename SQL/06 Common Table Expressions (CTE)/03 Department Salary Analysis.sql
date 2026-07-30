/*
==============================================================================
QUESTION
==============================================================================

Compare each employee's salary with their department's average salary using a
Common Table Expression (CTE).

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The HR department wants to identify employees who earn above, below, or equal
to their department's average salary.

This analysis helps support compensation reviews, salary benchmarking, and
performance evaluations.

Your task is to compare each employee's salary with the average salary of
their respective department.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Common Table Expression (CTE)
- WITH Clause
- GROUP BY
- AVG()
- INNER JOIN
- CASE
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
101         | Rahul      | Sharma    | IT         | 90000
102         | Priya      | Kapoor    | HR         | 65000
103         | Aman       | Verma     | Finance    | 95000
104         | Neha       | Singh     | IT         | 80000
105         | Rohan      | Patel     | Finance    | 85000
106         | Kavya      | Iyer      | HR         | 75000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH DepartmentAverageSalary AS
(
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department
)

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department,
    e.salary,
    d.average_salary,

    CASE
        WHEN e.salary > d.average_salary THEN 'Above Average'
        WHEN e.salary < d.average_salary THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS salary_status

FROM Employees AS e
INNER JOIN DepartmentAverageSalary AS d
    ON e.department = d.department
ORDER BY
    e.department,
    e.salary DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:
The CTE calculates the average salary for each department.

Step 2:
The outer query joins each employee with their department's average salary.

Step 3:
A CASE statement compares the employee's salary against the departmental
average and classifies it as:

• Above Average
• Below Average
• Equal to Average

Using a CTE avoids recalculating the departmental average for every employee,
making the query cleaner and easier to maintain.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

employee_id | first_name | department | salary | average_salary | salary_status
------------------------------------------------------------------------------
103         | Aman       | Finance    | 95000  | 90000.00       | Above Average
105         | Rohan      | Finance    | 85000  | 90000.00       | Below Average
106         | Kavya      | HR         | 75000  | 70000.00       | Above Average
102         | Priya      | HR         | 65000  | 70000.00       | Below Average
101         | Rahul      | IT         | 90000  | 85000.00       | Above Average
104         | Neha       | IT         | 80000  | 85000.00       | Below Average

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Calculate aggregates once inside a CTE.

✓ Use descriptive CTE names.

✓ Separate calculation logic from presentation logic.

✓ Use CASE statements to create business-friendly output.

✓ Order results to improve readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Salary Benchmarking

✓ HR Compensation Analysis

✓ Employee Performance Reviews

✓ Workforce Planning

✓ Executive HR Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Running Monthly Sales

Next:
→ Hierarchical Employee Structure
→ Recursive CTEs
→ Window Functions
→ Department Analytics

*/
