/*
==============================================================================
QUESTION
==============================================================================

Calculate the running (cumulative) revenue over time using the SUM() window
function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance team wants to monitor how revenue accumulates throughout the year.

Instead of showing only individual daily sales, management would like to see
the cumulative revenue after each sales day.

Your task is to calculate the running total of revenue ordered by date.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- SUM() OVER()
- ORDER BY
- Running Total
- Cumulative Sum

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : DailySales

Columns
--------
sale_date
daily_revenue

Sample Data
-----------

sale_date  | daily_revenue
---------------------------
2026-01-01 | 1200.00
2026-01-02 | 1800.00
2026-01-03 | 1500.00
2026-01-04 | 2500.00
2026-01-05 | 2000.00
2026-01-06 | 3000.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    sale_date,
    daily_revenue,

    SUM(daily_revenue) OVER
    (
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS running_revenue

FROM DailySales
ORDER BY sale_date;

/*
==============================================================================
EXPLANATION
==============================================================================

SUM() OVER() computes a cumulative total without collapsing rows.

Step 1:

The rows are ordered chronologically using ORDER BY sale_date.

Step 2:

The window frame starts from the first row and extends to the current row.

Step 3:

For each row, SQL sums all revenues from the beginning of the dataset up to
the current date.

As a result, every row displays both the day's revenue and the cumulative
revenue.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

sale_date  | daily_revenue | running_revenue
---------------------------------------------
2026-01-01 | 1200.00       | 1200.00
2026-01-02 | 1800.00       | 3000.00
2026-01-03 | 1500.00       | 4500.00
2026-01-04 | 2500.00       | 7000.00
2026-01-05 | 2000.00       | 9000.00
2026-01-06 | 3000.00       | 12000.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always specify ORDER BY for cumulative calculations.

✓ Explicitly define the window frame for clarity and portability.

✓ Use running totals for trend analysis instead of repeated aggregate queries.

✓ Keep date columns properly indexed in production databases.

✓ Use meaningful aliases for calculated metrics.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Revenue Dashboards

✓ Financial Reporting

✓ Sales Performance Tracking

✓ Inventory Movement Analysis

✓ KPI Monitoring

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Latest Customer Transaction

Next:
→ Seven Day Moving Average
→ Moving Averages
→ Rolling Windows
→ AVG() OVER()

*/
