/*
===============================================================================
                           LEETCODE 1303
                         Find the Team Size
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, COUNT() OVER(), PARTITION BY
Companies     : Amazon, Google, Microsoft, Meta, LinkedIn

===============================================================================
QUESTION
===============================================================================

Table: Employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| team_id       | int     |
+---------------+---------+

employee_id is the primary key.

Each employee belongs to exactly one team.

Write a solution to report the team size
of each employee.

Return:

• employee_id

• team_size

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company organizes employees into teams.

HR wants to know the size of each employee's team
without losing individual employee records.

This information is used for organizational planning,
resource allocation,
and workload analysis.

===============================================================================
OBJECTIVE
===============================================================================

Return

• employee_id

• team_size

for every employee.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ COUNT() OVER()

✔ PARTITION BY

✔ Window Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    employee_id,

    COUNT(*)

    OVER
    (
        PARTITION BY team_id
    ) AS team_size

FROM Employee;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Partition employees
by team.

----------------------------------------------------------

Step 2

Count the number
of employees
inside each partition.

----------------------------------------------------------

Step 3

Return the count
for every employee.

Unlike GROUP BY,

window functions preserve
every row.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Team A

Employee

1

2

3

↓

COUNT()

↓

3

Employee 1

↓

3

Employee 2

↓

3

Employee 3

↓

3

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------+-----------+
| employee_id | team_size |
+-------------+-----------+
| 1           | 3         |
| 2           | 3         |
| 3           | 3         |
| 4           | 2         |
| 5           | 2         |
+-------------+-----------+

===============================================================================
WHY COUNT() OVER()?
===============================================================================

COUNT()

normally returns

one row per group.

COUNT() OVER()

returns the count

while preserving
every individual employee row.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    e.employee_id,

    t.team_size

FROM Employee e

JOIN
(
    SELECT

        team_id,

        COUNT(*) AS team_size

    FROM Employee

    GROUP BY

        team_id
) t

ON e.team_id = t.team_id;

This works,

but requires an additional join.

The window function solution
is shorter and more efficient.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each employee
is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use PARTITION BY?

To calculate counts
independently
for each team.

----------------------------------------------------------

Q2. Why not GROUP BY?

GROUP BY removes
individual employee rows.

----------------------------------------------------------

Q3. Can SUM() OVER()
replace COUNT() OVER()?

Yes.

Window functions support
many aggregate functions.

----------------------------------------------------------

Q4. How would you calculate
the average salary
per team?

Replace

COUNT(*)

with

AVG(salary).

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using GROUP BY.

Individual employees
would disappear.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

The count would become
the total employee count.

----------------------------------------------------------

❌ Joining unnecessarily.

Window functions
already solve the problem.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Analytics

• Organizational Reporting

• Workforce Planning

• Resource Allocation

• Team Performance Dashboards

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ COUNT() OVER() preserves row-level detail.

✔ PARTITION BY divides data into logical groups.

✔ Window functions often replace GROUP BY + JOIN.

✔ One of the simplest yet most important window function patterns.

✔ Frequently asked to test understanding of analytic functions.

===============================================================================
*/
