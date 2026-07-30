/*
==============================================================================
QUESTION
==============================================================================

Classify products based on their stock quantity using the CASE statement.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The inventory management team wants to quickly identify products that require
restocking.

Products should be categorized into inventory status levels based on the
available stock quantity.

The classification rules are:

• Out of Stock : Stock = 0
• Low Stock : Stock between 1 and 20
• In Stock : Stock between 21 and 100
• Overstocked : Stock greater than 100

Your task is to display each product along with its inventory status.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- CASE Statement
- Multiple WHEN Conditions
- Conditional Classification
- Business Rule Implementation
- ORDER BY

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Products

Columns
--------
product_id
product_name
category
stock_quantity

Sample Data
-----------

product_id | product_name | category    | stock_quantity
---------------------------------------------------------
101        | Laptop       | Electronics | 15
102        | Mouse        | Electronics | 180
103        | Keyboard     | Electronics | 65
104        | Printer      | Electronics | 0
105        | Chair        | Furniture   | 42
106        | Desk         | Furniture   | 8
107        | Notebook     | Stationery  | 250

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    product_id,
    product_name,
    category,
    stock_quantity,

    CASE
        WHEN stock_quantity = 0 THEN 'Out of Stock'
        WHEN stock_quantity BETWEEN 1 AND 20 THEN 'Low Stock'
        WHEN stock_quantity BETWEEN 21 AND 100 THEN 'In Stock'
        ELSE 'Overstocked'
    END AS stock_status

FROM Products
ORDER BY
    stock_quantity ASC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CASE statement evaluates the stock quantity for each product.

Step 2:

Products with zero quantity are classified as 'Out of Stock'.

Step 3:

Products with quantities between 1 and 20 are classified as 'Low Stock'.

Step 4:

Products with quantities between 21 and 100 are classified as 'In Stock'.

Step 5:

Products with quantities greater than 100 are classified as 'Overstocked'.

The CASE statement stops evaluating conditions after the first successful match.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name | stock_quantity | stock_status
----------------------------------------------------------
104        | Printer      | 0              | Out of Stock
106        | Desk         | 8              | Low Stock
101        | Laptop       | 15             | Low Stock
105        | Chair        | 42             | In Stock
103        | Keyboard     | 65             | In Stock
102        | Mouse        | 180            | Overstocked
107        | Notebook     | 250            | Overstocked

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Place the most restrictive conditions first.

✓ Avoid overlapping stock ranges.

✓ Always include an ELSE clause.

✓ Use business-friendly labels.

✓ Review stock thresholds regularly as business needs change.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Inventory Management

✓ Warehouse Monitoring

✓ Retail Analytics

✓ ERP Systems

✓ Supply Chain Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Employee Salary Bands

Next:
→ Customer Loyalty Classification
→ Conditional Aggregation
→ CASE with SUM()

*/
