/*
==============================================================================
QUESTION
==============================================================================

Rank products based on their sales amount using the DENSE_RANK() window
function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales department wants to rank products according to their total sales
performance.

Products with identical sales should receive the same rank, and the ranking
should remain consecutive without gaps.

Your task is to rank products based on total sales using DENSE_RANK().

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- DENSE_RANK()
- OVER()
- ORDER BY
- Aggregate Functions
- SUM()
- GROUP BY

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : OrderDetails

Columns
--------
order_id
product_id
product_name
sales_amount

Sample Data
-----------

order_id | product_id | product_name          | sales_amount
--------------------------------------------------------------
1001     | P101       | Wireless Mouse        | 1500.00
1002     | P102       | Mechanical Keyboard   | 2500.00
1003     | P101       | Wireless Mouse        | 1500.00
1004     | P103       | Office Chair          | 3000.00
1005     | P104       | Laptop Stand          | 2500.00
1006     | P102       | Mechanical Keyboard   | 2500.00
1007     | P103       | Office Chair          | 2000.00
1008     | P104       | Laptop Stand          | 2500.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH ProductSales AS
(
    SELECT
        product_id,
        product_name,
        SUM(sales_amount) AS total_sales
    FROM OrderDetails
    GROUP BY
        product_id,
        product_name
)

SELECT
    product_id,
    product_name,
    total_sales,

    DENSE_RANK() OVER
    (
        ORDER BY total_sales DESC
    ) AS sales_rank

FROM ProductSales
ORDER BY
    sales_rank,
    product_name;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CTE calculates the total sales for each product.

Step 2:

The DENSE_RANK() window function ranks products based on total sales in
descending order.

Products with the same total sales receive the same rank.

Unlike RANK(), DENSE_RANK() does not skip rank numbers after ties, making it
ideal for business reports where continuous rankings are preferred.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

product_id | product_name         | total_sales | sales_rank
-------------------------------------------------------------
P102       | Mechanical Keyboard  | 5000.00     | 1
P103       | Office Chair         | 5000.00     | 1
P104       | Laptop Stand         | 5000.00     | 1
P101       | Wireless Mouse       | 3000.00     | 2

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Aggregate business metrics before applying ranking functions.

✓ Use DENSE_RANK() when tied values should not create ranking gaps.

✓ Keep ranking logic separate using a CTE.

✓ Always define an ORDER BY clause inside OVER().

✓ Use descriptive aliases for calculated columns.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Product Performance Reports

✓ Sales Leaderboards

✓ Revenue Dashboards

✓ Inventory Planning

✓ Executive Sales Analytics

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Rank Employees by Salary

Next:
→ Top Three Salaries per Department
→ RANK()
→ ROW_NUMBER()
→ NTILE()

*/
