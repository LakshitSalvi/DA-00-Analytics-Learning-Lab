/*
==============================================================================
QUESTION
==============================================================================

Retrieve each customer's order along with the date of their next order using
the LEAD() window function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer success team wants to analyze the time between consecutive
purchases made by each customer.

Knowing the next purchase date helps identify buying patterns, customer
engagement, and repeat purchase behavior.

Your task is to display each order together with the customer's next order
date.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- LEAD()
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

    LEAD(order_date) OVER
    (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_date

FROM Orders
ORDER BY
    customer_id,
    order_date;

/*
==============================================================================
EXPLANATION
==============================================================================

LEAD() returns the value from the following row within the specified window.

Step 1:

PARTITION BY customer_id separates orders for each customer.

Step 2:

Within each customer's partition, orders are sorted chronologically using
ORDER BY order_date.

Step 3:

LEAD(order_date) retrieves the next order date for each customer.

For the last order of each customer, there is no following row, so LEAD()
returns NULL.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_id | order_date | next_order_date
------------------------------------------------------
5001     | C101        | 2026-01-10 | 2026-02-05
5002     | C101        | 2026-02-05 | 2026-04-12
5003     | C101        | 2026-04-12 | NULL
5004     | C102        | 2026-01-15 | 2026-03-20
5005     | C102        | 2026-03-20 | NULL
5006     | C103        | 2026-02-08 | NULL

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use PARTITION BY when comparisons should restart for each group.

✓ Always specify ORDER BY inside the OVER() clause.

✓ Handle NULL values returned for the last row.

✓ Prefer LEAD() over self-joins for next-row analysis.

✓ Use meaningful aliases for calculated columns.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Purchase Journey

✓ Repeat Purchase Analysis

✓ Appointment Scheduling

✓ Delivery Planning

✓ Subscription Renewal Tracking

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Previous Month Sales

Next:
→ First Purchase by Customer
→ LAG()
→ FIRST_VALUE()
→ LAST_VALUE()

*/
