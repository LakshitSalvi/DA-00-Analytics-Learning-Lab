/*
===============================================================================
                           LEETCODE 1070
                     Product Sales Analysis III
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, ROW_NUMBER(), JOIN
Companies     : Amazon, Google, Microsoft, Walmart, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Sales

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sale_id     | int     |
| product_id  | int     |
| year        | int     |
| quantity    | int     |
| price       | int     |
+-------------+---------+

(sale_id, year) is the primary key.

Each row represents one sale of a product.

Write a solution to report:

• product_id
• first_year
• quantity
• price

for the first year each product was sold.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A retail company wants to analyze product launches.

Management needs to know each product's first selling year,
along with the quantity sold and selling price during that first year.

This helps evaluate launch performance.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Product ID

• First Selling Year

• Quantity Sold

• Price

for each product's earliest sale.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ ROW_NUMBER()

✔ PARTITION BY

✔ ORDER BY

✔ Window Functions

✔ First Record Per Group

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    product_id,

    year AS first_year,

    quantity,

    price

FROM
(
    SELECT

        product_id,

        year,

        quantity,

        price,

        ROW_NUMBER()

        OVER
        (
            PARTITION BY product_id
            ORDER BY year
        ) AS SaleRank

    FROM Sales

) AS RankedSales

WHERE

    SaleRank = 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Partition the sales by product.

----------------------------------------------------------

Step 2

Sort each product's sales
by year in ascending order.

----------------------------------------------------------

Step 3

Assign

ROW_NUMBER().

----------------------------------------------------------

Step 4

Keep only

SaleRank = 1.

This represents the first sale
of each product.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Sales

+---------+------+----------+-------+
| Product | Year | Quantity | Price |
+---------+------+----------+-------+
| 1       | 2018 | 20       | 100   |
| 1       | 2019 | 30       | 120   |
| 2       | 2017 | 15       | 80    |
| 2       | 2018 | 25       | 90    |
+---------+------+----------+-------+

ROW_NUMBER()

Product 1

2018 → 1

2019 → 2

------------------------

Product 2

2017 → 1

2018 → 2

↓

Keep Rank = 1

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+
| 1          | 2018       | 20       | 100   |
| 2          | 2017       | 15       | 80    |
+------------+------------+----------+-------+

===============================================================================
WHY ROW_NUMBER()?
===============================================================================

ROW_NUMBER()

assigns sequential numbers within
each product.

The first row always represents
the earliest sale.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    s.product_id,

    s.year AS first_year,

    s.quantity,

    s.price

FROM Sales s

INNER JOIN
(
    SELECT

        product_id,

        MIN(year) AS first_year

    FROM Sales

    GROUP BY product_id

) f

ON s.product_id = f.product_id

AND s.year = f.first_year;

This solution uses MIN() instead of
window functions.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting within each product
dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For ranking operations.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use ROW_NUMBER()?

To identify the first sale
within each product.

----------------------------------------------------------

Q2. Why PARTITION BY?

Each product should have
its own ranking sequence.

----------------------------------------------------------

Q3. Can MIN(year) solve this problem?

Yes.

However,

ROW_NUMBER() is more flexible
for retrieving complete rows.

----------------------------------------------------------

Q4. What if the requirement changes to
the latest sale?

Simply change

ORDER BY year

to

ORDER BY year DESC.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting PARTITION BY.

Ranking would occur across
all products.

----------------------------------------------------------

❌ Using RANK().

ROW_NUMBER() guarantees
exactly one first row.

----------------------------------------------------------

❌ Returning only MIN(year).

The problem also requires
quantity and price.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Product Launch Analysis

• Customer First Purchase Reports

• Employee Joining Records

• Subscription Analytics

• Sales Performance Reporting

• Business Intelligence Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ ROW_NUMBER() identifies the first row in each group.

✔ PARTITION BY creates independent rankings.

✔ Window functions simplify first/last record problems.

✔ This pattern is extremely common in analytics.

✔ One of the most frequently asked SQL interview questions.

===============================================================================
*/
