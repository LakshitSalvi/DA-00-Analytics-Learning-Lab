/*
==============================================================================
QUESTION
==============================================================================

Retrieve all customers who have placed at least one order.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales department wants to identify active customers who have made
purchases. This information can be used for customer engagement campaigns,
loyalty programs, and sales reporting.

Your task is to retrieve all customers who have placed one or more orders.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- IN Operator
- WHERE Clause
- Single-Column Subquery
- DISTINCT

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
105         | Rohan Singh   | Bengaluru


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
    customer_id,
    customer_name,
    city
FROM Customers
WHERE customer_id IN
(
    SELECT DISTINCT customer_id
    FROM Orders
);

/*
==============================================================================
EXPLANATION
==============================================================================

The subquery retrieves all unique customer IDs from the Orders table.

    SELECT DISTINCT customer_id
    FROM Orders

The outer query then returns only those customers whose customer_id exists in
the list returned by the subquery.

The DISTINCT keyword ensures duplicate customer IDs are removed before the
comparison.

Since the subquery returns multiple values, this is called a Multiple-Row
Subquery.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | customer_name | city
-----------------------------------
101         | Rahul Sharma  | Pune
102         | Priya Mehta   | Mumbai
103         | Aman Verma    | Jaipur

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use IN when comparing against multiple values returned by a subquery.

✓ Use DISTINCT when duplicate values are not needed.

✓ Ensure the data types of the compared columns are compatible.

✓ Prefer EXISTS for large datasets when checking for related records.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Active Customer Reports

✓ Loyalty Program Eligibility

✓ Sales Analytics

✓ CRM Dashboards

✓ Customer Segmentation

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Single-Row Subqueries

Next:
→ NOT IN
→ EXISTS
→ NOT EXISTS
→ Correlated Subqueries

*/
