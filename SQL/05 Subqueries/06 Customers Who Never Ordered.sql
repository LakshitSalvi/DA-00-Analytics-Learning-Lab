/*
==============================================================================
QUESTION
==============================================================================

Retrieve all customers who have never placed an order.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing team wants to identify inactive customers who have registered
but have never made a purchase.

These customers can be targeted with welcome discounts, promotional offers,
or re-engagement campaigns.

Your task is to retrieve all customers who do not have any associated orders.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Correlated Subquery
- NOT EXISTS
- WHERE Clause
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
first_name
last_name
email
city

Sample Data
-----------

customer_id | first_name | last_name | email              | city
----------------------------------------------------------------------
101         | Rahul      | Sharma    | rahul@email.com    | Pune
102         | Priya      | Mehta     | priya@email.com    | Mumbai
103         | Aman       | Verma     | aman@email.com     | Jaipur
104         | Neha       | Kapoor    | neha@email.com     | Delhi
105         | Rohan      | Singh     | rohan@email.com    | Bengaluru
106         | Kavya      | Iyer      | kavya@email.com    | Chennai


Table Name : Orders

Columns
--------
order_id
customer_id
product_id
order_date

Sample Data
-----------

order_id | customer_id | product_id | order_date
-------------------------------------------------
5001     | 101         | P101       | 2026-07-01
5002     | 102         | P103       | 2026-07-02
5003     | 101         | P102       | 2026-07-05
5004     | 103         | P104       | 2026-07-08

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
FROM Customers AS c
WHERE NOT EXISTS
(
    SELECT 1
    FROM Orders AS o
    WHERE o.customer_id = c.customer_id
);

/*
==============================================================================
EXPLANATION
==============================================================================

This query uses a Correlated Subquery because the inner query references a
column from the outer query.

For every customer in the Customers table:

1. The subquery searches the Orders table for a matching customer_id.

2. If a matching order exists, EXISTS returns TRUE.

3. NOT EXISTS reverses the result, returning only customers for whom no
matching order exists.

Since the subquery runs once for each row in the outer query, it is called a
Correlated Subquery.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | city
--------------------------------------------
104         | Neha       | Kapoor    | Delhi
105         | Rohan      | Singh     | Bengaluru
106         | Kavya      | Iyer      | Chennai

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Prefer NOT EXISTS over NOT IN when NULL values may exist.

✓ Use SELECT 1 inside EXISTS because only row existence is checked.

✓ Always correlate the subquery using the appropriate key columns.

✓ Use meaningful table aliases for readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Inactive Customer Reports

✓ Customer Retention Campaigns

✓ CRM Analytics

✓ Marketing Automation

✓ Customer Engagement Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Departments with Highest Payroll

Next:
→ Top Selling Product
→ EXISTS
→ LEFT JOIN vs NOT EXISTS
→ Window Functions

*/
