/*
==============================================================================
QUESTION
==============================================================================

Compare each month's revenue with the previous month's revenue and identify
whether revenue increased, decreased, or remained the same.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The finance team wants to analyze monthly revenue trends to understand business
performance over time.

For each month, compare its total revenue with the immediately previous month
and classify the trend as:

- Increased
- Decreased
- No Change
- N/A (for the first month)

Your task is to generate a month-over-month revenue comparison report.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Correlated Subquery
- Aggregate Functions
- SUM()
- GROUP BY
- CASE
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
5002     | 2026-01-15 | 2500.00
5003     | 2026-02-05 | 4000.00
5004     | 2026-02-18 | 3000.00
5005     | 2026-03-08 | 5000.00
5006     | 2026-03-22 | 2500.00
5007     | 2026-04-11 | 6000.00
5008     | 2026-04-25 | 2000.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    CurrentMonth.month_number,
    CurrentMonth.monthly_revenue,

    (
        SELECT PreviousMonth.monthly_revenue
        FROM
        (
            SELECT
                MONTH(order_date) AS month_number,
                SUM(total_amount) AS monthly_revenue
            FROM Orders
            GROUP BY MONTH(order_date)
        ) AS PreviousMonth
        WHERE PreviousMonth.month_number = CurrentMonth.month_number - 1
    ) AS previous_month_revenue,

    CASE
        WHEN
        (
            SELECT PreviousMonth.monthly_revenue
            FROM
            (
                SELECT
                    MONTH(order_date) AS month_number,
                    SUM(total_amount) AS monthly_revenue
                FROM Orders
                GROUP BY MONTH(order_date)
            ) AS PreviousMonth
            WHERE PreviousMonth.month_number = CurrentMonth.month_number - 1
        ) IS NULL
            THEN 'N/A'

        WHEN CurrentMonth.monthly_revenue >
        (
            SELECT PreviousMonth.monthly_revenue
            FROM
            (
                SELECT
                    MONTH(order_date) AS month_number,
                    SUM(total_amount) AS monthly_revenue
                FROM Orders
                GROUP BY MONTH(order_date)
            ) AS PreviousMonth
            WHERE PreviousMonth.month_number = CurrentMonth.month_number - 1
        )
            THEN 'Increased'

        WHEN CurrentMonth.monthly_revenue <
        (
            SELECT PreviousMonth.monthly_revenue
            FROM
            (
                SELECT
                    MONTH(order_date) AS month_number,
                    SUM(total_amount) AS monthly_revenue
                FROM Orders
                GROUP BY MONTH(order_date)
            ) AS PreviousMonth
            WHERE PreviousMonth.month_number = CurrentMonth.month_number - 1
        )
            THEN 'Decreased'

        ELSE 'No Change'
    END AS revenue_trend

FROM
(
    SELECT
        MONTH(order_date) AS month_number,
        SUM(total_amount) AS monthly_revenue
    FROM Orders
    GROUP BY MONTH(order_date)
) AS CurrentMonth
ORDER BY CurrentMonth.month_number;

 /*
==============================================================================
EXPLANATION
==============================================================================

The query first calculates the total revenue for each month.

For every month, a correlated subquery searches for the revenue of the
immediately previous month.

The CASE statement compares the two revenue values and classifies the trend as:

• Increased
• Decreased
• No Change
• N/A (when no previous month exists)

This demonstrates how correlated subqueries can compare values across related
rows.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

month_number | monthly_revenue | previous_month_revenue | revenue_trend
-----------------------------------------------------------------------
1            | 4000.00         | NULL                   | N/A
2            | 7000.00         | 4000.00                | Increased
3            | 7500.00         | 7000.00                | Increased
4            | 8000.00         | 7500.00                | Increased

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use meaningful aliases for derived tables.

✓ Handle NULL values for the first comparison.

✓ Use CASE to classify business metrics.

✓ Consider Window Functions (LAG()) for better performance in modern SQL
  databases.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Month-over-Month (MoM) Analysis

✓ Revenue Trend Reports

✓ Executive Dashboards

✓ Financial Reporting

✓ Business Performance Analysis

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Top Selling Product

Next:
→ Common Table Expressions (CTEs)
→ Window Functions (LAG, LEAD)
→ Business Analytics

*/
