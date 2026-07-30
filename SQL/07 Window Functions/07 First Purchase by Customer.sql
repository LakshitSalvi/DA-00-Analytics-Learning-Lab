/*
==============================================================================
QUESTION
==============================================================================

Retrieve every order along with the customer's first purchase date using the
FIRST_VALUE() window function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing team wants to understand customer acquisition by identifying the
first purchase date for every customer.

Showing the first purchase alongside every order helps calculate customer age,
loyalty, repeat purchase behavior, and customer lifetime value (CLV).

Your task is to display each order together with the customer's first purchase
date.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- FIRST_VALUE()
- OVER()
- PARTITION BY
- ORDER BY

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

Sample Data
-----------

order_id | customer_id | order_date | total_amount
---------------------------------------------------
5001     | C101        | 2026-01-10 | 1500.00
5002     | C101        | 2026-02-05 | 1800.00
5003     | C101        | 2026-04-12 | 2200.00
5004     | C102        | 2026-01-15 | 2500.00
5005     | C102        | 2026-03-20 | 3000.00
5006     | C103        | 2026-02-08 | 1700.00

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

    FIRST_VALUE(order_date) OVER
    (
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS first_purchase_date

FROM Orders
ORDER BY
    customer_id,
    order_date;

/*
==============================================================================
EXPLANATION
==============================================================================

FIRST_VALUE() returns the first value within the current window.

Step 1:

PARTITION BY customer_id creates a separate window for each customer.

Step 2:

ORDER BY order_date sorts each customer's orders from earliest to latest.

Step 3:

FIRST_VALUE(order_date) returns the earliest order date for every row in the
customer's partition.

The frame clause explicitly defines the window from the first row up to the
current row, ensuring consistent behavior across SQL database systems.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_id | order_date | first_purchase_date
----------------------------------------------------------
5001     | C101        | 2026-01-10 | 2026-01-10
5002     | C101        | 2026-02-05 | 2026-01-10
5003     | C101        | 2026-04-12 | 2026-01-10
5004     | C102        | 2026-01-15 | 2026-01-15
5005     | C102        | 2026-03-20 | 2026-01-15
5006     | C103        | 2026-02-08 | 2026-02-08

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use PARTITION BY to isolate calculations for each customer.

✓ Always define ORDER BY inside the OVER() clause.

✓ Specify the window frame explicitly for portability across SQL databases.

✓ Use FIRST_VALUE() instead of subqueries for first-event analysis.

✓ Use descriptive aliases for calculated columns.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Acquisition Analysis

✓ Customer Lifetime Value (CLV)

✓ Loyalty Program Analysis

✓ Subscription Lifecycle Reporting

✓ CRM Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Next Order Date

Next:
→ Latest Customer Transaction
→ LAST_VALUE()
→ LAG()
→ LEAD()

*/
