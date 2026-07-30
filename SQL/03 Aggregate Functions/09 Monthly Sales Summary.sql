/*
==============================================================================
QUESTION
==============================================================================

Generate a monthly sales summary showing the total revenue for each month.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The management team wants to analyze monthly sales performance to identify
revenue trends and support strategic business decisions.

Your task is to calculate the total revenue generated in each month.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- SUM()
- GROUP BY
- ORDER BY
- MONTH()
- YEAR()
- Column Alias (AS)

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
product_id
order_date
quantity
total_amount

Sample Data
-----------

order_id | customer_id | product_id | order_date | quantity | total_amount
----------------------------------------------------------------------------
5001     | 101         | P101       | 2026-01-15 | 2        | 2400.00
5002     | 102         | P103       | 2026-01-28 | 1        | 850.00
5003     | 103         | P105       | 2026-02-03 | 3        | 4200.00
5004     | 101         | P102       | 2026-02-18 | 1        | 1250.00
5005     | 104         | P104       | 2026-03-06 | 4        | 5600.00
5006     | 105         | P101       | 2026-03-14 | 2        | 1800.00
5007     | 102         | P105       | 2026-03-25 | 1        | 950.00
5008     | 106         | P102       | 2026-04-10 | 2        | 3100.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(total_amount) AS total_revenue
FROM Orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    sales_year,
    sales_month;

/*
==============================================================================
EXPLANATION
==============================================================================

The YEAR() and MONTH() functions extract the year and month from the order_date
column.

The GROUP BY clause groups all orders belonging to the same month.

The SUM() function calculates the total revenue generated for each month.

Finally, ORDER BY arranges the results chronologically.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

sales_year | sales_month | total_revenue
-----------------------------------------
2026       | 1           | 3250.00
2026       | 2           | 5450.00
2026       | 3           | 8350.00
2026       | 4           | 3100.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Group by both YEAR() and MONTH() to avoid combining data from different
  years.

✓ Always sort grouped date-based reports chronologically.

✓ Use meaningful aliases to improve readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Monthly Sales Reports

✓ Revenue Trend Analysis

✓ Executive KPI Dashboards

✓ Financial Performance Monitoring

✓ Business Intelligence Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ COUNT(DISTINCT)

Next:
→ JOINS
→ Multi-Table Analysis
→ Business Case Studies

*/
