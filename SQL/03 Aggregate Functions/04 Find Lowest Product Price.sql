/*
==============================================================================
QUESTION
==============================================================================

Find the lowest-priced product.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales team wants to identify the least expensive product available in the
catalog. This information helps in promotional campaigns, pricing strategies,
and inventory planning.

Your task is to retrieve the lowest product price.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- MIN()
- Column Alias (AS)

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

Sample Data
-----------

product_id | product_name        | category     | price   | stock_quantity
-------------------------------------------------------------------------
P101       | Wireless Mouse      | Electronics  | 899.00  | 120
P102       | Mechanical Keyboard | Electronics  | 3499.00 | 45
P103       | Office Chair        | Furniture    | 7999.00 | 18
P104       | Notebook            | Stationery   | 99.00   | 500
P105       | Water Bottle        | Accessories  | 299.00  | 250

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    MIN(price) AS lowest_price
FROM Products;

/*
==============================================================================
EXPLANATION
==============================================================================

The MIN() function returns the smallest value from a specified column.

In this query, SQL examines all values in the price column and returns the
lowest product price.

The AS keyword assigns a meaningful alias to the result for better readability.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

lowest_price
------------
99.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use MIN() with numeric or date columns to retrieve the smallest value.

✓ Apply meaningful aliases using AS for clear and readable reports.

✓ Ensure the selected column contains the appropriate data type for accurate
  results.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Product Pricing Analysis

✓ Inventory Management

✓ Promotional Campaign Planning

✓ Retail Price Monitoring

✓ Business Intelligence Dashboards

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ AVG()

Next:
→ MAX()
→ GROUP BY
→ HAVING

*/
