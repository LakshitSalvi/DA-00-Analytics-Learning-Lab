/*
==============================================================================
QUESTION
==============================================================================

Count the number of unique customers who have placed orders.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales team wants to determine how many unique customers have made
purchases. Since a customer may place multiple orders, counting all orders
would not accurately represent the customer base.

Your task is to calculate the number of distinct customers who have placed at
least one order.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- COUNT()
- DISTINCT
- Column Alias (AS)

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

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
5001     | 101         | P101       | 2026-07-01 | 2        | 2400.00
5002     | 102         | P103       | 2026-07-02 | 1        | 850.00
5003     | 103         | P105       | 2026-07-03 | 3        | 4200.00
5004     | 101         | P102       | 2026-07-05 | 1        | 1250.00
5005     | 104         | P104       | 2026-07-06 | 4        | 5600.00
5006     | 102         | P101       | 2026-07-07 | 2        | 1800.00
5007     | 105         | P103       | 2026-07-08 | 1        | 950.00
5008     | 101         | P105       | 2026-07-09 | 2        | 2600.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM Orders;

/*
==============================================================================
EXPLANATION
==============================================================================

The COUNT(DISTINCT column_name) function counts only unique, non-duplicate
values in a column.

Although the Orders table contains multiple orders from the same customer,
DISTINCT ensures that each customer is counted only once.

This provides an accurate count of customers who have placed at least one
order.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

unique_customers
----------------
5

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use COUNT(DISTINCT column_name) when duplicate values should be counted only
  once.

✓ Ensure the selected column uniquely identifies the entity being counted.

✓ COUNT(DISTINCT) ignores NULL values automatically.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Active Customer Analysis

✓ Customer Retention Reports

✓ Sales Performance Dashboards

✓ Marketing Campaign Analysis

✓ Business Intelligence Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ HAVING

Next:
→ Monthly Sales Summary
→ Window Functions
→ Business Case Studies

*/
