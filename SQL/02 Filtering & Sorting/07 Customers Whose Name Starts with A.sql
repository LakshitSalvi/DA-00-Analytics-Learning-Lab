/*
==============================================================================
QUESTION
==============================================================================

Retrieve all customers whose first name starts with the letter 'A'.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer relationship team is preparing a personalized communication
campaign for a specific customer segment. They need to retrieve customers whose
first names begin with the letter 'A'.

Your task is to identify customers using pattern matching.

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
WHERE first_name LIKE 'A%';

/*
==============================================================================
EXPLANATION
==============================================================================

The LIKE operator is used to search for values that match a specified pattern.

The '%' wildcard represents zero or more characters.

In this query, 'A%' means:
- The first name must begin with the letter 'A'.
- Any number of characters may follow after 'A'.

Examples of matching names include:
- Aman
- Anjali
- Aryan
- Aditi

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | email             | city
----------------------------------------------------------------------
101         | Aman       | Verma     | aman@email.com    | Jaipur
108         | Anjali     | Sharma    | anjali@email.com  | Mumbai
115         | Aryan      | Gupta     | aryan@email.com   | Delhi
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use LIKE when searching for partial text matches.

✓ Use '%' to match any number of characters.

✓ Keep pattern matching as specific as possible to improve query performance.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Search Features

✓ CRM Systems

✓ Employee Directory Search

✓ E-commerce Product Search

✓ Customer Segmentation

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ NOT IN Operator

Next:
→ LIKE with Ending Patterns
→ _ Wildcard
→ IS NULL

*/
