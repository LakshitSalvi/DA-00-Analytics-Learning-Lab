/*
==============================================================================
QUESTION
==============================================================================

Retrieve a sales report showing customer details, product information, supplier
details, and order information.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales management team requires a comprehensive report that combines
customer, order, product, and supplier information into a single dataset.

This report helps business analysts understand:

- Who purchased the product
- Which product was purchased
- Who supplied the product
- Order quantity and sales amount

Your task is to generate a complete sales report by joining multiple related
tables.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- INNER JOIN
- Multiple Table Joins
- Primary Keys
- Foreign Keys
- Table Aliases
- Column Aliases (AS)

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
5002     | 102         | P103       | 1        | 2026-07-02
5003     | 103         | P102       | 3        | 2026-07-03


Table Name : Products

Columns
--------
product_id
product_name
price
supplier_id

Sample Data
-----------

product_id | product_name         | price   | supplier_id
----------------------------------------------------------
P101       | Wireless Mouse       | 899.00  | S101
P102       | Mechanical Keyboard  | 3499.00 | S101
P103       | Office Chair         | 7999.00 | S102


Table Name : Suppliers

Columns
--------
supplier_id
supplier_name

Sample Data
-----------

supplier_id | supplier_name
----------------------------
S101        | Tech Supplies Ltd.
S102        | Office World

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    p.product_name,
    s.supplier_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS total_amount,
    o.order_date
FROM Orders AS o
INNER JOIN Customers AS c
    ON o.customer_id = c.customer_id
INNER JOIN Products AS p
    ON o.product_id = p.product_id
INNER JOIN Suppliers AS s
    ON p.supplier_id = s.supplier_id;

/*
==============================================================================
EXPLANATION
==============================================================================

The Orders table serves as the central table.

The query joins:

• Orders → Customers
• Orders → Products
• Products → Suppliers

Each INNER JOIN retrieves related information using the primary key and foreign
key relationships.

A calculated column is added to determine the total order amount by
multiplying the quantity by the product price.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_name | city    | product_name         | supplier_name       | quantity | price   | total_amount | order_date
-------------------------------------------------------------------------------------------------------------------------------
5001     | Rahul Sharma  | Pune    | Wireless Mouse       | Tech Supplies Ltd.  | 2        | 899.00  | 1798.00      | 2026-07-01
5002     | Priya Mehta   | Mumbai  | Office Chair         | Office World        | 1        | 7999.00 | 7999.00      | 2026-07-02
5003     | Aman Verma    | Jaipur  | Mechanical Keyboard  | Tech Supplies Ltd.  | 3        | 3499.00 | 10497.00     | 2026-07-03

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Start with the central transaction table (Orders).

✓ Join related tables using primary and foreign keys.

✓ Use meaningful aliases to improve readability.

✓ Calculate derived metrics directly in the query when appropriate.

✓ Avoid SELECT * in production queries.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Sales Dashboards

✓ Executive Business Reports

✓ Retail Analytics

✓ Order Management Systems

✓ Supply Chain Reporting

✓ Business Intelligence Solutions

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ One-to-Many Relationships
→ Many-to-Many Relationships
→ Self Join

Next:
→ Customer Purchase Reports
→ Aggregate Functions with JOINs
→ Window Functions with JOINs

*/
