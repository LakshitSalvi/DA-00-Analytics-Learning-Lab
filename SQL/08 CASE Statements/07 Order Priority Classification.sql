/*
==============================================================================
QUESTION
==============================================================================

Classify customer orders into priority levels using the CASE statement based
on order amount and shipping method.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

An e-commerce company wants to prioritize order processing in its warehouse.

The priority rules are:

• High Priority
    - Express Shipping
    - AND Order Amount ≥ 10,000

• Medium Priority
    - Express Shipping
    OR Order Amount between 5,000 and 9,999

• Low Priority
    - All remaining orders

Your task is to classify each order based on these business rules.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- CASE Statement
- Multiple WHEN Conditions
- Logical Operators (AND, OR)
- Business Rule Implementation
- Conditional Classification

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Orders

Columns
--------
order_id
customer_name
shipping_method
order_amount

Sample Data
-----------

order_id | customer_name | shipping_method | order_amount
----------------------------------------------------------
1001     | Rahul         | Express         | 15000
1002     | Priya         | Standard        | 7500
1003     | Aman          | Express         | 6500
1004     | Neha          | Standard        | 3200
1005     | Kavya         | Express         | 12000
1006     | Arjun         | Standard        | 9800
1007     | Sneha         | Express         | 2500

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    order_id,
    customer_name,
    shipping_method,
    order_amount,

    CASE
        WHEN shipping_method = 'Express'
             AND order_amount >= 10000
            THEN 'High Priority'

        WHEN shipping_method = 'Express'
             OR order_amount BETWEEN 5000 AND 9999
            THEN 'Medium Priority'

        ELSE 'Low Priority'

    END AS order_priority

FROM Orders

ORDER BY
    order_amount DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CASE statement evaluates each order against the business rules.

Step 2:

Orders with Express shipping AND an order amount of at least 10,000 are
classified as 'High Priority'.

Step 3:

Orders with Express shipping OR an order amount between 5,000 and 9,999 are
classified as 'Medium Priority'.

Step 4:

All remaining orders are classified as 'Low Priority'.

Since CASE stops after the first matching condition, the highest-priority rule
must appear first.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

order_id | customer_name | shipping_method | order_amount | order_priority
--------------------------------------------------------------------------
1001     | Rahul         | Express         | 15000        | High Priority
1005     | Kavya         | Express         | 12000        | High Priority
1006     | Arjun         | Standard        | 9800         | Medium Priority
1002     | Priya         | Standard        | 7500         | Medium Priority
1003     | Aman          | Express         | 6500         | Medium Priority
1004     | Neha          | Standard        | 3200         | Low Priority
1007     | Sneha         | Express         | 2500         | Medium Priority

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Place the most restrictive conditions first.

✓ Combine AND and OR carefully to avoid incorrect classifications.

✓ Use parentheses when business rules become more complex.

✓ Always include an ELSE clause.

✓ Document business rules clearly for future maintenance.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Warehouse Order Processing

✓ Logistics Prioritization

✓ Same-Day Delivery Systems

✓ Supply Chain Management

✓ E-commerce Fulfillment

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Customer Loyalty Classification

Next:
→ Business KPI Dashboard
→ Conditional Aggregation
→ CASE with SUM()
→ CASE with COUNT()

*/
