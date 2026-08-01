/*
===============================================================================
                           LEETCODE 570
               Managers with at Least Five Direct Reports
===============================================================================

Difficulty    : Medium
Topics        : SELF JOIN, GROUP BY, HAVING
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+

id is the primary key.

Each employee has an ID and may report to another employee
whose ID is stored in managerId.

Write a solution to find managers with at least five direct reports.

Return the manager names.

===============================================================================
BUSINESS SCENARIO
===============================================================================

The HR department wants to identify managers who supervise
large teams.

Managers with at least five direct reports will be enrolled
in leadership training and organizational planning programs.

As a Data Analyst, your task is to generate this report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Manager Name

for managers having

5 or more direct reports.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ SELF JOIN

✔ GROUP BY

✔ HAVING

✔ COUNT()

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    m.name

FROM Employee AS e

INNER JOIN Employee AS m

ON e.managerId = m.id

GROUP BY

    m.id,

    m.name

HAVING

    COUNT(e.id) >= 5;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join Employee with itself.

----------------------------------------------------------

Employee

↓

Manager

----------------------------------------------------------

Step 2

Each employee is matched with
their manager.

----------------------------------------------------------

Step 3

Group records by manager.

----------------------------------------------------------

Step 4

Count the number of employees
reporting to each manager.

----------------------------------------------------------

Step 5

Return managers having at least
five direct reports.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee Table

+-------+-----------+
| Name  | ManagerId |
+-------+-----------+
| Alice | 10        |
| Bob   | 10        |
| Emma  | 10        |
| John  | 10        |
| Mike  | 10        |
| Sara  | 20        |
+-------+-----------+

Manager

10

↓

5 Employees

✔ Include

Manager

20

↓

1 Employee

✘ Exclude

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------+
| name  |
+-------+
| David |
+-------+

===============================================================================
WHY SELF JOIN?
===============================================================================

Managers and employees are stored
in the same table.

A SELF JOIN connects employees
with their managers.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    name

FROM Employee

WHERE id IN
(
    SELECT

        managerId

    FROM Employee

    WHERE managerId IS NOT NULL

    GROUP BY

        managerId

    HAVING

        COUNT(*) >= 5
);

This solution avoids an explicit SELF JOIN,
but the SELF JOIN version is generally easier
to understand.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Assuming managerId is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped manager records.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use SELF JOIN?

Employees and managers are stored
in the same table.

----------------------------------------------------------

Q2. Why GROUP BY manager?

To count direct reports
for each manager.

----------------------------------------------------------

Q3. Why COUNT(e.id)?

It counts employees reporting
to each manager.

----------------------------------------------------------

Q4. How would you find managers
with at least ten reports?

Simply replace

COUNT(e.id) >= 5

with

COUNT(e.id) >= 10

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Joining on employee ID.

Always join

managerId = id.

----------------------------------------------------------

❌ Forgetting GROUP BY.

COUNT() would calculate
the total number of employees.

----------------------------------------------------------

❌ Counting manager rows.

Always count employee IDs.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Reporting

• Organizational Hierarchies

• Leadership Dashboards

• Workforce Planning

• Organizational Charts

• Employee Management Systems

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SELF JOIN relates employees to managers.

✔ GROUP BY summarizes manager teams.

✔ HAVING filters aggregated groups.

✔ COUNT() measures team size.

✔ A classic SQL hierarchy interview question.

===============================================================================
*/
