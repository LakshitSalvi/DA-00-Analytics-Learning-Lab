/*
==============================================================================
QUESTION
==============================================================================

Retrieve the product(s) with the highest total quantity sold.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales team wants to identify the best-selling product based on the total
quantity sold across all orders.

This information is useful for inventory planning, demand forecasting,
marketing campaigns, and identifying high-performing products.

Your task is to retrieve the product(s) with the highest total quantity sold.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- INNER JOIN
- Subquery
- Nested Subquery
- GROUP BY
- SUM()
- MAX()
- HAVING
- Aggregate Functions

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Products

Columns
--------
product_id
product_name
category

Sample Data
-----------

product_id | product_name         | category
---------------------------------------------
P101       | Wireless Mouse       | Electronics
P102       | Mechanical Keyboard  | Electronics
P103       | Office Chair         | Furniture
P104       | Notebook             | Stationery


Table Name : Orders

Columns
--------
order_id
product_id
quantity
order_date

Sample Data
-----------

order_id | product_id | quantity | order_date
------------------------------------------------
5001     | P101       | 2        | 2026-07-01
5002     | P102       | 1        | 2026-07-02
5003     | P101       | 3        | 2026-07-04
5004     | P103       | 5        | 2026-07-05
5005     | P102       | 4        | 2026-07-07
5006     | P101       | 1        | 2026-07-09

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM Products AS p
INNER JOIN Orders AS o
    ON p.product_id = o.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(o.quantity) =
(
    SELECT MAX(total_quantity)
    FROM
    (
        SELECT
            SUM(quantity) AS total_quantity
        FROM Orders
        GROUP BY product_id
    ) AS ProductSales
);

/*
==============================================================================
EXPLANATION
==============================================================================

The query executes in three stages.

Step 1:
The innermost subquery calculates the total quantity sold for each product.

    SELECT
        SUM(quantity) AS total_quantity
    FROM Orders
    GROUP BY product_id

Result:

product_id | total_quantity
---------------------------
P101       | 6
P102       | 5
P103       | 5

Step 2:
The outer subquery finds the highest total quantity sold.

    SELECT MAX(total_quantity)
    FROM (...)

Result:

6

Step 3:
The main query joins Products and Orders, groups the records by product, and
returns the product(s) whose total quantity sold equals the maximum value.

If multiple products share the highest sales quantity, all of them are returned.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name    | total_quantity_sold
---------------------------------------------------
P101       | Wireless Mouse  | 6

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use SUM() to calculate total units sold instead of counting orders.

✓ Join with the Products table to display descriptive product information.

✓ Avoid hardcoding the highest sales value.

✓ Structure nested subqueries with proper indentation.

✓ Design queries to handle ties naturally.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Best-Selling Product Reports

✓ Inventory Planning

✓ Demand Forecasting

✓ Sales Performance Dashboards

✓ Retail Business Intelligence

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Customers Who Never Ordered

Next:
→ Monthly Revenue Comparison
→ Window Functions (RANK, DENSE_RANK)
→ TOP N Analysis

*/
