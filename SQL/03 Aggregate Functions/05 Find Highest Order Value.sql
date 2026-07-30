/*
==============================================================================
QUESTION
==============================================================================

Find the highest order value.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales manager wants to identify the highest-value order placed by a
customer. This information helps recognize high-value transactions and
analyze customer purchasing behavior.

Your task is to retrieve the highest order value from all customer orders.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- MAX()
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

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    MAX(total_amount) AS highest_order_value
FROM Orders;

/*
==============================================================================
EXPLANATION
==============================================================================

The MAX() function returns the largest value from a specified column.

In this query, SQL examines every value in the total_amount column and returns
the highest order value.

The AS keyword assigns a meaningful alias to the result, making the output
more descriptive and easier to understand.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

highest_order_value
-------------------
5600.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use MAX() to retrieve the highest value from numeric or date columns.

✓ Apply meaningful aliases using AS for better readability.

✓ Verify that the selected column contains the correct data type before
  performing aggregate calculations.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ High-Value Customer Analysis

✓ Sales Performance Reports

✓ Revenue Dashboards

✓ Executive KPI Reporting

✓ E-Commerce Business Analytics

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ MIN()

Next:
→ GROUP BY
→ HAVING
→ COUNT(DISTINCT)

*/
