/*
===============================================================================
                           LEETCODE 176
                        Second Highest Salary
===============================================================================

Difficulty    : Medium
Topics        : Aggregate Functions, Subquery, LIMIT, OFFSET
Companies     : Amazon, Google, Microsoft, Meta, Apple

===============================================================================
QUESTION
===============================================================================

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| salary      | int     |
+-------------+---------+

id is the primary key.

Write a solution to find the second highest distinct salary.

If there is no second highest salary,

return NULL.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company's HR department wants to identify the employee salary that ranks
second among all distinct salaries.

This report is used for compensation benchmarking and salary analysis.

If every employee earns the same salary,
the report should return NULL.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• SecondHighestSalary

containing the second highest DISTINCT salary.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ DISTINCT

✔ ORDER BY

✔ LIMIT

✔ OFFSET

✔ Subqueries

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

(
    SELECT DISTINCT

        salary

    FROM Employee

    ORDER BY

        salary DESC

    LIMIT 1 OFFSET 1

) AS SecondHighestSalary;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Remove duplicate salaries using DISTINCT.

----------------------------------------------------------

Step 2

Sort salaries in descending order.

----------------------------------------------------------

Step 3

Skip the highest salary.

OFFSET 1

----------------------------------------------------------

Step 4

Return the next salary.

LIMIT 1

----------------------------------------------------------

If no second salary exists,

the subquery returns NULL automatically.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee

+----+--------+
| id | salary |
+----+--------+
| 1  | 80000  |
| 2  | 90000  |
| 3  | 70000  |
| 4  | 90000  |
+----+--------+

DISTINCT

↓

90000

80000

70000

↓

OFFSET 1

↓

80000

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----------------------+
| SecondHighestSalary  |
+----------------------+
| 80000                |
+----------------------+

===============================================================================
WHY DISTINCT?
===============================================================================

The problem asks for the second highest

DISTINCT

salary.

Duplicate salary values should only be counted once.

===============================================================================
ALTERNATIVE SOLUTION (DENSE_RANK)
===============================================================================

SELECT

    MAX(salary) AS SecondHighestSalary

FROM
(
    SELECT

        salary,

        DENSE_RANK()

        OVER
        (
            ORDER BY salary DESC
        ) AS SalaryRank

    FROM Employee

) AS RankedSalaries

WHERE SalaryRank = 2;

This approach is preferred in modern SQL databases
that support window functions.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting dominates the execution time.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For sorting distinct salaries.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use DISTINCT?

Duplicate salaries should only be counted once.

----------------------------------------------------------

Q2. Why wrap the query inside a subquery?

To return NULL when no second highest salary exists.

----------------------------------------------------------

Q3. Can DENSE_RANK() solve this problem?

Yes.

It is a common modern SQL solution.

----------------------------------------------------------

Q4. What happens if all employees have the same salary?

The query returns NULL.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting DISTINCT.

Duplicate salaries would affect the ranking.

----------------------------------------------------------

❌ Using LIMIT 1,1 without understanding OFFSET.

LIMIT 1 OFFSET 1

is more readable and ANSI-style.

----------------------------------------------------------

❌ Returning no rows instead of NULL.

The problem explicitly requires NULL.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Salary Benchmarking

• Compensation Analysis

• Employee Payroll Reports

• HR Dashboards

• Financial Analytics

• Executive Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ DISTINCT removes duplicate salaries.

✔ ORDER BY DESC ranks salaries.

✔ OFFSET skips rows.

✔ LIMIT selects the required row.

✔ DENSE_RANK() is the preferred modern solution.

✔ One of the most frequently asked Medium SQL interview questions.

===============================================================================
*/
