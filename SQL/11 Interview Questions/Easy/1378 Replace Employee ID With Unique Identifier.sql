/*
===============================================================================
                          LEETCODE 1378
               Replace Employee ID With Unique Identifier
===============================================================================

Difficulty    : Easy
Topics        : LEFT JOIN
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Employees

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

id is the primary key.

----------------------------------------------------------

Table: EmployeeUNI

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| unique_id   | int     |
+-------------+---------+

(id, unique_id) is the primary key.

Each employee may or may not have a unique identifier.

Write a solution to show the unique ID of each employee.

If an employee does not have a unique ID,
display NULL instead.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company is migrating from an old HR system to a new identity management
system.

Some employees have already been assigned a unique identifier,
while others are still pending.

Management wants a report listing every employee along with their
assigned unique identifier.

As a Data Analyst, your task is to prepare this report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• unique_id

• name

Include every employee, even if a unique ID has not been assigned.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ LEFT JOIN

✔ NULL Handling

✔ Primary Key

✔ Foreign Key

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    eu.unique_id,

    e.name

FROM Employees AS e

LEFT JOIN EmployeeUNI AS eu

ON e.id = eu.id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Start with the Employees table.

Every employee should appear in the result.

----------------------------------------------------------

Step 2

LEFT JOIN the EmployeeUNI table
using the employee ID.

----------------------------------------------------------

Step 3

If a matching unique ID exists,

it is displayed.

Otherwise,

NULL is returned.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employees

+----+-------+
| id | name  |
+----+-------+
| 1  | Alice |
| 2  | Bob   |
| 3  | Emma  |
+----+-------+

EmployeeUNI

+----+-----------+
| id | unique_id |
+----+-----------+
| 1  | 101       |
| 3  | 103       |
+----+-----------+

LEFT JOIN

↓

+-----------+-------+
| unique_id | name  |
+-----------+-------+
| 101       | Alice |
| NULL      | Bob   |
| 103       | Emma  |
+-----------+-------+

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------+-------+
| unique_id | name  |
+-----------+-------+
| 101       | Alice |
| NULL      | Bob   |
| 103       | Emma  |
+-----------+-------+

===============================================================================
WHY LEFT JOIN?
===============================================================================

The problem requires every employee to appear.

Employees without a matching record
in EmployeeUNI should still be included.

LEFT JOIN preserves all rows
from the Employees table.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    u.unique_id,

    e.name

FROM EmployeeUNI u

RIGHT JOIN Employees e

ON u.id = e.id;

Although correct,

LEFT JOIN is generally preferred because it is
more readable and widely supported.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Assuming id is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use LEFT JOIN?

Because every employee must appear,
even if they don't have a unique ID.

----------------------------------------------------------

Q2. Why not use INNER JOIN?

INNER JOIN would exclude employees
without matching records.

----------------------------------------------------------

Q3. Why is NULL returned?

NULL indicates that no matching
unique identifier exists.

----------------------------------------------------------

Q4. Can RIGHT JOIN solve this problem?

Yes.

However,

LEFT JOIN is generally preferred
for readability.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using INNER JOIN.

Employees without unique IDs disappear.

----------------------------------------------------------

❌ Joining on unique_id.

The correct join column is

id.

----------------------------------------------------------

❌ Assuming every employee has
a unique identifier.

The problem explicitly states
that some may not.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Information Systems

• Employee Identity Management

• Access Control Systems

• ERP Migration

• Employee Master Data

• Organizational Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ LEFT JOIN preserves all employees.

✔ NULL represents missing identifiers.

✔ Join tables using the common key.

✔ Understand when to use LEFT JOIN over INNER JOIN.

✔ A classic SQL interview problem involving optional relationships.

===============================================================================
*/
