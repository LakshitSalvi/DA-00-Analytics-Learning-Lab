/*
===============================================================================
                             LEETCODE 181
                 Employees Earning More Than Their Managers
===============================================================================

Difficulty    : Easy
Topics        : SELF JOIN, INNER JOIN
Companies     : Amazon, Google, Microsoft, Meta, Deloitte

===============================================================================
QUESTION
===============================================================================

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+

id is the primary key.

Each employee has an ID, salary, and the ID of their manager.

Write a solution to find employees whose salary is strictly higher than
their manager's salary.

Return the employee's name.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company wants to review salary structures across departments.

Management wants to identify employees who earn more than their direct
manager so they can verify whether these salary differences are intentional.

As a Data Analyst in HR, your task is to generate this report.

===============================================================================
OBJECTIVE
===============================================================================

Return the names of employees whose salary is greater than
their direct manager's salary.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ SELF JOIN

✔ INNER JOIN

✔ Table Aliases

✔ Comparison Operators

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    e.name AS Employee

FROM Employee AS e

INNER JOIN Employee AS m

ON e.managerId = m.id

WHERE e.salary > m.salary;

/*
===============================================================================
EXPLANATION
===============================================================================

Since both employees and managers are stored in the same table,

we need to join the Employee table with itself.

----------------------------------------------------------

Alias "e"

Represents the Employee.

----------------------------------------------------------

Alias "m"

Represents the Manager.

----------------------------------------------------------

Join Condition

e.managerId = m.id

This connects every employee with their manager.

----------------------------------------------------------

Filter

Only keep employees whose salary is greater than
their manager's salary.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee Table

+----+--------+--------+-----------+
| id | name   | salary | managerId |
+----+--------+--------+-----------+
| 1  | Joe    | 70000  | 3         |
| 2  | Henry  | 80000  | 4         |
| 3  | Sam    | 60000  | NULL      |
| 4  | Max    | 90000  | NULL      |
+----+--------+--------+-----------+

Self Join

Joe   --------> Sam

Henry --------> Max

Compare

70000 > 60000 ✔

80000 > 90000 ✘

Result

Joe

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----------+
| Employee |
+----------+
| Joe      |
+----------+

===============================================================================
WHY SELF JOIN?
===============================================================================

The manager information exists in the same table.

Instead of joining two different tables,

we join Employee with itself.

This is called a SELF JOIN.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    e.name AS Employee

FROM Employee e, Employee m

WHERE e.managerId = m.id

AND e.salary > m.salary;

Although valid,

explicit JOIN syntax is recommended because it is easier to read
and maintain.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming the primary key is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why is this called a SELF JOIN?

Because the table is joined with itself.

----------------------------------------------------------

Q2. Why are aliases required?

Without aliases,

SQL cannot distinguish between the employee and manager rows.

----------------------------------------------------------

Q3. Can a manager have NULL managerId?

Yes.

Top-level managers (CEO, Director, etc.) usually have NULL managerId.

----------------------------------------------------------

Q4. Which JOIN should be used?

INNER JOIN

because employees without managers cannot satisfy the condition.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Joining on salary.

Always join using

managerId = id

----------------------------------------------------------

❌ Forgetting aliases.

Both references point to the same table.

Aliases are mandatory for clarity.

----------------------------------------------------------

❌ Comparing IDs instead of salaries.

Correct comparison:

employee.salary > manager.salary

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Salary Audits

• Organizational Hierarchies

• Payroll Analysis

• Compensation Reviews

• Employee Reporting Structures

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SELF JOIN compares rows within the same table.

✔ Table aliases make SELF JOINs readable.

✔ Join using managerId = id.

✔ Compare employee salary with manager salary.

✔ One of the most common SELF JOIN interview questions.

===============================================================================
*/
