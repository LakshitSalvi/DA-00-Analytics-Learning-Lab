/*
==============================================================================
QUESTION
==============================================================================

Retrieve only the customer's first name, last name, and email address from the
Customers table.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing team is preparing an email campaign and only requires the
customer's name and email address. Retrieving unnecessary columns would
increase data transfer and reduce query efficiency.

Your task is to retrieve only the required information.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- FROM
- Selecting Specific Columns

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
    first_name,
    last_name,
    email
FROM Customers;

/*
==============================================================================
EXPLANATION
==============================================================================

Instead of retrieving every column using SELECT *, this query selects only
the columns required for the task.

Selecting only the necessary columns improves readability, reduces memory
usage, and enhances query performance, especially when working with large
datasets.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

first_name | last_name | email
-----------------------------------------------
Rahul       | Sharma    | rahul@gmail.com
Priya       | Mehta     | priya@gmail.com
Aman        | Verma     | aman@gmail.com
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Retrieve only the columns required for your analysis.

✓ Avoid using SELECT * in production environments unless every column is
  genuinely needed.

✓ Selecting fewer columns improves query performance and makes SQL queries
  easier to understand and maintain.

*/
