/*
==============================================================================
QUESTION
==============================================================================

Retrieve the latest five orders.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The operations team wants to monitor the most recently placed customer orders
to track daily business activity and ensure timely order processing.

Your task is to retrieve the five most recent orders based on the order date.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- ORDER BY
- DESC
- LIMIT

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
order_date
total_amount
order_status

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    order_status
FROM Orders
ORDER BY order_date DESC
LIMIT 5;

/*
==============================================================================
EXPLANATION
==============================================================================

The ORDER BY clause sorts the records by order_date in descending order,
placing the most recent orders first.

The LIMIT clause restricts the result to the first five rows after sorting.

This combination is commonly used to retrieve the latest records from a table.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_id | order_date | total_amount | order_status
-----------------------------------------------------------------
5012     | 103         | 2026-07-26 | 3499.00      | Delivered
5011     | 108         | 2026-07-26 | 1299.00      | Shipped
5010     | 115         | 2026-07-25 | 799.00       | Processing
5009     | 102         | 2026-07-25 | 2199.00      | Delivered
5008     | 101         | 2026-07-24 | 1599.00      | Pending

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always sort by a date or timestamp column before using LIMIT to retrieve
  the latest records.

✓ Use DESC to display the most recent entries first.

✓ Ensure the sorting column accurately reflects when the record was created or
  updated.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Order Tracking Systems

✓ Daily Sales Monitoring

✓ Operations Dashboards

✓ Customer Service Portals

✓ E-Commerce Analytics

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ ORDER BY
→ LIMIT

Next:
→ Aggregate Functions
→ GROUP BY
→ HAVING

*/
