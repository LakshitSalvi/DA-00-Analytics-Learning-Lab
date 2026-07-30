/*
==============================================================================
QUESTION
==============================================================================

Compare each month's sales with the previous month's sales using the LAG()
window function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance team wants to monitor monthly business performance by comparing
each month's revenue with the revenue from the previous month.

This analysis helps identify growth trends, seasonal patterns, and sudden
changes in business performance.

Your task is to display each month's sales along with the previous month's
sales.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- LAG()
- OVER()
- ORDER BY
- Common Table Expression (CTE)
- SUM()
- GROUP BY

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Orders

Columns
--------
order_id
order_date
total_amount

Sample Data
-----------

order_id | order_date | total_amount
-------------------------------------
5001     | 2026-01-05 | 1500.00
5002     | 2026-01-18 | 2500.00
5003     | 2026-02-08 | 3200.00
5004     | 2026-02-20 | 1800.00
5005     | 2026-03-06 | 4200.00
5006     | 2026-03-21 | 2800.00
5007     | 2026-04-10 | 5000.00
5008     | 2026-04-25 | 3500.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH MonthlySales AS
(
    SELECT
        MONTH(order_date) AS month_number,
        SUM(total_amount) AS monthly_sales
    FROM Orders
    GROUP BY MONTH(order_date)
)

SELECT
    month_number,
    monthly_sales,

    LAG(monthly_sales) OVER
    (
        ORDER BY month_number
    ) AS previous_month_sales

FROM MonthlySales
ORDER BY month_number;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CTE calculates the total sales for each month.

Step 2:

The LAG() window function retrieves the sales value from the previous row,
which represents the previous month.

For the first month, there is no previous row, so LAG() returns NULL.

Unlike traditional SQL solutions that require self-joins or correlated
subqueries, LAG() provides a simpler and more efficient approach.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

month_number | monthly_sales | previous_month_sales
---------------------------------------------------
1            | 4000.00       | NULL
2            | 5000.00       | 4000.00
3            | 7000.00       | 5000.00
4            | 8500.00       | 7000.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LAG() for previous-row comparisons.

✓ Aggregate data before applying window functions.

✓ Always specify ORDER BY inside the OVER() clause.

✓ Handle NULL values appropriately for the first row.

✓ Prefer LAG() over self-joins for sequential analysis.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Month-over-Month (MoM) Sales Analysis

✓ Revenue Trend Analysis

✓ Financial Reporting

✓ Executive Dashboards

✓ Business Performance Monitoring

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Divide Customers into Quartiles

Next:
→ Next Order Date
→ LEAD()
→ Running Revenue
→ Moving Averages

*/
