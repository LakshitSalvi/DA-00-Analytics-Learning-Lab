/*
==============================================================================
QUESTION
==============================================================================

Retrieve a list of all unique cities where customers are located.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The sales team is planning a city-wise marketing campaign and wants to know
which cities currently have registered customers.

Your task is to retrieve each city only once.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- DISTINCT
- FROM

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

SELECT DISTINCT city
FROM Customers;

/*
==============================================================================
EXPLANATION
==============================================================================

The DISTINCT keyword removes duplicate values from the selected column.

Without DISTINCT, every customer's city would be displayed, including
duplicates. Using DISTINCT ensures that each city appears only once in the
result set.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

city
---------
Pune
Mumbai
Jaipur
Delhi
Ahmedabad
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use DISTINCT only when duplicate values should be removed.

✓ Avoid unnecessary use of DISTINCT, as it can increase query execution time
  on very large datasets.

✓ Apply DISTINCT only to the columns where uniqueness is required.

*/
