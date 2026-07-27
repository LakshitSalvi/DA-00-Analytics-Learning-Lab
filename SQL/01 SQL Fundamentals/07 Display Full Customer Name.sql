/*
==============================================================================
QUESTION
==============================================================================

Retrieve each customer's full name by combining their first name and last name
into a single column.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer support team is generating a report for client communication.
Instead of displaying separate first and last name columns, the report should
show each customer's complete name in a single column.

Your task is to combine the customer's first and last names into one field.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- CONCAT()
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
    customer_id,
    CONCAT(first_name, ' ', last_name) AS "Full Name",
    email,
    city
FROM Customers;

/*
==============================================================================
EXPLANATION
==============================================================================

The CONCAT() function joins two or more values into a single string.

In this example, the customer's first name and last name are combined with a
space between them to create a full name.

Using CONCAT() improves the readability of reports and avoids requiring
applications to combine names after retrieving the data.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | Full Name       | email             | city
---------------------------------------------------------------
101         | Rahul Sharma    | rahul@gmail.com   | Pune
102         | Priya Mehta     | priya@gmail.com   | Mumbai
103         | Aman Verma      | aman@gmail.com    | Jaipur
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use CONCAT() when displaying user-friendly information in reports.

✓ Include separators such as spaces, commas, or hyphens where appropriate.

✓ Use meaningful aliases for concatenated columns.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ CRM Customer Reports

✓ Banking Customer Statements

✓ HR Employee Directories

✓ Sales & Marketing Dashboards

✓ E-commerce Customer Lists

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ Arithmetic Expressions

Next:
→ COALESCE()
→ ORDER BY
→ String Functions

*/
