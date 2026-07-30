/*
==============================================================================
QUESTION
==============================================================================

Retrieve the customer(s) who have placed the highest number of orders.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales department wants to identify the most active customers based on the
number of orders they have placed.

This information helps recognize loyal customers, design reward programs, and
analyze customer purchasing behavior.

Your task is to retrieve the customer(s) who have placed the maximum number of
orders.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- GROUP BY
- COUNT()
- MAX()
- Nested Subqueries
- INNER JOIN
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
102         | Priya      | Mehta     | Mumbai
103         | Aman       | Verma     | Jaipur
104         | Neha       | Kapoor    | Delhi


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
--------------------------------------------------
5001     | 101         | P101       | 2026-07-01
5002     | 101         | P102       | 2026-07-02
5003     | 101         | P103       | 2026-07-04
5004     | 102         | P101       | 2026-07-03
5005     | 102         | P104       | 2026-07-06
5006     | 103         | P105       | 2026-07-05

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
    COUNT(o.order_id) AS total_orders
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(o.order_id) =
(
    SELECT MAX(order_count)
    FROM
    (
        SELECT
            COUNT(*) AS order_count
        FROM Orders
        GROUP BY customer_id
    ) AS CustomerOrders
);

/*
==============================================================================
EXPLANATION
==============================================================================

The query is executed in three stages.

Step 1:
The innermost subquery counts the number of orders placed by each customer.

    SELECT
        COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_id

Result:

customer_id | order_count
--------------------------
101         | 3
102         | 2
103         | 1

Step 2:
The outer subquery retrieves the maximum order count.

    SELECT MAX(order_count)
    FROM (...)

Result:
3

Step 3:
The main query joins Customers and Orders, groups the records by customer, and
returns only those customers whose order count equals the maximum value.

This approach automatically handles ties if multiple customers have the same
highest number of orders.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | total_orders
----------------------------------------------------
101         | Rahul      | Sharma    | 3

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use GROUP BY before applying aggregate filters.

✓ Use meaningful aliases for derived tables.

✓ Avoid hardcoding aggregate values.

✓ Design queries to handle ties naturally.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Loyalty Programs

✓ CRM Dashboards

✓ Sales Performance Reports

✓ Customer Segmentation

✓ Business Intelligence Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Second Highest Salary

Next:
→ Products More Expensive Than Average
→ Departments with Highest Payroll
→ Window Functions (RANK, DENSE_RANK)

*/
