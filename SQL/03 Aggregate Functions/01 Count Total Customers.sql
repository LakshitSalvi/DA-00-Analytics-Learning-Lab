/*
==============================================================================
QUESTION
==============================================================================

Retrieve the total number of customers.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The management team wants to understand the size of the company's customer
base before launching a new marketing campaign.

Your task is to calculate the total number of customers registered in the
system.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- COUNT()
- Column Alias (AS)

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
city

Sample Data
-----------

customer_id | first_name | last_name | email                 | city
---------------------------------------------------------------------------
101         | Rahul      | Sharma    | rahul@email.com       | Pune
102         | Priya      | Mehta     | priya@email.com       | Mumbai
103         | Aman       | Verma     | aman@email.com        | Jaipur
104         | Neha       | Kapoor    | neha@email.com        | Delhi
105         | Rohan      | Singh     | rohan@email.com       | Bengaluru

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    COUNT(*) AS total_customers
FROM Customers;

/*
==============================================================================
EXPLANATION
==============================================================================

The COUNT() function is an aggregate function that returns the total number of
rows in a table.

The asterisk (*) tells SQL to count every row, regardless of whether any
column contains NULL values.

The AS keyword assigns a meaningful alias to the result, making reports easier
to read.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

total_customers
---------------
5

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use COUNT(*) when you want to count all rows in a table.

✓ Use descriptive aliases with AS to improve readability.

✓ COUNT(*) is generally preferred over COUNT(column_name) when counting
  complete records.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Base Analysis

✓ CRM Dashboards

✓ Executive KPI Reports

✓ Marketing Campaign Planning

✓ Business Growth Tracking

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Next:
→ SUM()
→ AVG()
→ GROUP BY
→ HAVING

*/
