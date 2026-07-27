/*
==============================================================================
QUESTION
==============================================================================

Retrieve all products whose names end with the word 'Pro'.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The product management team is reviewing all premium product variants that
follow the company's "Pro" naming convention. They need a report containing
only products whose names end with "Pro".

Your task is to retrieve products using pattern matching.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- LIKE Operator
- % Wildcard

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
WHERE product_name LIKE '%Pro';

/*
==============================================================================
EXPLANATION
==============================================================================

The LIKE operator searches for values matching a specified pattern.

The '%' wildcard represents zero or more characters.

In this query, '%Pro' means:

- The product name can contain any number of characters before "Pro".
- Every matching product name must end with "Pro".

Examples of matching product names include:

- Laptop Pro
- Phone Pro
- Camera Pro
- Tablet Pro

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name | category    | price | stock_quantity
-----------------------------------------------------------------
101        | Laptop Pro   | Electronics | 74999 | 30
107        | Phone Pro    | Electronics | 59999 | 45
115        | Camera Pro   | Electronics | 89999 | 18
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LIKE when searching for text patterns.

✓ Place the '%' wildcard carefully depending on where the pattern should
  appear.

✓ Keep search patterns as specific as possible for better readability and
  performance.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Product Catalog Search

✓ E-commerce Filtering

✓ Brand Product Analysis

✓ Inventory Management

✓ Product Naming Audits

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ LIKE with Prefix Matching

Next:
→ IS NULL
→ IS NOT NULL
→ Advanced Pattern Matching

*/
