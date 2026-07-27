/*
==============================================================================
QUESTION
==============================================================================

Retrieve all customers who are located in New York.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The regional sales team is planning a promotional campaign exclusively for
customers living in New York. To create the target customer list, only
customers whose city is 'New York' should be retrieved.

Your task is to filter the customer records based on their city.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- Equality Operator (=)

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Customers

Columns
--------
customer_id
first_name
last_name
email
phone
city

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    customer_id,
    first_name,
    last_name,
    email,
    city
FROM Customers
WHERE city = 'New York';

/*
==============================================================================
EXPLANATION
==============================================================================

The WHERE clause filters rows that satisfy a specified condition.

In this query, only customers whose city is exactly 'New York' are returned.
Rows that do not meet the condition are excluded from the result.

The equality operator (=) compares the value in the city column with the
specified text value.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | email              | city
-----------------------------------------------------------------------
101         | John       | Smith     | john@email.com     | New York
108         | Emily      | Davis     | emily@email.com    | New York
115         | Michael    | Brown     | michael@email.com  | New York
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use the WHERE clause to retrieve only the records required for analysis.

✓ Use meaningful filtering conditions to reduce unnecessary data retrieval.

✓ Store text values inside single quotes ('').

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Regional Marketing Campaigns

✓ Customer Segmentation

✓ Territory-wise Sales Analysis

✓ Branch Performance Reporting

✓ Location-based Business Intelligence

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ SELECT
→ ORDER BY

Next:
→ Comparison Operators
→ AND
→ OR
→ IN

*/
