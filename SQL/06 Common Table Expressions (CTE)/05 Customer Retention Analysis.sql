/*
==============================================================================
QUESTION
==============================================================================

Identify returning customers who have placed orders in more than one month
using a Common Table Expression (CTE).

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing team wants to measure customer retention by identifying customers
who continue to make purchases over multiple months.

Returning customers are an important indicator of customer satisfaction and
business growth.

Your task is to identify customers who have placed orders in more than one
distinct month.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Common Table Expression (CTE)
- WITH Clause
- COUNT(DISTINCT)
- GROUP BY
- INNER JOIN
- HAVING
- Aggregate Functions

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Customers

Columns
--------
customer_id
first_name
last_name
city

Sample Data
-----------

customer_id | first_name | last_name | city
--------------------------------------------
101         | Rahul      | Sharma    | Pune
102         | Priya      | Kapoor    | Mumbai
103         | Aman       | Verma     | Jaipur
104         | Neha       | Singh     | Delhi


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
5001     | 101         | 2026-01-10 | 1500.00
5002     | 102         | 2026-01-18 | 2200.00
5003     | 101         | 2026-02-05 | 1800.00
5004     | 103         | 2026-02-14 | 3200.00
5005     | 101         | 2026-03-08 | 2600.00
5006     | 104         | 2026-03-12 | 1900.00
5007     | 102         | 2026-04-02 | 2800.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH CustomerActivity AS
(
    SELECT
        customer_id,
        COUNT(DISTINCT MONTH(order_date)) AS active_months
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT MONTH(order_date)) > 1
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    ca.active_months
FROM Customers AS c
INNER JOIN CustomerActivity AS ca
    ON c.customer_id = ca.customer_id
ORDER BY
    ca.active_months DESC,
    c.customer_id;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:
The CTE counts the number of distinct months in which each customer placed at
least one order.

Step 2:
The HAVING clause filters customers who were active in more than one month.

Step 3:
The outer query joins the CTE with the Customers table to retrieve customer
details along with the number of active months.

Using a CTE separates the retention calculation from the reporting query,
making the SQL easier to understand and maintain.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | city   | active_months
--------------------------------------------------------------
101         | Rahul      | Sharma    | Pune   | 3
102         | Priya      | Kapoor    | Mumbai | 2

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Perform business calculations inside the CTE.

✓ Use COUNT(DISTINCT ...) when duplicate periods are possible.

✓ Apply HAVING for aggregate-based filtering.

✓ Join the CTE only after the required calculations are complete.

✓ Keep CTE names descriptive and business-oriented.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Retention Analysis

✓ Loyalty Program Reporting

✓ Customer Lifetime Value (CLV) Analysis

✓ CRM Dashboards

✓ Marketing Campaign Performance

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Hierarchical Employee Structure

Next:
→ Window Functions
→ Customer Cohort Analysis
→ Repeat Purchase Analysis
→ Business Intelligence

*/
