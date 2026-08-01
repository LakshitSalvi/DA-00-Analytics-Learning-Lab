/*
===============================================================================
                           LEETCODE 1270
                 All People Report to the Given Manager
===============================================================================

Difficulty    : Hard
Topics        : Recursive CTE, Hierarchical Queries, Self Join
Companies     : Google, Amazon, Microsoft, Oracle, SAP

===============================================================================
QUESTION
===============================================================================

Table: Employees

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| employee_id   | int     |
| employee_name | varchar |
| manager_id    | int     |
+---------------+---------+

employee_id is the primary key.

manager_id is the employee_id
of the employee's direct manager.

The CEO has

manager_id = 1.

Write a solution to find all employees
who report directly or indirectly
to the manager with

employee_id = 1.

Do NOT include the manager.

Return

employee_id.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A large organization wants to identify every employee
under a particular executive.

Employees may report directly
or through multiple management levels.

HR needs a complete organizational hierarchy
for workforce planning and reporting.

===============================================================================
OBJECTIVE
===============================================================================

Return

• employee_id

of every employee
reporting directly or indirectly
to manager

1.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Recursive Common Table Expressions (Recursive CTE)

✔ Self Join

✔ Hierarchical Queries

✔ Tree Traversal

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH RECURSIVE EmployeeHierarchy AS
(
    SELECT

        employee_id,

        manager_id

    FROM Employees

    WHERE manager_id = 1

    UNION ALL

    SELECT

        e.employee_id,

        e.manager_id

    FROM Employees e

    JOIN EmployeeHierarchy h

    ON e.manager_id = h.employee_id
)

SELECT

    employee_id

FROM EmployeeHierarchy

ORDER BY

    employee_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Find employees
whose direct manager is

1.

----------------------------------------------------------

Step 2

Repeatedly find employees
reporting to those employees.

----------------------------------------------------------

Step 3

Continue until
no more subordinates exist.

----------------------------------------------------------

Step 4

Return every discovered employee.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

CEO (1)

│

├── Alice (2)

│   ├── Emma (4)

│   │   └── John (6)

│   └── David (5)

│

└── Bob (3)

↓

Answer

2

3

4

5

6

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------+
| employee_id |
+-------------+
| 2           |
| 3           |
| 4           |
| 5           |
| 6           |
+-------------+

===============================================================================
WHY RECURSIVE CTE?
===============================================================================

The number of reporting levels
is unknown.

Recursive CTEs repeatedly
follow manager relationships
until no more employees exist.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

Without recursive CTEs,

multiple self joins

would be required.

That only works when
the hierarchy depth
is known beforehand.

Recursive CTEs are the preferred solution.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each employee
is visited once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For storing the hierarchy.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why Recursive CTE?

The reporting hierarchy
has an unknown depth.

----------------------------------------------------------

Q2. Why UNION ALL?

Every employee
should be included.

Duplicate removal
is unnecessary.

----------------------------------------------------------

Q3. Can this return
employee names?

Yes.

Include

employee_name

in both parts
of the recursive query.

----------------------------------------------------------

Q4. What if the manager
changes from

1

to

25?

Replace

WHERE manager_id = 1

with

WHERE manager_id = 25.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting RECURSIVE.

The query will fail.

----------------------------------------------------------

❌ Using UNION
instead of UNION ALL.

UNION performs unnecessary
duplicate elimination.

----------------------------------------------------------

❌ Joining
employee_id = employee_id.

The join should match

manager_id

to

employee_id.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Organizational Charts

• HR Reporting

• Company Hierarchies

• Folder Structures

• Bill of Materials (BOM)

• Category Trees

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Recursive CTEs solve hierarchical problems.

✔ Self joins model parent-child relationships.

✔ Tree traversal is a common SQL interview topic.

✔ Unknown hierarchy depth requires recursion.

✔ One of the most important recursive SQL interview questions.

===============================================================================
*/
