/*
==============================================================================
QUESTION
==============================================================================

Retrieve all products that cost more than ₹1000.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The merchandising team wants to identify premium-priced products for a special
marketing campaign. Only products with a selling price greater than ₹1000
should be included in the report.

Your task is to filter products based on their price.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- Greater Than Operator (>)

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
price
stock_quantity

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
    price,
    stock_quantity
FROM Products
WHERE price > 1000;

/*
==============================================================================
EXPLANATION
==============================================================================

The WHERE clause filters rows based on a specified condition.

The greater than (>) operator returns only those records where the value in the
price column is greater than 1000.

Products priced at exactly ₹1000 are not included because the operator checks
for values strictly greater than the specified amount.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name      | category      | price | stock_quantity
------------------------------------------------------------------------
102        | Office Chair      | Furniture     | 6499  | 45
105        | Laptop Stand      | Accessories   | 1499  | 80
108        | Bluetooth Speaker | Electronics   | 2999  | 60
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use comparison operators to retrieve only the data required for analysis.

✓ Apply filters at the database level instead of retrieving unnecessary rows.

✓ Verify whether the condition should include or exclude boundary values
  (for example, > versus >=).

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Premium Product Analysis

✓ Pricing Strategy Reports

✓ Inventory Planning

✓ Product Catalog Filtering

✓ Sales Performance Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ WHERE
→ Equality Operator (=)

Next:
→ Less Than (<)
→ Greater Than or Equal To (>=)
→ AND
→ OR

*/
