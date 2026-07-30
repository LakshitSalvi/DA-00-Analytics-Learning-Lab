/*
==============================================================================
QUESTION
==============================================================================

Generate a customer purchase report showing the total number of orders, total
amount spent, and average order value for each customer.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales team wants a customer purchase summary to identify high-value
customers and understand purchasing behavior.

The report should include every customer, even those who have never placed an
order.

Your task is to generate a customer purchase report using JOINs and aggregate
functions.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- LEFT JOIN
- Aggregate Functions
- COUNT()
- SUM()
- AVG()
- GROUP BY
- ORDER BY
- COALESCE()
- Table Aliases

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Customers

Columns
--------
customer_id
customer_name
city

Sample Data
-----------

customer_id | customer_name | city
-----------------------------------
101         | Rahul Sharma  | Pune
102         | Priya Mehta   | Mumbai
103         | Aman Verma    | Jaipur
104         | Neha Kapoor   | Delhi


Table Name : Orders

Columns
--------
order_id
customer_id
product_id
quantity
order_date

Sample Data
-----------

order_id | customer_id | product_id | quantity | order_date
------------------------------------------------------------
5001     | 101         | P101       | 2        | 2026-07-01
5002     | 101         | P102       | 1        | 2026-07-05
5003     | 102         | P103       | 3        | 2026-07-02
5004     | 103         | P101       | 1        | 2026-07-03


Table Name : Products

Columns
--------
product_id
product_name
price

Sample Data
-----------

product_id | product_name         | price
------------------------------------------
P101       | Wireless Mouse       | 899.00
P102       | Mechanical Keyboard  | 3499.00
P103       | Office Chair         | 7999.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.quantity * p.price), 0) AS total_spent,
    COALESCE(AVG(o.quantity * p.price), 0) AS average_order_value
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
LEFT JOIN Products AS p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY
    total_spent DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

The Customers table is used as the primary table so that every customer is
included in the report.

The Orders table is joined to retrieve each customer's purchases.

The Products table provides the price required to calculate the order value.

Aggregate functions summarize the purchasing activity:

• COUNT() calculates the number of orders.
• SUM() calculates the total amount spent.
• AVG() calculates the average order value.

COALESCE() replaces NULL values with 0 for customers who have not placed any
orders.

The results are sorted by total spending in descending order.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | customer_name | total_orders | total_spent | average_order_value
----------------------------------------------------------------------------
102         | Priya Mehta   | 1            | 23997.00    | 23997.00
101         | Rahul Sharma  | 2            | 5297.00     | 2648.50
103         | Aman Verma    | 1            | 899.00      | 899.00
104         | Neha Kapoor   | 0            | 0.00        | 0.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LEFT JOIN when every customer should appear in the report.

✓ Use COALESCE() to replace NULL values in aggregate results.

✓ Group by all non-aggregated columns.

✓ Sort business reports using ORDER BY for easier analysis.

✓ Avoid SELECT * in reporting queries.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Lifetime Value (CLV) Reports

✓ Sales Performance Dashboards

✓ Customer Segmentation

✓ CRM Analytics

✓ Executive Sales Reporting

✓ Business Intelligence Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Aggregate Functions
→ LEFT JOIN
→ Multi-Table Joins

Next:
→ GROUP BY
→ HAVING
→ Window Functions

*/
