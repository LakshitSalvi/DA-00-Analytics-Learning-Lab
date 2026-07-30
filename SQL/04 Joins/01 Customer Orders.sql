/*
==============================================================================
QUESTION
==============================================================================

Retrieve the order details along with the customer who placed each order.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer support team wants to generate an order report that displays both
customer information and order details. Since customer information and order
details are stored in separate tables, the data must be combined.

Your task is to retrieve each order along with the corresponding customer's
name.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- INNER JOIN
- ON
- Table Aliases
- Column Aliases (AS)

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

customer_id | first_name | last_name | email                 | city
---------------------------------------------------------------------------
101         | Rahul      | Sharma    | rahul@email.com       | Pune
102         | Priya      | Mehta     | priya@email.com       | Mumbai
103         | Aman       | Verma     | aman@email.com        | Jaipur
104         | Neha       | Kapoor    | neha@email.com        | Delhi
105         | Rohan      | Singh     | rohan@email.com       | Bengaluru


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
5001     | 101         | P101       | 2026-07-01 | 2        | 2400.00
5002     | 102         | P103       | 2026-07-02 | 1        | 850.00
5003     | 103         | P105       | 2026-07-03 | 3        | 4200.00
5004     | 101         | P102       | 2026-07-05 | 1        | 1250.00
5005     | 104         | P104       | 2026-07-06 | 4        | 5600.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.total_amount
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.customer_id = c.customer_id;

/*
==============================================================================
EXPLANATION
==============================================================================

The INNER JOIN combines rows from the Orders and Customers tables based on a
matching customer_id.

Only records that exist in both tables are returned.

Table aliases (o and c) make the query shorter and easier to read, especially
when working with multiple tables.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | first_name | last_name | order_date | total_amount
--------------------------------------------------------------
5001     | Rahul      | Sharma    | 2026-07-01 | 2400.00
5002     | Priya      | Mehta     | 2026-07-02 | 850.00
5003     | Aman       | Verma     | 2026-07-03 | 4200.00
5004     | Rahul      | Sharma    | 2026-07-05 | 1250.00
5005     | Neha       | Kapoor    | 2026-07-06 | 5600.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Always specify the JOIN condition using the ON clause.

✓ Use table aliases to improve readability when working with multiple tables.

✓ Select only the required columns instead of using SELECT *.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Order Reports

✓ CRM Systems

✓ E-Commerce Order Management

✓ Customer Purchase History

✓ Sales Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ GROUP BY
→ Aggregate Functions

Next:
→ LEFT JOIN
→ RIGHT JOIN
→ FULL OUTER JOIN

*/
