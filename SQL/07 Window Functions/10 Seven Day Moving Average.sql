/*
==============================================================================
QUESTION
==============================================================================

Calculate the seven-day moving average of daily revenue using the AVG()
window function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance team wants to smooth out daily fluctuations in revenue to better
identify long-term sales trends.

Instead of focusing on individual daily sales, management wants to see the
average revenue over the most recent seven days.

Your task is to calculate the seven-day moving average of daily revenue.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- AVG() OVER()
- ORDER BY
- Moving Average
- Rolling Window
- Window Frame Specification

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
2026-01-07 | 2200.00
2026-01-08 | 2700.00
2026-01-09 | 2600.00
2026-01-10 | 3100.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    sale_date,
    daily_revenue,

    AVG(daily_revenue) OVER
    (
        ORDER BY sale_date
        ROWS BETWEEN 6 PRECEDING
                 AND CURRENT ROW
    ) AS seven_day_moving_average

FROM DailySales
ORDER BY sale_date;

/*
==============================================================================
EXPLANATION
==============================================================================

AVG() OVER() calculates a moving average while preserving all rows.

Step 1:

The data is ordered chronologically by sale_date.

Step 2:

The window frame includes the current row and the previous six rows,
creating a rolling seven-day window.

Step 3:

SQL calculates the average revenue within that window for every row.

For the first six days, fewer than seven rows are available, so the moving
average is calculated using all available rows.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

sale_date  | daily_revenue | seven_day_moving_average
------------------------------------------------------
2026-01-01 | 1200.00       | 1200.00
2026-01-02 | 1800.00       | 1500.00
2026-01-03 | 1500.00       | 1500.00
2026-01-04 | 2500.00       | 1750.00
2026-01-05 | 2000.00       | 1800.00
2026-01-06 | 3000.00       | 2000.00
2026-01-07 | 2200.00       | 2028.57
2026-01-08 | 2700.00       | 2242.86
2026-01-09 | 2600.00       | 2357.14
2026-01-10 | 3100.00       | 2585.71

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use ROWS instead of RANGE for fixed-size rolling windows.

✓ Always specify ORDER BY inside the OVER() clause.

✓ Define the window frame explicitly for readability.

✓ Use moving averages to reduce noise in time-series data.

✓ Ensure date columns are indexed in production databases.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Financial Forecasting

✓ Revenue Trend Analysis

✓ Stock Market Analysis

✓ Website Traffic Monitoring

✓ KPI Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Running Revenue

Next:
→ Sales Performance Dashboard
→ SUM() OVER()
→ LAG()
→ LEAD()

*/
