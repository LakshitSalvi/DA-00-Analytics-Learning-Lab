/*
===============================================================================
                           LEETCODE 1076
                        Project Employees II
===============================================================================

Difficulty    : Medium
Topics        : GROUP BY, COUNT(), MAX(), Subquery
Companies     : Amazon, Google, Microsoft, Deloitte, Accenture

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

Each row indicates that an employee is assigned to a project.

Write a solution to report all project IDs that have the
largest number of employees.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A consulting company is reviewing resource allocation.

Management wants to identify projects with the largest teams so they
can evaluate staffing efficiency and project complexity.

If multiple projects have the same maximum number of employees,
all of them should be included.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• project_id

for every project having the maximum number of employees.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ COUNT()

✔ MAX()

✔ Subquery

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    project_id

FROM Project

GROUP BY

    project_id

HAVING

    COUNT(employee_id) =
    (
        SELECT

            MAX(employee_count)

        FROM
        (
            SELECT

                COUNT(employee_id) AS employee_count

            FROM Project

            GROUP BY

                project_id

        ) AS ProjectCounts
    );

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group employees by project.

----------------------------------------------------------

Step 2

Count employees in every project.

----------------------------------------------------------

Step 3

Find the largest employee count.

----------------------------------------------------------

Step 4

Return every project whose employee count
equals that maximum.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Project

+---------+----------+
| Project | Employees|
+---------+----------+
| 1       | 3        |
| 2       | 5        |
| 3       | 5        |
| 4       | 2        |
+---------+----------+

Maximum Employees

↓

5

↓

Projects

2

3

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+
| project_id |
+------------+
| 2          |
| 3          |
+------------+

===============================================================================
WHY SUBQUERY?
===============================================================================

The outer query compares each project's
employee count against the overall maximum.

The inner query calculates
that maximum employee count.

===============================================================================
ALTERNATIVE SOLUTION (WINDOW FUNCTION)
===============================================================================

SELECT

    project_id

FROM
(
    SELECT

        project_id,

        DENSE_RANK()

        OVER
        (
            ORDER BY COUNT(*) DESC
        ) AS TeamRank

    FROM Project

    GROUP BY

        project_id

) RankedProjects

WHERE TeamRank = 1;

Window functions provide an elegant solution
for Top-N grouping problems.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Grouping dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped project counts.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why GROUP BY project_id?

To count employees separately
for each project.

----------------------------------------------------------

Q2. Why use MAX()?

To determine the largest team size.

----------------------------------------------------------

Q3. Why use HAVING instead of WHERE?

HAVING filters aggregated results.

WHERE cannot use aggregate functions.

----------------------------------------------------------

Q4. What if the requirement changes to
Top 3 largest teams?

Use

DENSE_RANK()

or

ORDER BY COUNT(*) DESC
LIMIT 3

depending on whether ties should be included.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using WHERE COUNT(*).

Aggregate functions cannot be used
inside WHERE.

----------------------------------------------------------

❌ Using LIMIT 1.

LIMIT 1 would ignore projects tied
for the largest team.

----------------------------------------------------------

❌ Forgetting GROUP BY.

COUNT() would calculate the total
employees across all projects.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Project Resource Planning

• Workforce Analytics

• Capacity Planning

• Consulting Dashboards

• Team Size Analysis

• Business Intelligence Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY creates one group per project.

✔ COUNT() calculates team size.

✔ MAX() identifies the largest group.

✔ HAVING filters aggregated results.

✔ Top-group analysis is a common SQL interview pattern.

===============================================================================
*/
