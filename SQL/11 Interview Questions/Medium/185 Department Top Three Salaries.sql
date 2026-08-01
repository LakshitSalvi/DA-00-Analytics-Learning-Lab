/*
===============================================================================
                           LEETCODE 185
                    Department Top Three Salaries
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, DENSE_RANK(), JOIN
Companies     : Amazon, Google, Microsoft, Meta, Uber

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

Write a solution to find employees whose salaries are among the top
three distinct salaries in each department.

Return:

• Department
• Employee
• Salary

===============================================================================
BUSINESS SCENARIO
===============================================================================

The HR department wants to recognize the highest-paid employees across
every department.

Instead of only identifying the highest salary, management wants the
top three salary levels within each department.

If multiple employees share the same salary, they should all be included.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Department

• Employee

• Salary

for employees whose salary ranks within the top three
distinct salaries of their department.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Window Functions

✔ DENSE_RANK()

✔ PARTITION BY

✔ INNER JOIN

✔ Ranking

===============================================================================
SQL SOLUTION
===============================================================================
*/

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

    FROM Employee AS e

    INNER JOIN Department AS d

    ON e.departmentId = d.id

) AS RankedEmployees

WHERE

    SalaryRank <= 3;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join Employee and Department.

----------------------------------------------------------

Step 2

Partition employees by department.

Each department gets its own ranking.

----------------------------------------------------------

Step 3

Rank salaries in descending order.

Employees with identical salaries
receive the same rank.

----------------------------------------------------------

Step 4

Keep only ranks

1

2

3

===============================================================================
VISUAL REPRESENTATION
===============================================================================

IT Department

+----------+--------+
| Employee | Salary |
+----------+--------+
| Alice    | 90000  |
| Bob      | 90000  |
| Emma     | 85000  |
| John     | 80000  |
| Mike     | 70000  |
+----------+--------+

DENSE_RANK()

90000

↓

Rank 1

90000

↓

Rank 1

85000

↓

Rank 2

80000

↓

Rank 3

70000

↓

Rank 4

Result

Alice

Bob

Emma

John

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Alice    | 90000  |
| IT         | Bob      | 90000  |
| IT         | Emma     | 85000  |
| IT         | John     | 80000  |
+------------+----------+--------+

===============================================================================
WHY DENSE_RANK()?
===============================================================================

The problem asks for the

top three DISTINCT salaries.

Employees sharing the same salary
must receive the same rank.

DENSE_RANK()

handles this automatically.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    d.name AS Department,

    e.name AS Employee,

    e.salary

FROM Employee e

JOIN Department d

ON e.departmentId = d.id

WHERE 3 >

(
    SELECT COUNT(DISTINCT salary)

    FROM Employee e2

    WHERE

        e2.departmentId = e.departmentId

    AND e2.salary > e.salary
);

This correlated subquery works in databases
without window function support,
but is slower.

===============================================================================
DENSE_RANK vs RANK
===============================================================================

Salaries

100

100

90

80

------------------------

RANK()

1

1

3

4

------------------------

DENSE_RANK()

1

1

2

3

Only DENSE_RANK()

returns the correct Top-3 distinct salaries.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Ranking requires sorting within each department.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For ranking partitions.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use PARTITION BY?

It restarts ranking for each department.

----------------------------------------------------------

Q2. Why DENSE_RANK() instead of RANK()?

Because the problem requires
distinct salary rankings without gaps.

----------------------------------------------------------

Q3. What if the question asked
for Top 5 salaries?

Change

SalaryRank <= 3

to

SalaryRank <= 5

----------------------------------------------------------

Q4. Can this be solved without
window functions?

Yes.

A correlated subquery can solve it,
although it is less efficient.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using ROW_NUMBER().

Employees with equal salaries
receive different rankings.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

Ranking would occur across the entire company
instead of each department.

----------------------------------------------------------

❌ Using RANK().

Gaps in ranking may exclude valid employees.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Salary Reports

• Employee Reward Programs

• Sales Leaderboards

• Customer Rankings

• Regional Performance Dashboards

• Business Intelligence Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ PARTITION BY creates separate rankings.

✔ DENSE_RANK() handles salary ties correctly.

✔ Window functions simplify Top-N problems.

✔ Top-N per group is one of the most common SQL interview patterns.

✔ One of the highest-frequency Medium SQL interview questions.

===============================================================================
*/
