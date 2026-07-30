/*
==============================================================================
QUESTION
==============================================================================

Classify customers into loyalty tiers based on their total purchase amount
using the CASE statement.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

An e-commerce company wants to reward its customers based on their lifetime
spending.

Customers should be classified into the following loyalty tiers:

• Platinum : Total Purchase ≥ 50,000
• Gold : Total Purchase between 20,000 and 49,999
• Silver : Total Purchase between 10,000 and 19,999
• Bronze : Total Purchase below 10,000

Your task is to display each customer along with their loyalty tier.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- CASE Statement
- Multiple WHEN Conditions
- Business Rule Implementation
- Customer Segmentation
- ORDER BY

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Customers

Columns
--------
customer_id
customer_name
total_purchase

Sample Data
-----------

customer_id | customer_name | total_purchase
---------------------------------------------
101         | Rahul         | 65000
102         | Priya         | 42500
103         | Aman          | 18500
104         | Neha          | 8200
105         | Kavya         | 57000
106         | Arjun         | 24000
107         | Sneha         | 9500

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    customer_id,
    customer_name,
    total_purchase,

    CASE
        WHEN total_purchase >= 50000 THEN 'Platinum'
        WHEN total_purchase >= 20000 THEN 'Gold'
        WHEN total_purchase >= 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS loyalty_tier

FROM Customers
ORDER BY total_purchase DESC;

/*
==============================================================================
EXPLANATION
==============================================================================

Step 1:

The CASE statement evaluates each customer's total purchase amount.

Step 2:

Customers spending 50,000 or more are classified as 'Platinum'.

Step 3:

Customers spending between 20,000 and 49,999 are classified as 'Gold'.

Step 4:

Customers spending between 10,000 and 19,999 are classified as 'Silver'.

Step 5:

Customers spending below 10,000 are classified as 'Bronze'.

The first matching condition determines the customer's loyalty tier.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | customer_name | total_purchase | loyalty_tier
------------------------------------------------------------
101         | Rahul         | 65000          | Platinum
105         | Kavya         | 57000          | Platinum
102         | Priya         | 42500          | Gold
106         | Arjun         | 24000          | Gold
103         | Aman          | 18500          | Silver
107         | Sneha         | 9500           | Bronze
104         | Neha          | 8200           | Bronze

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Arrange CASE conditions from highest spending to lowest.

✓ Keep loyalty thresholds configurable.

✓ Use descriptive business-friendly tier names.

✓ Always include an ELSE clause.

✓ Review customer segmentation rules periodically.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Loyalty Programs

✓ CRM Dashboards

✓ Customer Lifetime Value (CLV)

✓ Personalized Marketing

✓ Reward & Membership Systems

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Product Stock Status

Next:
→ Order Priority Classification
→ CASE with Aggregate Functions
→ Business KPI Dashboard

*/
