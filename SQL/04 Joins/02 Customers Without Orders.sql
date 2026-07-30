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

The marketing team wants to identify customers who have registered but have
not yet placed any orders. These customers can be targeted with promotional
offers to encourage their first purchase.

Your task is to retrieve customers who do not have any associated orders.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- LEFT JOIN
- ON
- IS NULL
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

customer_id | first_name | last_name | email                 | city
---------------------------------------------------------------------------
101         | Rahul      | Sharma    | rahul@email.com       | Pune
102         | Priya      | Mehta     | priya@email.com       | Mumbai
103         | Aman       | Verma     | aman@email.com        | Jaipur
104         | Neha       | Kapoor    | neha@email.com        | Delhi
105         | Rohan      | Singh     | rohan@email.com       | Bengaluru
106         | Kavya      | Iyer      | kavya@email.com       | Chennai


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
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

/*
==============================================================================
EXPLANATION
==============================================================================

A LEFT JOIN returns all rows from the left table (Customers), even if there is
no matching row in the right table (Orders).

For customers who have never placed an order, the columns from the Orders
table contain NULL values.

The WHERE clause filters these rows by checking where order_id IS NULL,
returning only customers without any orders.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | city
-------------------------------------------
105         | Rohan      | Singh     | Bengaluru
106         | Kavya      | Iyer      | Chennai

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LEFT JOIN when all records from the left table must be included.

✓ Check for NULL values in the joined table to identify unmatched records.

✓ Use meaningful table aliases to improve query readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Retention Analysis

✓ Marketing Campaign Targeting

✓ Inactive Customer Identification

✓ CRM Reporting

✓ Customer Acquisition Strategies

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ INNER JOIN

Next:
→ Self Join
→ RIGHT JOIN
→ FULL OUTER JOIN

*/
