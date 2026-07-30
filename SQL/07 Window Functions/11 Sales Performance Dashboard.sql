/*
==============================================================================
QUESTION
==============================================================================

Build a sales performance dashboard that provides key business metrics for
each salesperson, including monthly sales, cumulative sales, previous month's
sales, monthly growth, and sales ranking.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales director wants a dashboard to evaluate salesperson performance over
time.

The report should display:

• Monthly Sales
• Running (Cumulative) Sales
• Previous Month Sales
• Monthly Growth
• Sales Rank for each month

This dashboard will be used for executive reporting and performance reviews.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- SUM() OVER()
- LAG()
- DENSE_RANK()
- PARTITION BY
- ORDER BY
- Common Table Expression (CTE)
- Aggregate Functions

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Sales

Columns
--------
sale_date
salesperson
sales_amount

Sample Data
-----------

sale_date  | salesperson | sales_amount
----------------------------------------
2026-01-05 | Rahul       | 12000
2026-01-15 | Rahul       | 18000
2026-01-20 | Priya       | 22000
2026-02-08 | Rahul       | 25000
2026-02-10 | Priya       | 28000
2026-02-18 | Aman        | 19000
2026-03-05 | Rahul       | 21000
2026-03-11 | Priya       | 32000
2026-03-19 | Aman        | 26000
2026-04-03 | Rahul       | 30000
2026-04-09 | Priya       | 34000
2026-04-15 | Aman        | 29000

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH MonthlySales AS
(
    SELECT
        YEAR(sale_date) AS sales_year,
        MONTH(sale_date) AS sales_month,
        salesperson,
        SUM(sales_amount) AS monthly_sales

    FROM Sales

    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date),
        salesperson
)

SELECT

    sales_year,
    sales_month,
    salesperson,
    monthly_sales,

    SUM(monthly_sales) OVER
    (
        PARTITION BY salesperson
        ORDER BY sales_year, sales_month
        ROWS BETWEEN UNBOUNDED PRECEDING
                 AND CURRENT ROW
    ) AS cumulative_sales,

    LAG(monthly_sales) OVER
    (
        PARTITION BY salesperson
        ORDER BY sales_year, sales_month
    ) AS previous_month_sales,

    monthly_sales -
    LAG(monthly_sales) OVER
    (
        PARTITION BY salesperson
        ORDER BY sales_year, sales_month
    ) AS sales_growth,

    DENSE_RANK() OVER
    (
        PARTITION BY sales_year, sales_month
        ORDER BY monthly_sales DESC
    ) AS monthly_rank

FROM MonthlySales

ORDER BY
    sales_year,
    sales_month,
    salesperson;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

Aggregate sales by month and salesperson.

Step 2:

Calculate cumulative sales using SUM() OVER().

Step 3:

Retrieve previous month's sales using LAG().

Step 4:

Calculate monthly growth.

Step 5:

Rank salespeople within each month using DENSE_RANK().

The final result resembles a business intelligence dashboard commonly used by
sales managers and executives.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

Year | Month | Salesperson | Monthly Sales | Cumulative | Previous | Growth | Rank
-----------------------------------------------------------------------------------
2026 | 1 | Priya | 22000 | 22000 | NULL  | NULL  | 1
2026 | 1 | Rahul | 30000 | 30000 | NULL  | NULL  | 2

2026 | 2 | Aman  | 19000 | 19000 | NULL  | NULL  | 3
2026 | 2 | Priya | 28000 | 50000 | 22000 | 6000  | 1
2026 | 2 | Rahul | 25000 | 55000 | 30000 | -5000 | 2

2026 | 3 | Aman  | 26000 | 45000 | 19000 | 7000  | 3
2026 | 3 | Priya | 32000 | 82000 | 28000 | 4000  | 1
2026 | 3 | Rahul | 21000 | 76000 | 25000 | -4000 | 2

2026 | 4 | Aman  | 29000 | 74000 | 26000 | 3000  | 3
2026 | 4 | Priya | 34000 |116000 | 32000 | 2000  | 1
2026 | 4 | Rahul | 30000 |106000 | 21000 | 9000  | 2

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Break complex reports into CTEs.

✓ Use PARTITION BY for salesperson-specific calculations.

✓ Compute analytical metrics with window functions instead of self-joins.

✓ Keep calculations readable with meaningful aliases.

✓ Use ORDER BY consistently to ensure correct chronological analysis.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Sales Performance Dashboards

✓ Executive KPI Reports

✓ Power BI Source Queries

✓ Tableau Data Preparation

✓ Financial Performance Analysis

✓ Business Intelligence Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Seven Day Moving Average

Next:
→ SQL Interview Questions
→ Business Case Studies
→ Power BI Dashboards

*/
