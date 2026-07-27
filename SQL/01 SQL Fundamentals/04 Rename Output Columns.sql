/*
==============================================================================
QUESTION
==============================================================================

Retrieve the customer's first name, last name, and email address while
renaming the output columns to make them more user-friendly.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer service team needs a report that will be shared with non-technical
employees. Instead of database column names, the report should display clear
and meaningful column headings.

Your task is to rename the output columns without changing the actual database
structure.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- Column Alias
- AS Keyword

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
    first_name AS "First Name",
    last_name AS "Last Name",
    email AS "Email Address"
FROM Customers;

/*
==============================================================================
EXPLANATION
==============================================================================

The AS keyword is used to assign a temporary name (alias) to a column in the
query result.

Aliases improve readability and make reports easier to understand. They only
change the column heading displayed in the output and do not modify the actual
database column names.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

First Name | Last Name | Email Address
----------------------------------------------
Rahul      | Sharma    | rahul@gmail.com
Priya      | Mehta     | priya@gmail.com
Aman       | Verma     | aman@gmail.com
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use meaningful aliases when generating reports or dashboards.

✓ Use double quotes around aliases containing spaces for better compatibility.

✓ Keep aliases short, descriptive, and easy to understand.

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Retrieve Specific Columns

Next:
→ LIMIT
→ CONCAT()
→ Expressions in SELECT

*/
