/*
===============================================================================
                           LEETCODE 586
             Customer Placing the Largest Number of Orders
===============================================================================

Difficulty    : Easy
Topics        : GROUP BY, COUNT(), ORDER BY
Companies     : Amazon, Microsoft, Google, Meta, Walmart

===============================================================================
QUESTION
===============================================================================

Table: Orders

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| order_number| int     |
| customer_number | int |
+-------------+---------+

order_number is the primary key.

Each row represents an order placed by a customer.

Write a solution to find the customer who has placed the largest number
of orders.

The test data guarantees that exactly one customer has placed more orders
than any other customer.

Return the customer's number.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An e-commerce company wants to identify its most active customer based
on the total number of orders placed.

The customer engagement team plans to reward the most loyal customer with
exclusive membership benefits.

As a Data Analyst, your task is to determine which customer has placed
the highest number of orders.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Customer Number

of the customer who placed the highest number of orders.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ COUNT()

✔ ORDER BY

✔ LIMIT

✔ Aggregate Functions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    customer_number

FROM Orders

GROUP BY

    customer_number

ORDER BY

    COUNT(order_number) DESC

LIMIT 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Group all records by customer_number.

----------------------------------------------------------

Step 2

Count the number of orders placed by each customer.

----------------------------------------------------------

Step 3

Sort the customers in descending order based on the order count.

----------------------------------------------------------

Step 4

Return the first customer using LIMIT 1.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Orders

+--------------+-----------------+
| Order Number | Customer Number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
| 5            | 2               |
| 6            | 3               |
+--------------+-----------------+

After GROUP BY

Customer 1 → 1 Order

Customer 2 → 2 Orders

Customer 3 → 3 Orders

↓

ORDER BY COUNT DESC

↓

Customer 3

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+

===============================================================================
WHY GROUP BY?
===============================================================================

GROUP BY creates one group for each customer.

COUNT() calculates how many orders belong to each customer.

ORDER BY arranges customers from highest to lowest order count.

LIMIT 1 returns the top customer.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

WITH CustomerOrders AS
(
    SELECT

        customer_number,

        COUNT(*) AS TotalOrders

    FROM Orders

    GROUP BY customer_number
)

SELECT

    customer_number

FROM CustomerOrders

ORDER BY TotalOrders DESC

LIMIT 1;

Using a CTE improves readability,
especially for more complex analytical queries.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping requires scanning the table,
and sorting is performed on the grouped results.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

To store grouped customer counts.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use GROUP BY?

Because we need to calculate the total number of orders
for each customer.

----------------------------------------------------------

Q2. Why COUNT(order_number)?

It counts the number of orders placed by each customer.

COUNT(*)

would also work because order_number is never NULL.

----------------------------------------------------------

Q3. What if multiple customers have the same highest number of orders?

The problem guarantees exactly one answer.

If ties were allowed,

DENSE_RANK() or RANK() could be used.

----------------------------------------------------------

Q4. Can window functions solve this?

Yes.

Example:

SELECT customer_number

FROM
(
    SELECT

        customer_number,

        DENSE_RANK()

        OVER
        (
            ORDER BY COUNT(*) DESC
        ) AS RankNo

    FROM Orders

    GROUP BY customer_number

) AS RankedCustomers

WHERE RankNo = 1;

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting GROUP BY.

COUNT() would return the total number of orders
in the table.

----------------------------------------------------------

❌ Ordering by customer_number.

The sorting must be based on COUNT().

----------------------------------------------------------

❌ Forgetting LIMIT 1.

The query would return every customer.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer Loyalty Analysis

• E-Commerce Analytics

• CRM Reporting

• Membership Programs

• Customer Segmentation

• Retail Analytics

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY creates one record per customer.

✔ COUNT() measures customer activity.

✔ ORDER BY DESC finds the highest value.

✔ LIMIT returns the top result.

✔ A classic SQL aggregation interview question.

===============================================================================
*/
