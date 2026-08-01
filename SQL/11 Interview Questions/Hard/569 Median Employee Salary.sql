/*
===============================================================================
                           LEETCODE 569
                       Median Employee Salary
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, ROW_NUMBER(), COUNT() OVER()
Companies     : Google, Amazon, Microsoft, Meta, Bloomberg

===============================================================================
QUESTION
===============================================================================

Table: Employee

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| company       | varchar |
| salary        | int     |
+---------------+---------+

id is the primary key.

Write a solution to find the median salary of each company.

If the number of employees is odd,
return the middle employee.

If the number of employees is even,
return the two middle employees.

Return:

• id

• company

• salary

===============================================================================
BUSINESS SCENARIO
===============================================================================

An HR analytics team wants to determine the median salary
within every company.

Unlike averages, the median is not affected by extremely
high or low salaries, making it a better indicator of
typical employee compensation.

===============================================================================
OBJECTIVE
===============================================================================

Return the employee(s) whose salary represents
the median salary of each company.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ ROW_NUMBER()

✔ COUNT() OVER()

✔ PARTITION BY

✔ Window Functions

✔ Median Calculation

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH RankedEmployees AS
(
    SELECT

        id,

        company,

        salary,

        ROW_NUMBER()

        OVER
        (
            PARTITION BY company
            ORDER BY salary, id
        ) AS row_num,

        COUNT(*)

        OVER
        (
            PARTITION BY company
        ) AS total_rows

    FROM Employee
)

SELECT

    id,

    company,

    salary

FROM RankedEmployees

WHERE

    row_num BETWEEN

    (total_rows + 1) / 2

    AND

    (total_rows + 2) / 2;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Partition employees
by company.

----------------------------------------------------------

Step 2

Sort employees by

Salary

then

ID.

----------------------------------------------------------

Step 3

Assign

ROW_NUMBER()

within each company.

----------------------------------------------------------

Step 4

Count the total number
of employees.

----------------------------------------------------------

Step 5

Odd Employees

Example

5 Employees

↓

Median Position

3

----------------------------------------------------------

Even Employees

Example

6 Employees

↓

Median Positions

3

4

----------------------------------------------------------

Return employees
whose row numbers
fall between

(total_rows + 1) / 2

and

(total_rows + 2) / 2.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Company A

1000

1500

2000

2500

3000

↓

ROW_NUMBER()

1

2

3

4

5

↓

Median

2000

----------------------------------------------------------

Company B

1000

2000

3000

4000

↓

ROW_NUMBER()

1

2

3

4

↓

Median

2000

3000

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+---------+--------+
| id | company | salary |
+----+---------+--------+
| 5  | Google  | 70000  |
| 8  | Amazon  | 65000  |
| 9  | Amazon  | 70000  |
+----+---------+--------+

===============================================================================
WHY ROW_NUMBER()?
===============================================================================

ROW_NUMBER()

assigns an ordered position
to every employee.

Once positions are known,

finding the median
becomes straightforward.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

DENSE_RANK()

or

RANK()

cannot solve this problem reliably.

ROW_NUMBER()

is required because every row
must have a unique position.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting salaries dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use ROW_NUMBER()?

Median depends on ordered positions.

----------------------------------------------------------

Q2. Why COUNT() OVER()?

To determine whether
the group size is odd or even.

----------------------------------------------------------

Q3. Why sort by id
after salary?

To ensure deterministic ordering
when salaries are equal.

----------------------------------------------------------

Q4. Can AVG() calculate
the median?

No.

Average and median
are different statistical measures.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using AVG(salary).

The problem asks
for the median,
not the average.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

Employees from different companies
would be mixed together.

----------------------------------------------------------

❌ Using RANK().

Duplicate salaries
can create skipped rankings.

ROW_NUMBER() is required.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• HR Salary Analysis

• Compensation Benchmarking

• Payroll Dashboards

• Financial Analytics

• Workforce Planning

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ ROW_NUMBER() assigns ordered positions.

✔ COUNT() OVER() determines group size.

✔ Median calculations rely on row positions.

✔ Window functions simplify statistical analysis.

✔ One of the most famous Hard SQL interview questions.

===============================================================================
*/
