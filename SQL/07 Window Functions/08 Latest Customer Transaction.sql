/*
==============================================================================
QUESTION
==============================================================================

Retrieve every order along with the customer's latest purchase date using the
LAST_VALUE() window function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer success team wants to determine each customer's most recent
purchase date while reviewing their complete purchase history.

Displaying the latest purchase alongside every order helps analyze customer
activity, identify inactive customers, and support retention campaigns.

Your task is to display every order together with the customer's latest
purchase date.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- LAST_VALUE()
- OVER()
- PARTITION BY
- ORDER BY
- Window Frame Specification

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

    LAST_VALUE(order_date) OVER
    (
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
    ) AS latest_purchase_date

FROM Orders
ORDER BY
    customer_id,
    order_date;

/*
==============================================================================
EXPLANATION
==============================================================================

LAST_VALUE() returns the last value within the defined window frame.

Step 1:

PARTITION BY customer_id creates a separate window for each customer.

Step 2:

ORDER BY order_date sorts each customer's orders chronologically.

Step 3:

The window frame is explicitly defined from the first row to the last row of
the partition.

Without

ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING

LAST_VALUE() would return the current row instead of the customer's final
purchase on many SQL database systems.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_id | order_date | latest_purchase_date
-----------------------------------------------------------
5001     | C101        | 2026-01-10 | 2026-04-12
5002     | C101        | 2026-02-05 | 2026-04-12
5003     | C101        | 2026-04-12 | 2026-04-12
5004     | C102        | 2026-01-15 | 2026-03-20
5005     | C102        | 2026-03-20 | 2026-03-20
5006     | C103        | 2026-02-08 | 2026-02-08

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always specify the window frame when using LAST_VALUE().

✓ Partition data when calculations should restart for each group.

✓ Always include ORDER BY inside the OVER() clause.

✓ Avoid assuming LAST_VALUE() returns the last row by default.

✓ Use meaningful aliases for calculated columns.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Activity Reports

✓ Customer Retention Analysis

✓ CRM Dashboards

✓ Subscription Monitoring

✓ Purchase History Analysis

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ First Purchase by Customer

Next:
→ Running Revenue
→ SUM() OVER()
→ Cumulative Totals
→ Moving Averages

*/
