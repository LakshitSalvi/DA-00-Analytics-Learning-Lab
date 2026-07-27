/*
==============================================================================
QUESTION
==============================================================================

Retrieve the first 10 products from the Products table.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The product management team wants a quick preview of the product catalog before
reviewing inventory details.

Instead of retrieving the entire dataset, display only the first 10 records.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- FROM
- LIMIT

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

SELECT *
FROM Products
LIMIT 10;

/*
==============================================================================
EXPLANATION
==============================================================================

The LIMIT clause restricts the number of rows returned by a query.

Instead of displaying every product in the table, LIMIT returns only the first
10 rows. This is especially useful when working with large datasets and when
you want to preview data quickly.

Note:
Some database systems such as Microsoft SQL Server use TOP instead of LIMIT.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name      | category     | price | stock_quantity
-----------------------------------------------------------------------
101        | Wireless Mouse    | Electronics  | 899   | 150
102        | Office Chair      | Furniture    | 6499  | 45
103        | Water Bottle      | Home         | 499   | 300
...
110        | Laptop Stand      | Accessories  | 1499  | 80

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LIMIT when previewing large datasets.

✓ Combine LIMIT with ORDER BY to retrieve meaningful records, such as the
  highest-priced products or the latest orders.

✓ Avoid assuming LIMIT returns data in a specific order unless ORDER BY is
  explicitly used.

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ SELECT
→ DISTINCT
→ Column Aliases

Next:
→ Arithmetic Expressions
→ CONCAT()
→ ORDER BY

*/
