/*
==============================================================================
QUESTION
==============================================================================

Retrieve all products that do not belong to the 'Electronics' category.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The inventory team is reviewing products outside the Electronics category to
plan a warehouse reorganization. They need a report containing all products
except those classified as Electronics.

Your task is to exclude products from the Electronics category.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- NOT IN Operator

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
WHERE category NOT IN ('Electronics');

/*
==============================================================================
EXPLANATION
==============================================================================

The NOT IN operator excludes rows whose values match those specified in the
list.

In this query, all products except those in the Electronics category are
returned.

Although only one value is used here, NOT IN becomes especially useful when
excluding multiple values from the same column.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name   | category      | price | stock_quantity
---------------------------------------------------------------------
102        | Office Chair   | Furniture     | 6499  | 45
104        | Water Bottle   | Home          | 499   | 300
107        | Laptop Stand   | Accessories   | 1499  | 80
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use NOT IN to exclude one or more values from a column.

✓ Use NOT IN instead of multiple != conditions for better readability.

✓ Ensure the values inside the NOT IN list match the column's data type.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Category-wise Inventory Analysis

✓ Product Portfolio Reviews

✓ Warehouse Management

✓ Sales Category Reporting

✓ Inventory Optimization

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ IN Operator

Next:
→ LIKE
→ IS NULL
→ IS NOT NULL

*/
