/*
===============================================================================
                          LEETCODE 1075
                       Project Employees I
===============================================================================

Difficulty    : Easy
Topics        : INNER JOIN, GROUP BY, AVG()
Companies     : Amazon, Google, Microsoft, Meta, Deloitte

===============================================================================
QUESTION
===============================================================================

Table: Project

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| project_id   | int     |
| employee_id  | int     |
+--------------+---------+

(project_id, employee_id) is the primary key.

----------------------------------------------------------

Table: Employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| name          | varchar |
| experience_years | int  |
+---------------+---------+

employee_id is the primary key.

Write a solution to report the average experience years of all employees
for each project.

Round the average experience years to two decimal places.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A consulting company assigns employees to multiple projects.

Project managers want to understand the average experience level
of employees working on each project.

As a Data Analyst, your task is to calculate the average years of
experience for every project team.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Project ID

• Average Experience Years

for every project.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ GROUP BY

✔ AVG()

✔ ROUND()

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    p.project_id,

    ROUND(AVG(e.experience_years),2) AS average_years

FROM Project AS p

INNER JOIN Employee AS e

ON p.employee_id = e.employee_id

GROUP BY

    p.project_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join the Project table with the Employee table
using employee_id.

----------------------------------------------------------

Step 2

Each project now contains the experience years
of its employees.

----------------------------------------------------------

Step 3

Group the data by project_id.

----------------------------------------------------------

Step 4

Calculate the average experience for each project.

----------------------------------------------------------

Step 5

Round the result to two decimal places.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee

+-------------+------------+
| Employee ID | Experience |
+-------------+------------+
| 1           | 5          |
| 2           | 3          |
| 3           | 7          |
+-------------+------------+

Project

+------------+-------------+
| Project ID | Employee ID |
+------------+-------------+
| 10         | 1           |
| 10         | 2           |
| 20         | 3           |
+------------+-------------+

After JOIN

Project 10

5 Years

3 Years

↓

AVG

↓

4.00

Project 20

7 Years

↓

AVG

↓

7.00

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+---------------+
| project_id | average_years |
+------------+---------------+
| 10         | 4.00          |
| 20         | 7.00          |
+------------+---------------+

===============================================================================
WHY AVG()?
===============================================================================

AVG() calculates the arithmetic mean
of all experience_years within each project.

ROUND() formats the result to two decimal places,
matching the problem requirement.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    p.project_id,

    CAST(AVG(e.experience_years) AS DECIMAL(10,2))
    AS average_years

FROM Project p

JOIN Employee e

ON p.employee_id = e.employee_id

GROUP BY

    p.project_id;

This solution uses CAST() instead of ROUND().
Both approaches are acceptable depending on the database system.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Assuming employee_id is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use GROUP BY?

Because the average must be calculated
separately for each project.

----------------------------------------------------------

Q2. Why use INNER JOIN?

Because only employees assigned to projects
should be included.

----------------------------------------------------------

Q3. Why ROUND()?

The problem requires the result
to be displayed with two decimal places.

----------------------------------------------------------

Q4. What happens if a project has only one employee?

AVG() simply returns that employee's
experience years.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting GROUP BY.

AVG() would calculate the average
across all employees.

----------------------------------------------------------

❌ Joining on project_id.

The correct join column is employee_id.

----------------------------------------------------------

❌ Forgetting ROUND().

The output format would not match
the expected result.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Project Resource Planning

• Workforce Analytics

• HR Reporting

• Consulting Project Analysis

• Team Skill Assessment

• Resource Allocation Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ INNER JOIN combines project and employee data.

✔ GROUP BY performs calculations per project.

✔ AVG() calculates averages.

✔ ROUND() formats numerical results.

✔ A common SQL interview problem combining JOINs and aggregation.

===============================================================================
*/
