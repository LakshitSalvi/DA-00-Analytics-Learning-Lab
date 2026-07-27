/*
==============================================================================
QUESTION
==============================================================================

Retrieve each customer's phone number. If a customer does not have a phone
number, display 'Not Available' instead of NULL.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The customer support team is generating a contact directory. Some customers
have not provided their phone numbers, resulting in NULL values.

Your task is to replace NULL values with a user-friendly message to improve the
readability of the report.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- SELECT
- COALESCE()
- NULL Handling
- Column Alias

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
    COALESCE(phone, 'Not Available') AS "Phone Number",
    city
FROM Customers;

/*
==============================================================================
EXPLANATION
==============================================================================

NULL represents missing or unknown data in a database.

The COALESCE() function returns the first non-NULL value from a list of
expressions. If the phone number exists, it is displayed. Otherwise,
'Not Available' is returned.

This makes reports easier to read and prevents blank values from confusing
end users.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | Full Name      | Phone Number   | city
------------------------------------------------------------
101         | Rahul Sharma   | 9876543210     | Pune
102         | Priya Mehta    | Not Available  | Mumbai
103         | Aman Verma     | 9988776655     | Jaipur
...

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Use COALESCE() when handling NULL values in reports.

✓ Replace NULL values with meaningful text whenever reports are intended for
  business users.

✓ Avoid leaving important report fields blank unless NULL has a specific
  business meaning.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Contact Reports

✓ CRM Systems

✓ Sales Dashboards

✓ Banking Customer Profiles

✓ Healthcare Patient Records

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Previous:
→ CONCAT()

Next:
→ ORDER BY
→ CASE Statements
→ IFNULL()

*/
