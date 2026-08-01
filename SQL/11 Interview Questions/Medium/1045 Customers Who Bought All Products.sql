/*
===============================================================================
                           LEETCODE 1045
                  Customers Who Bought All Products
===============================================================================

Difficulty    : Medium
Topics        : GROUP BY, HAVING, COUNT(DISTINCT)
Companies     : Amazon, Google, Microsoft, Oracle, Walmart

===============================================================================
QUESTION
===============================================================================

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+

There is no primary key.

----------------------------------------------------------

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+

product_key is the primary key.

Write a solution to report the customer IDs of customers who bought
all the products listed in the Product table.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A retail company wants to identify its most loyal customers.

Marketing defines a loyal customer as someone who has purchased
every product currently available in the catalog.

These customers will receive exclusive loyalty rewards.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• customer_id

for customers who purchased every product.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ HAVING

✔ COUNT(DISTINCT)

✔ Subquery

✔ Relational Division

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    customer_id

FROM Customer

GROUP BY

    customer_id

HAVING

    COUNT(DISTINCT product_key) =
    (
        SELECT

            COUNT(*)

        FROM Product
    );

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group purchase records by customer.

----------------------------------------------------------

Step 2

Count the number of DISTINCT products
purchased by each customer.

----------------------------------------------------------

Step 3

Count the total number of products
available in the Product table.

----------------------------------------------------------

Step 4

Keep only customers whose product count
matches the total product count.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Products

A

B

C

------------------------

Customer 1

A

B

C

↓

3 Products

✔ Include

------------------------

Customer 2

A

B

↓

2 Products

✘ Exclude

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------+
| customer_id |
+-------------+
| 1           |
+-------------+

===============================================================================
WHY COUNT(DISTINCT)?
===============================================================================

A customer may purchase the same product
multiple times.

DISTINCT ensures each product
is counted only once.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    c.customer_id

FROM Customer c

WHERE NOT EXISTS
(
    SELECT product_key

    FROM Product

    EXCEPT

    SELECT product_key

    FROM Customer

    WHERE customer_id = c.customer_id
)

GROUP BY

    c.customer_id;

This relational division approach is supported
in databases that implement EXCEPT.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Grouping dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped customer records.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use COUNT(DISTINCT)?

To avoid counting duplicate purchases
of the same product.

----------------------------------------------------------

Q2. Why compare against Product?

The Product table defines
the complete product catalog.

----------------------------------------------------------

Q3. What is relational division?

Finding rows related to

all

values in another table.

----------------------------------------------------------

Q4. How would you find customers
who bought at least 80% of products?

Compare the product count against

0.8 × total products.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using COUNT(*).

Duplicate purchases inflate the count.

----------------------------------------------------------

❌ Forgetting GROUP BY.

The query counts purchases
across all customers.

----------------------------------------------------------

❌ Comparing against Customer instead
of Product.

The Product table defines
the required product list.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer Loyalty Programs

• Subscription Analysis

• Product Adoption Reports

• Certification Completion Tracking

• Employee Training Completion

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ COUNT(DISTINCT) ignores duplicate purchases.

✔ HAVING filters grouped results.

✔ Relational division is a common interview pattern.

✔ Compare customer coverage against
the complete reference dataset.

✔ Frequently asked by product-based companies.

===============================================================================
*/
