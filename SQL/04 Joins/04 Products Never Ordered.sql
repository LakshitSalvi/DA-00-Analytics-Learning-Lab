/*
==============================================================================
QUESTION
==============================================================================

Retrieve all products that have never been ordered.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The inventory management team wants to identify products that have never been
purchased by customers. This helps evaluate product performance, optimize
inventory levels, and determine whether certain products should be promoted or
discontinued.

Your task is to retrieve all products that have never appeared in the Orders
table.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- LEFT JOIN
- ON
- IS NULL
- Table Aliases

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
price
stock_quantity

Sample Data
-----------

product_id | product_name          | category      | price   | stock_quantity
-----------------------------------------------------------------------------
P101       | Wireless Mouse        | Electronics   | 899.00  | 120
P102       | Mechanical Keyboard   | Electronics   | 3499.00 | 45
P103       | Office Chair          | Furniture     | 7999.00 | 18
P104       | Notebook              | Stationery    | 99.00   | 500
P105       | Water Bottle          | Accessories   | 299.00  | 250
P106       | USB Flash Drive       | Electronics   | 699.00  | 80
P107       | Laptop Stand          | Accessories   | 1499.00 | 35

Table Name : Orders

Columns
--------
order_id
customer_id
product_id
order_date
quantity
total_amount

Sample Data
-----------

order_id | customer_id | product_id | order_date | quantity | total_amount
----------------------------------------------------------------------------
5001     | 101         | P101       | 2026-07-01 | 2        | 1798.00
5002     | 102         | P103       | 2026-07-02 | 1        | 7999.00
5003     | 103         | P105       | 2026-07-03 | 3        | 897.00
5004     | 101         | P102       | 2026-07-05 | 1        | 3499.00
5005     | 104         | P104       | 2026-07-06 | 4        | 396.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.price
FROM Products AS p
LEFT JOIN Orders AS o
    ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

/*
==============================================================================
EXPLANATION
==============================================================================

A LEFT JOIN returns all rows from the Products table and the matching rows
from the Orders table.

If a product has never been ordered, there will be no matching record in the
Orders table. In that case, the columns from the Orders table contain NULL
values.

The WHERE clause filters these unmatched rows, returning only products that
have never been ordered.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name      | category      | price
--------------------------------------------------------
P106       | USB Flash Drive   | Electronics   | 699.00
P107       | Laptop Stand      | Accessories   | 1499.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LEFT JOIN when you need all records from the primary table.

✓ Filter using IS NULL on the joined table to identify missing matches.

✓ Avoid using NOT IN when NULL values may exist in the subquery.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Inventory Analysis

✓ Unsold Product Reports

✓ Product Performance Analysis

✓ Warehouse Management

✓ Business Intelligence Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Self Join

Next:
→ Many-to-Many Relationships
→ Multi-Table Joins
→ Customer Purchase Reports

*/
