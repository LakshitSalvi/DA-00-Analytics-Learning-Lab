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
- Single-Row Subquery
- AVG()
- WHERE Clause
- Comparison Operators

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

The calculated average is then returned to the outer query.

The outer query compares each product's price against the average and returns
only those products whose price is greater.

Since the subquery returns a single value, this is a Single-Row Subquery.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

Average Price = 2382.33

product_id | product_name         | category      | price
----------------------------------------------------------
P102       | Mechanical Keyboard  | Electronics   | 3499.00
P103       | Office Chair         | Furniture     | 7999.00

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use aggregate functions inside subqueries for dynamic filtering.

✓ Avoid hardcoding comparison values.

✓ Format subqueries with proper indentation for readability.

✓ Use meaningful column names in the output.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Premium Product Identification

✓ Product Pricing Analysis

✓ Retail Analytics

✓ Inventory Planning

✓ Executive Pricing Reports

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Customers with Maximum Orders

Next:
→ Departments with Highest Payroll
→ Scalar Subqueries
→ Correlated Subqueries

*/
