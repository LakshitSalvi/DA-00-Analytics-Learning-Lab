/*
==================================================
Question
==================================================

Retrieve all records from the Customers table.

*/

/*
==================================================
Business Scenario
==================================================

A retail company has recently launched a customer
management system. The marketing team wants to
review the complete customer database before
starting a new email campaign.

Your task is to retrieve every record from the
Customers table.

*/

/*
==================================================
Concepts Covered
==================================================

- SELECT
- FROM
- SELECT *

*/

/*
==================================================
Assumed Table
==================================================

Table Name: Customers

Columns:

customer_id
first_name
last_name
email
phone
city

*/

/*
==================================================
SQL Solution
==================================================
*/

SELECT *
FROM Customers;

/*
==================================================
Explanation
==================================================

The SELECT statement is used to retrieve data
from a database table.

The asterisk (*) represents all columns in the
specified table.

This query returns every row and every column
from the Customers table.

*/

/*
==================================================
Expected Output
==================================================

customer_id | first_name | last_name | email | phone | city
------------------------------------------------------------
101         | Rahul      | Sharma    | ...   | ...   | Pune
102         | Priya      | Mehta     | ...   | ...   | Mumbai
103         | Aman       | Verma     | ...   | ...   | Jaipur
...

*/

/*
==================================================
Best Practices
==================================================

✓ Use SELECT * only when exploring data or
  learning SQL.

✓ In production environments, retrieve only the
  columns you actually need.

✓ Returning unnecessary columns increases
  network traffic and may reduce query
  performance on large datasets.

*/
