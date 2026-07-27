/*
==============================================================================
QUESTION
==============================================================================

Calculate the total revenue generated from all orders.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance department wants to determine the total revenue generated from all
customer orders. This metric is used to evaluate overall business performance
and monitor sales growth.

Your task is to calculate the total revenue from all orders.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- SUM()
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
    SUM(total_amount) AS total_revenue
FROM Orders;

/*
==============================================================================
EXPLANATION
==============================================================================

The SUM() function calculates the total value of a numeric column.

In this query, SQL adds the value of the total_amount column from every order
and returns a single summarized result.

The AS keyword assigns a meaningful name to the calculated value.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

total_revenue
-------------
14300.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use SUM() only with numeric columns.

✓ Assign descriptive aliases using AS to improve report readability.

✓ Ensure the column being summed contains valid numeric data.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Sales Revenue Reports

✓ Financial Dashboards

✓ Monthly Business Performance Analysis

✓ Executive KPI Reports

✓ Revenue Trend Monitoring

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ COUNT()

Next:
→ AVG()
→ MIN()
→ MAX()
→ GROUP BY

*/
