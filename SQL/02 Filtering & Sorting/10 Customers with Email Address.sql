/*
==============================================================================
QUESTION
==============================================================================

Retrieve all customers whose email address is not NULL.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing team is preparing an email campaign. Customer records without an
email address are stored as NULL in the database.

Your task is to retrieve only those customers whose email field contains a
value.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- WHERE
- IS NOT NULL

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
WHERE email IS NOT NULL;

/*
==============================================================================
EXPLANATION
==============================================================================

The IS NOT NULL operator returns rows where the specified column contains a
value.

Unlike comparison operators such as '=' or '!=', IS NOT NULL correctly checks
whether a column has a non-NULL value.

In this query, only customers whose email field is not NULL are included in
the result.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | first_name | last_name | email                | city
-----------------------------------------------------------------------
101         | Rahul      | Sharma    | rahul@email.com      | Pune
102         | Priya      | Mehta     | priya@email.com      | Mumbai
104         | Aman       | Verma     | aman@email.com       | Jaipur
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use IS NOT NULL when retrieving records that contain values in a column.

✓ Never use '= NULL' or '!= NULL' to check for NULL values.

✓ Consider validating for empty strings separately if your database stores
  missing values as '' instead of NULL.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Email Marketing Campaigns

✓ Customer Contact Reports

✓ CRM Systems

✓ Customer Data Quality Checks

✓ Marketing Analytics

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ IS NULL

Next:
→ ORDER BY
→ LIMIT
→ Aggregate Functions

*/
