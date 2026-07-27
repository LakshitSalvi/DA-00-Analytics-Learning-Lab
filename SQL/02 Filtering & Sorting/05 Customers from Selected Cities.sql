/*
==============================================================================
QUESTION
==============================================================================

Retrieve all customers who are located in either New York, Chicago, or Boston.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The regional marketing team is launching a campaign in three target cities:
New York, Chicago, and Boston. They need a customer list containing only
customers from these locations.

Your task is to retrieve customers who belong to any of the selected cities.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- IN Operator

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
WHERE city IN ('New York', 'Chicago', 'Boston');

/*
==============================================================================
EXPLANATION
==============================================================================

The IN operator allows you to compare a column against multiple values without
writing several OR conditions.

Instead of writing:

WHERE city = 'New York'
   OR city = 'Chicago'
   OR city = 'Boston'

you can write a cleaner and more readable query using the IN operator.

This improves readability and makes the query easier to maintain when the list
of values changes.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | email              | city
-----------------------------------------------------------------------
101         | John       | Smith     | john@email.com     | New York
105         | Sarah      | Wilson    | sarah@email.com    | Chicago
112         | David      | Miller    | david@email.com    | Boston
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use IN instead of multiple OR conditions when checking the same column.

✓ Keep the values inside the IN list consistent with the column's data type.

✓ Format long IN lists across multiple lines to improve readability.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Regional Marketing Campaigns

✓ Multi-city Sales Reports

✓ Store-wise Customer Analysis

✓ Delivery Zone Planning

✓ Business Territory Management

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ BETWEEN Operator
→ AND Operator

Next:
→ NOT IN
→ LIKE
→ IS NULL

*/
