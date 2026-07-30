/*
==============================================================================
QUESTION
==============================================================================

Retrieve all products whose price is greater than the average price of all
products.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The product management team wants to identify premium-priced products for
pricing analysis and promotional campaigns.

Your task is to retrieve all products whose price is higher than the average
price of all available products.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Subquery
- AVG()
- WHERE Clause
- Comparison Operators
- Single-Row Subquery

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

Sample Data
-----------

product_id | product_name         | category      | price
----------------------------------------------------------
P101       | Wireless Mouse       | Electronics   | 899.00
P102       | Mechanical Keyboard  | Electronics   | 3499.00
P103       | Office Chair         | Furniture     | 7999.00
P104       | Notebook             | Stationery    | 99.00
P105       | Water Bottle         | Accessories   | 299.00
P106       | Laptop Stand         | Accessories   | 1499.00

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
    price
FROM Products
WHERE price >
(
    SELECT AVG(price)
    FROM Products
);

/*
==============================================================================
EXPLANATION
==============================================================================

The subquery calculates the average price of all products.

    SELECT AVG(price)
    FROM Products

The outer query compares each product's price with the calculated average.

Only products whose price is greater than the average price are returned.

Since the subquery returns a single value, this is a Single-Row Subquery.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

Average Price = 2,049.00

product_id | product_name         | category    | price
--------------------------------------------------------
P102       | Mechanical Keyboard  | Electronics | 3499.00
P103       | Office Chair         | Furniture   | 7999.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use aggregate functions inside subqueries for dynamic comparisons.

✓ Format subqueries with proper indentation.

✓ Ensure the subquery returns only one value when using comparison operators.

✓ Consider Common Table Expressions (CTEs) when the same calculation is reused
  multiple times.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Premium Product Identification

✓ Pricing Analysis

✓ Product Portfolio Management

✓ Retail Analytics

✓ Business Intelligence Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Single-Row Subqueries
→ Multiple-Row Subqueries (IN)

Next:
→ Correlated Subqueries
→ EXISTS
→ NOT EXISTS
→ Scalar Subqueries

*/
