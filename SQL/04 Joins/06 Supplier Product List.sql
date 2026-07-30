/*
==============================================================================
QUESTION
==============================================================================

Retrieve the list of suppliers along with the products they supply.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The procurement department wants to generate a report showing each supplier
and the products they supply. This helps track supplier relationships,
evaluate supplier performance, and manage inventory effectively.

Your task is to retrieve the supplier details along with their supplied
products.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- INNER JOIN
- ON
- One-to-Many Relationship
- Table Aliases

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Suppliers

Columns
--------
supplier_id
supplier_name
city

Sample Data
-----------

supplier_id | supplier_name        | city
-----------------------------------------
S101        | Tech Supplies Ltd.   | Mumbai
S102        | Office World         | Pune
S103        | Elite Electronics    | Bengaluru


Table Name : Products

Columns
--------
product_id
product_name
category
price
supplier_id

Sample Data
-----------

product_id | product_name          | category      | price   | supplier_id
-----------------------------------------------------------------------------
P101       | Wireless Mouse        | Electronics   | 899.00  | S101
P102       | Mechanical Keyboard   | Electronics   | 3499.00 | S101
P103       | Office Chair          | Furniture     | 7999.00 | S102
P104       | Notebook              | Stationery    | 99.00   | S102
P105       | Water Bottle          | Accessories   | 299.00  | S103

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    s.supplier_name,
    s.city,
    p.product_name,
    p.category,
    p.price
FROM Suppliers AS s
INNER JOIN Products AS p
    ON s.supplier_id = p.supplier_id;

/*
==============================================================================
EXPLANATION
==============================================================================

The Suppliers table contains information about suppliers, while the Products
table contains information about products.

The supplier_id column acts as the relationship between the two tables.

The INNER JOIN returns only the records where a supplier has matching products,
displaying supplier information alongside each supplied product.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

supplier_name      | city      | product_name          | category      | price
------------------------------------------------------------------------------
Tech Supplies Ltd. | Mumbai    | Wireless Mouse        | Electronics   | 899.00
Tech Supplies Ltd. | Mumbai    | Mechanical Keyboard   | Electronics   | 3499.00
Office World       | Pune      | Office Chair          | Furniture     | 7999.00
Office World       | Pune      | Notebook              | Stationery    | 99.00
Elite Electronics  | Bengaluru | Water Bottle          | Accessories   | 299.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use INNER JOIN when only matching records are required.

✓ Define relationships using primary and foreign keys.

✓ Use table aliases to simplify multi-table queries.

✓ Select only the required columns instead of using SELECT *.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Supplier Management Systems

✓ Procurement Reports

✓ Inventory Management

✓ Supply Chain Analytics

✓ Vendor Performance Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Many-to-Many Relationships

Next:
→ Three-Table Joins
→ Sales Across Multiple Tables

*/
