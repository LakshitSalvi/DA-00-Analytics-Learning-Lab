/*
===============================================================================
                           LEETCODE 579
                 Find Cumulative Salary of an Employee
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, SUM(), ROWS BETWEEN
Companies     : Amazon, Google, Microsoft, Oracle, SAP

===============================================================================
QUESTION
===============================================================================

Table: Employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| month         | int     |
| salary        | int     |
+---------------+---------+

(id, month) is the primary key.

Each row represents an employee's salary
for a given month.

Write a solution to calculate the cumulative salary
for every employee.

The cumulative salary is defined as the total salary
earned during the current month and the previous
two months.

Do NOT include the employee's latest month.

Return the result ordered by

id ASC

month DESC.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An HR department wants to analyze payroll trends.

Instead of viewing monthly salaries individually,
management wants a rolling three-month salary
for each employee.

Since the latest month's payroll is still under review,
it should not be included in the report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• id

• month

• Salary

where Salary represents the cumulative salary over
the current and previous two months,
excluding each employee's latest month.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Window Functions

✔ SUM() OVER()

✔ ROWS BETWEEN

✔ MAX()

✔ Common Table Expressions (CTEs)

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH EmployeeSalary AS
(
    SELECT

        id,

        month,

        salary,

        MAX(month)

        OVER
        (
            PARTITION BY id
        ) AS latest_month,

        SUM(salary)

        OVER
        (
            PARTITION BY id

            ORDER BY month

            ROWS BETWEEN 2 PRECEDING
                     AND CURRENT ROW
        ) AS cumulative_salary

    FROM Employee
)

SELECT

    id,

    month,

    cumulative_salary AS Salary

FROM EmployeeSalary

WHERE

    month <> latest_month

ORDER BY

    id,

    month DESC;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Partition salaries
by employee.

----------------------------------------------------------

Step 2

Find each employee's
latest month.

----------------------------------------------------------

Step 3

Use

ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW

to compute the rolling
3-month salary.

----------------------------------------------------------

Step 4

Exclude the latest month.

----------------------------------------------------------

Step 5

Sort by

Employee

then

Month DESC.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Employee

Month

1

Salary

1000

↓

1000

------------------------

Month

2

Salary

1200

↓

2200

------------------------

Month

3

Salary

1100

↓

3300

------------------------

Month

4

Salary

1300

↓

3600

↓

Excluded

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+-------+--------+
| id | month | Salary |
+----+-------+--------+
| 1  | 3     | 3300   |
| 1  | 2     | 2200   |
| 1  | 1     | 1000   |
+----+-------+--------+

===============================================================================
WHY ROWS BETWEEN?
===============================================================================

ROWS BETWEEN

creates a sliding window.

Only the current row
and previous two rows
are included.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A correlated subquery can calculate
the previous three months,

but window functions are
far more efficient.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting by employee and month
dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MAX(month)?

To identify the latest month
for each employee.

----------------------------------------------------------

Q2. Why exclude the latest month?

The problem explicitly requires it.

----------------------------------------------------------

Q3. Why use

ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW?

It creates a rolling
3-month window.

----------------------------------------------------------

Q4. How would you calculate
a 6-month cumulative salary?

Replace

2 PRECEDING

with

5 PRECEDING.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting to exclude
the latest month.

----------------------------------------------------------

❌ Using GROUP BY.

Window functions preserve
individual rows.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

Employees would be combined
into one running total.

----------------------------------------------------------

❌ Ordering by salary
instead of month.

Running totals must follow
chronological order.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Payroll Analytics

• Rolling Revenue Reports

• Budget Tracking

• Financial Dashboards

• Subscription Revenue Analysis

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SUM() OVER() computes rolling totals.

✔ ROWS BETWEEN defines sliding windows.

✔ MAX() OVER() identifies the latest record.

✔ Window functions preserve row-level detail.

✔ Rolling calculations are common in analytics
and finance interviews.

===============================================================================
*/
