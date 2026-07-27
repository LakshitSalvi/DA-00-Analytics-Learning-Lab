/*
==============================================================================
QUESTION
==============================================================================

Retrieve all orders placed between '2025-01-01' and '2025-03-31'.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance team is preparing a quarterly sales report for the first quarter
(Q1) of 2025. They need to retrieve all customer orders placed during this
period for revenue analysis.

Your task is to filter orders that fall within the specified date range.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- BETWEEN Operator
- Date Filtering

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

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    total_amount
FROM Orders
WHERE order_date BETWEEN '2025-01-01' AND '2025-03-31';

/*
==============================================================================
EXPLANATION
==============================================================================

The BETWEEN operator filters values that fall within a specified range.

For date values, BETWEEN returns records where the order_date is greater than
or equal to the starting date and less than or equal to the ending date.

The following query produces the same result:

WHERE order_date >= '2025-01-01'
  AND order_date <= '2025-03-31'

BETWEEN provides a cleaner and more readable way to express range conditions.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_id | product_id | order_date | total_amount
----------------------------------------------------------------
1001     | 101         | 205        | 2025-01-08 | 2499
1008     | 108         | 118        | 2025-02-14 | 1599
1015     | 115         | 310        | 2025-03-22 | 3299
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use BETWEEN when filtering values within a continuous range.

✓ Remember that BETWEEN includes both the starting and ending values.

✓ Store dates using the YYYY-MM-DD format for consistency and reliable
  comparisons.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Quarterly Sales Reports

✓ Monthly Revenue Analysis

✓ Financial Audits

✓ Customer Purchase Analysis

✓ Inventory Movement Reports

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ AND Operator

Next:
→ IN
→ NOT IN
→ LIKE

*/
