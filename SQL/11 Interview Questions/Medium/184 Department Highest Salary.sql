/*
===============================================================================
                           LEETCODE 184
                     Department Highest Salary
===============================================================================

Difficulty    : Medium
Topics        : JOIN, GROUP BY, MAX(), Subquery
Companies     : Amazon, Google, Microsoft, Meta, Apple

===============================================================================
QUESTION
===============================================================================

Table: Employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
| salary        | int     |
| departmentId  | int     |
+---------------+---------+

id is the primary key.

----------------------------------------------------------

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

id is the primary key.

Write a solution to find employees who have the highest salary
in each department.

Return:

• Department
• Employee
• Salary

===============================================================================
BUSINESS SCENARIO
===============================================================================

An organization's HR department wants to recognize the highest-paid
employee in every department.

If multiple employees share the highest salary,
all of them should appear in the report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Department Name

• Employee Name

• Salary

for every employee whose salary equals the highest salary
within their department.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ GROUP BY

✔ MAX()

✔ Subquery

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    d.name AS Department,

    e.name AS Employee,

    e.salary AS Salary

FROM Employee AS e

INNER JOIN Department AS d

ON e.departmentId = d.id

INNER JOIN
(
    SELECT

        departmentId,

        MAX(salary) AS HighestSalary

    FROM Employee

    GROUP BY

        departmentId

) AS HighestSalaries

ON e.departmentId = HighestSalaries.departmentId

AND e.salary = HighestSalaries.HighestSalary;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Find the highest salary for each department.

----------------------------------------------------------

Step 2

Join the result back to Employee.

----------------------------------------------------------

Step 3

Keep employees whose salary matches
the department's highest salary.

----------------------------------------------------------

Step 4

Join Department to retrieve
the department name.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee

+-------+--------+-----------+
| Name  | Salary | Dept      |
+-------+--------+-----------+
| Alice | 90000  | HR        |
| Bob   | 70000  | HR        |
| Emma  | 80000  | IT        |
| John  | 80000  | IT        |
+-------+--------+-----------+

Highest Salary

HR

↓

90000

IT

↓

80000

↓

Result

HR

Alice

90000

IT

Emma

80000

IT

John

80000

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| HR         | Alice    | 90000  |
| IT         | Emma     | 80000  |
| IT         | John     | 80000  |
+------------+----------+--------+

===============================================================================
WHY MAX()?
===============================================================================

MAX() finds the largest salary
within each department.

Joining back to Employee identifies
the employee(s) who earned it.

===============================================================================
ALTERNATIVE SOLUTION (WINDOW FUNCTION)
===============================================================================

SELECT

    Department,

    Employee,

    Salary

FROM
(
    SELECT

        d.name AS Department,

        e.name AS Employee,

        e.salary AS Salary,

        DENSE_RANK()

        OVER
        (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS SalaryRank

    FROM Employee e

    JOIN Department d

    ON e.departmentId = d.id

) RankedEmployees

WHERE SalaryRank = 1;

The window function approach is cleaner and scales well
for Top-N ranking problems.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping and joins dominate execution time.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped department salaries.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MAX()?

To determine the highest salary
within each department.

----------------------------------------------------------

Q2. Why join the subquery back to Employee?

Because MAX() returns only the salary,
not the employee details.

----------------------------------------------------------

Q3. Why use DENSE_RANK()?

It naturally handles ties and extends easily
to Top-N salary problems.

----------------------------------------------------------

Q4. What if multiple employees have
the same highest salary?

All of them should appear.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using LIMIT 1.

This returns only one employee
for the entire company.

----------------------------------------------------------

❌ Forgetting GROUP BY departmentId.

MAX() would return only one salary
for the whole table.

----------------------------------------------------------

❌ Joining only on departmentId.

Always match both

departmentId

and

salary.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Salary Reports

• Executive Dashboards

• Compensation Benchmarking

• Payroll Analytics

• Department Performance Reports

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ MAX() identifies the highest value per group.

✔ Join aggregated results back to retrieve details.

✔ DENSE_RANK() is the preferred modern approach.

✔ Handle salary ties correctly.

✔ One of the most frequently asked SQL interview questions.

===============================================================================
*/
