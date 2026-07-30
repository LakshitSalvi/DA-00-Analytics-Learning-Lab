/*
==============================================================================
QUESTION
==============================================================================

Calculate the running (cumulative) monthly sales using a Common Table
Expression (CTE).

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance team wants to monitor business growth throughout the year by
tracking cumulative monthly revenue.

Instead of viewing each month's sales independently, they want to see how
revenue accumulates over time.

Your task is to calculate the running total of monthly sales.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Common Table Expression (CTE)
- WITH Clause
- SUM()
- GROUP BY
- Window Functions
- SUM() OVER()
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
order_date
total_amount

Sample Data
-----------

order_id | order_date | total_amount
-------------------------------------
5001     | 2026-01-10 | 1500.00
5002     | 2026-01-20 | 2500.00
5003     | 2026-02-08 | 3200.00
5004     | 2026-02-18 | 1800.00
5005     | 2026-03-05 | 4000.00
5006     | 2026-03-15 | 3000.00
5007     | 2026-04-12 | 5000.00
5008     | 2026-04-22 | 2500.00

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
    SUM(monthly_sales) OVER
    (
        ORDER BY month_number
    ) AS running_total
FROM MonthlySales
ORDER BY month_number;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:
The CTE calculates the total sales for each month.

Step 2:
The outer query applies the SUM() OVER() window function.

The window function starts from the first month and continuously adds each
month's sales to produce a cumulative (running) total.

This approach is significantly cleaner than using nested subqueries for
running totals.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

month_number | monthly_sales | running_total
---------------------------------------------
1            | 4000.00       | 4000.00
2            | 5000.00       | 9000.00
3            | 7000.00       | 16000.00
4            | 7500.00       | 23500.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use a CTE to separate aggregation logic from reporting logic.

✓ Use window functions instead of self-joins for cumulative calculations.

✓ Always ORDER BY inside the OVER() clause.

✓ Keep CTE names descriptive and meaningful.

✓ Use window functions for efficient analytical reporting.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Monthly Revenue Dashboards

✓ Financial Reporting

✓ Business Growth Analysis

✓ Sales Trend Monitoring

✓ Executive KPI Reports

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Employee Salary Ranking

Next:
→ Department Salary Analysis
→ Window Functions
→ Rolling Averages
→ Moving Totals

*/
