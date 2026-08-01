/*
===============================================================================
                          LEETCODE 1068
                     Product Sales Analysis I
===============================================================================

Difficulty    : Easy
Topics        : INNER JOIN
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

sale_id is the primary key.

----------------------------------------------------------

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| product_name| varchar |
+-------------+---------+

product_id is the primary key.

Write a solution to report:

• product_name
• year
• price

for every sale.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A retail company stores product information separately from sales
transactions.

Management wants a sales report displaying product names instead of
product IDs to make reports easier to understand.

As a Data Analyst, your task is to combine sales and product information.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Product Name

• Year

• Price

for every sales transaction.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ Primary Key

✔ Foreign Key

✔ Relational Databases

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    p.product_name,

    s.year,

    s.price

FROM Sales AS s

INNER JOIN Product AS p

ON s.product_id = p.product_id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Start with the Sales table.

It contains all sales transactions.

----------------------------------------------------------

Step 2

Join the Product table using

product_id.

----------------------------------------------------------

Step 3

Retrieve:

• Product Name

• Year

• Price

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Product

+------------+---------------+
| Product ID | Product Name  |
+------------+---------------+
| 100        | Laptop        |
| 101        | Mouse         |
+------------+---------------+

Sales

+---------+------------+------+-------+
| Sale ID | Product ID | Year | Price |
+---------+------------+------+-------+
| 1       | 100        | 2023 | 900   |
| 2       | 101        | 2024 | 30    |
+---------+------------+------+-------+

INNER JOIN

↓

+---------------+------+-------+
| Product Name  | Year | Price |
+---------------+------+-------+
| Laptop        | 2023 | 900   |
| Mouse         | 2024 | 30    |
+---------------+------+-------+

===============================================================================
EXPECTED OUTPUT
===============================================================================

+---------------+------+-------+
| product_name  | year | price |
+---------------+------+-------+
| Laptop        | 2023 | 900   |
| Mouse         | 2024 | 30    |
+---------------+------+-------+

===============================================================================
WHY INNER JOIN?
===============================================================================

Every sale references a valid product.

INNER JOIN combines matching records
from both tables.

Since every product_id in Sales exists
in Product,

all sales are returned.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    Product.product_name,

    Sales.year,

    Sales.price

FROM Product

JOIN Sales

USING(product_id);

USING() provides a shorter syntax when both
tables share the same column name.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Assuming product_id is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use INNER JOIN?

Because only matching records
are required.

----------------------------------------------------------

Q2. Could LEFT JOIN also work?

Yes.

Since every product_id has a match,
the result would be identical.

INNER JOIN is more appropriate.

----------------------------------------------------------

Q3. Why not store product_name
inside the Sales table?

To avoid data redundancy
and maintain normalization.

----------------------------------------------------------

Q4. What key connects both tables?

product_id

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Joining on sale_id.

Always join using

product_id.

----------------------------------------------------------

❌ Returning product_id
instead of product_name.

The question specifically asks
for product_name.

----------------------------------------------------------

❌ Forgetting the JOIN.

Product names cannot be retrieved
from the Sales table alone.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Sales Reporting

• Retail Analytics

• Inventory Systems

• ERP Reporting

• Business Intelligence

• Product Performance Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ INNER JOIN combines matching records.

✔ Foreign keys connect related tables.

✔ Normalize data to reduce redundancy.

✔ Always join using the correct key.

✔ One of the most common SQL JOIN interview questions.

===============================================================================
*/
