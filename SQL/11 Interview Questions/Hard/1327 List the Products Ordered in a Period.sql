/*
===============================================================================
                           LEETCODE 1327
                  List the Products Ordered in a Period
===============================================================================

Difficulty    : Hard
Topics        : JOIN, GROUP BY, SUM(), HAVING, Date Filtering
Companies     : Amazon, Walmart, Microsoft, Shopify, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| product_name  | varchar |
| product_category | varchar |
+---------------+---------+

product_id is the primary key.

----------------------------------------------------------

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+

There may be multiple orders
for the same product.

Write a solution to find products that sold

100 or more units

during

February 2020.

Return

• product_name

• unit

===============================================================================
BUSINESS SCENARIO
===============================================================================

An e-commerce company wants to identify
its best-selling products
during February 2020.

Only products selling at least

100 units

should appear in the monthly sales report.

This helps inventory planning,
marketing campaigns,
and demand forecasting.

===============================================================================
OBJECTIVE
===============================================================================

Return

• product_name

• total units sold

for products with

100 or more units

during February 2020.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ GROUP BY

✔ SUM()

✔ HAVING

✔ Date Filtering

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    p.product_name,

    SUM(o.unit) AS unit

FROM Products p

JOIN Orders o

ON p.product_id = o.product_id

WHERE

    o.order_date BETWEEN '2020-02-01'
                     AND '2020-02-29'

GROUP BY

    p.product_id,

    p.product_name

HAVING

    SUM(o.unit) >= 100;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join

Products

with

Orders.

----------------------------------------------------------

Step 2

Filter orders
placed during

February 2020.

----------------------------------------------------------

Step 3

Group by product.

----------------------------------------------------------

Step 4

Calculate

total units sold.

----------------------------------------------------------

Step 5

Keep only products
selling at least

100 units.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Laptop

40 Units

20 Units

50 Units

↓

SUM

110

↓

Included

----------------------------------

Mouse

30 Units

25 Units

↓

SUM

55

↓

Excluded

===============================================================================
EXPECTED OUTPUT
===============================================================================

+--------------+------+
| product_name | unit |
+--------------+------+
| Laptop       |110   |
| Keyboard     |135   |
+--------------+------+

===============================================================================
WHY HAVING?
===============================================================================

The filter depends on

SUM(unit),

which is calculated

after

GROUP BY.

HAVING filters
aggregated results.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A CTE can first calculate

monthly product sales,

then filter

WHERE unit >= 100.

Both solutions are correct.

The direct aggregation
is simpler.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each order
is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped product totals.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use HAVING instead of WHERE?

WHERE filters rows.

HAVING filters
aggregated groups.

----------------------------------------------------------

Q2. Why GROUP BY product?

Sales are summarized
per product.

----------------------------------------------------------

Q3. Why join Products?

To return

product_name

instead of product_id.

----------------------------------------------------------

Q4. How would you find
products selling

500 units

during March?

Replace

date range

and

SUM(unit) >= 500.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using WHERE SUM(unit).

Aggregate functions
cannot be used in WHERE.

----------------------------------------------------------

❌ Forgetting the February filter.

Sales from other months
would be included.

----------------------------------------------------------

❌ Grouping only by product_name.

Using the primary key
is safer and more reliable.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Monthly Sales Reports

• Inventory Planning

• Product Performance Analysis

• Demand Forecasting

• Retail Analytics

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY summarizes sales.

✔ SUM() calculates total units sold.

✔ HAVING filters aggregated values.

✔ Date filtering is essential in reporting.

✔ A classic SQL reporting interview question.

===============================================================================
*/
