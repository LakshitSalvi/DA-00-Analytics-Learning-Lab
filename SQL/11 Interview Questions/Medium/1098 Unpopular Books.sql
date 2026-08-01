/*
===============================================================================
                           LEETCODE 1098
                           Unpopular Books
===============================================================================

Difficulty    : Medium
Topics        : LEFT JOIN, GROUP BY, SUM(), Date Functions
Companies     : Amazon, Google, Microsoft, Meta, Apple

===============================================================================
QUESTION
===============================================================================

Table: Books

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| book_id        | int     |
| name           | varchar |
| available_from | date    |
+----------------+---------+

book_id is the primary key.

----------------------------------------------------------

Table: Orders

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| order_id     | int     |
| book_id      | int     |
| quantity     | int     |
| dispatch_date| date    |
+--------------+---------+

order_id is the primary key.

Write a solution to report books that:

• have been available for at least one month before
  2019-06-23

AND

• sold less than 10 copies during the previous year.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A bookstore wants to identify books that are not selling well.

Only books that have been available long enough should be evaluated.

Recently launched books should not be included because they haven't had
enough time to generate sales.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• book_id

• name

for books with

Total Sales < 10

during the previous year.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ LEFT JOIN

✔ GROUP BY

✔ SUM()

✔ IFNULL()

✔ Date Filtering

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    b.book_id,

    b.name

FROM Books AS b

LEFT JOIN Orders AS o

ON b.book_id = o.book_id

AND o.dispatch_date BETWEEN DATE_SUB('2019-06-23', INTERVAL 1 YEAR)
                        AND '2019-06-23'

WHERE

    b.available_from <= DATE_SUB('2019-06-23', INTERVAL 1 MONTH)

GROUP BY

    b.book_id,

    b.name

HAVING

    IFNULL(SUM(o.quantity),0) < 10;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Select books available for at least one month.

----------------------------------------------------------

Step 2

LEFT JOIN Orders.

Only orders from the previous year
are included.

----------------------------------------------------------

Step 3

Group by each book.

----------------------------------------------------------

Step 4

Calculate total copies sold.

----------------------------------------------------------

Step 5

Return books whose total sales
are less than 10.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Books

Book A

↓

15 Copies

✘ Exclude

------------------------

Book B

↓

7 Copies

✔ Include

------------------------

Book C

↓

No Orders

↓

0 Copies

✔ Include

===============================================================================
EXPECTED OUTPUT
===============================================================================

+---------+--------------+
| book_id | name         |
+---------+--------------+
| 2       | SQL Basics   |
| 5       | Python Intro |
+---------+--------------+

===============================================================================
WHY LEFT JOIN?
===============================================================================

Books with no sales

must still appear.

LEFT JOIN preserves every book.

IFNULL()

treats missing sales as zero.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A Common Table Expression (CTE) can be used
to calculate yearly sales first and then join
the aggregated results back to Books.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped sales totals.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use LEFT JOIN?

Books without sales must still appear.

----------------------------------------------------------

Q2. Why IFNULL(SUM(),0)?

SUM() returns NULL
when no matching orders exist.

----------------------------------------------------------

Q3. Why filter inside the JOIN?

It limits the joined orders
to the previous year.

----------------------------------------------------------

Q4. Why GROUP BY?

Sales must be calculated
for each book separately.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using INNER JOIN.

Books with zero sales disappear.

----------------------------------------------------------

❌ Forgetting IFNULL().

Books without orders produce NULL
instead of zero.

----------------------------------------------------------

❌ Filtering dates in WHERE.

Doing so would effectively convert
the LEFT JOIN into an INNER JOIN.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Inventory Analysis

• Product Performance Reports

• Slow-moving Inventory Detection

• Retail Analytics

• Publishing Dashboards

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ LEFT JOIN preserves unmatched records.

✔ SUM() calculates total sales.

✔ IFNULL() converts NULL to zero.

✔ Date filters inside JOIN preserve LEFT JOIN behavior.

✔ A common SQL reporting interview pattern.

===============================================================================
*/
