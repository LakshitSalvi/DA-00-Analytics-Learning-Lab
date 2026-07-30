/*
==============================================================================
QUESTION
==============================================================================

Divide customers into four equal groups (quartiles) based on their total
purchase amount using the NTILE() window function.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing team wants to segment customers according to their spending
behavior.

Customers should be divided into four equal-sized groups:

• Quartile 1 → Highest spenders
• Quartile 2
• Quartile 3
• Quartile 4 → Lowest spenders

This segmentation will help create personalized marketing campaigns and loyalty
programs.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- Window Functions
- NTILE()
- OVER()
- ORDER BY
- Common Table Expression (CTE)
- Aggregate Functions
- SUM()
- GROUP BY

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Orders

Columns
--------
order_id
customer_id
customer_name
order_amount

Sample Data
-----------

order_id | customer_id | customer_name | order_amount
------------------------------------------------------
1001     | C101        | Rahul         | 2500.00
1002     | C102        | Priya         | 1800.00
1003     | C103        | Aman          | 4200.00
1004     | C104        | Neha          | 3100.00
1005     | C101        | Rahul         | 1500.00
1006     | C102        | Priya         | 2200.00
1007     | C105        | Kavya         | 5000.00
1008     | C106        | Rohan         | 2800.00
1009     | C103        | Aman          | 1800.00
1010     | C104        | Neha          | 1700.00
1011     | C105        | Kavya         | 2500.00
1012     | C106        | Rohan         | 1200.00

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

WITH CustomerSales AS
(
    SELECT
        customer_id,
        customer_name,
        SUM(order_amount) AS total_sales
    FROM Orders
    GROUP BY
        customer_id,
        customer_name
)

SELECT
    customer_id,
    customer_name,
    total_sales,

    NTILE(4) OVER
    (
        ORDER BY total_sales DESC
    ) AS customer_quartile

FROM CustomerSales
ORDER BY total_sales DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CTE calculates the total purchase amount for each customer.

Step 2:

The NTILE(4) window function sorts customers by total sales in descending order
and divides them into four groups of nearly equal size.

Quartile 1 contains the highest-spending customers, while Quartile 4 contains
the lowest-spending customers.

If the number of rows cannot be divided equally, the first quartiles receive
one additional row.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | customer_name | total_sales | customer_quartile
--------------------------------------------------------------
C105        | Kavya         | 7500.00     | 1
C103        | Aman          | 6000.00     | 1
C104        | Neha          | 4800.00     | 2
C101        | Rahul         | 4000.00     | 2
C102        | Priya         | 4000.00     | 3
C106        | Rohan         | 4000.00     | 4

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use NTILE() for customer segmentation and percentile analysis.

✓ Aggregate business metrics before applying window functions.

✓ Always specify ORDER BY inside the OVER() clause.

✓ Use a CTE to separate calculations from reporting logic.

✓ Remember that NTILE() distributes rows, not values.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Segmentation

✓ Loyalty Programs

✓ Credit Risk Analysis

✓ Sales Territory Planning

✓ Marketing Campaign Targeting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Top Three Salaries per Department

Next:
→ Previous Month Sales
→ PERCENT_RANK()
→ CUME_DIST()
→ Percentile Analysis

*/
