/*
==============================================================================
QUESTION
==============================================================================

Categorize customers into age groups using the CASE statement.

*/

/*
==============================================================================
BUSINESS SCENARIO
==============================================================================

The marketing department wants to understand the age distribution of its
customers to design targeted marketing campaigns.

Customers should be classified into meaningful age groups based on their age.

Your task is to categorize each customer into an age group.

*/

/*
==============================================================================
CONCEPTS COVERED
==============================================================================

- CASE Statement
- Multiple WHEN Conditions
- ELSE Clause
- Conditional Logic
- Data Classification

*/

/*
==============================================================================
ASSUMED TABLE
==============================================================================

Table Name : Customers

Columns
--------
customer_id
customer_name
age
city

Sample Data
-----------

customer_id | customer_name | age | city
-----------------------------------------
101         | Rahul         | 17  | Pune
102         | Priya         | 24  | Mumbai
103         | Aman          | 35  | Jaipur
104         | Neha          | 48  | Delhi
105         | Kavya         | 61  | Bengaluru
106         | Arjun         | 29  | Hyderabad

*/

/*
==============================================================================
SQL SOLUTION
==============================================================================
*/

SELECT
    customer_id,
    customer_name,
    age,

    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 25 THEN 'Young Adult'
        WHEN age BETWEEN 26 AND 40 THEN 'Adult'
        WHEN age BETWEEN 41 AND 60 THEN 'Middle Aged'
        ELSE 'Senior Citizen'
    END AS age_group

FROM Customers
ORDER BY age;

/*
==============================================================================
EXPLANATION
==============================================================================

The CASE statement evaluates each customer's age sequentially.

Step 1:

If the customer's age is less than 18, they are classified as 'Child'.

Step 2:

Customers aged between 18 and 25 are classified as 'Young Adult'.

Step 3:

Customers aged between 26 and 40 are classified as 'Adult'.

Step 4:

Customers aged between 41 and 60 are classified as 'Middle Aged'.

Step 5:

All remaining customers are classified as 'Senior Citizen'.

The CASE statement stops evaluating conditions once a match is found.

*/

/*
==============================================================================
EXPECTED OUTPUT
==============================================================================

customer_id | customer_name | age | age_group
----------------------------------------------
101         | Rahul         | 17  | Child
102         | Priya         | 24  | Young Adult
106         | Arjun         | 29  | Adult
103         | Aman          | 35  | Adult
104         | Neha          | 48  | Middle Aged
105         | Kavya         | 61  | Senior Citizen

*/

/*
==============================================================================
BEST PRACTICES
==============================================================================

✓ Arrange CASE conditions from the most specific to the most general.

✓ Ensure age ranges do not overlap.

✓ Always include an ELSE clause to handle unexpected values.

✓ Use meaningful labels for better readability.

✓ Keep business rules easy to modify.

*/

/*
==============================================================================
REAL-WORLD APPLICATIONS
==============================================================================

✓ Customer Segmentation

✓ Marketing Campaigns

✓ Demographic Analysis

✓ Customer Insights

✓ Business Reporting

*/

/*
==============================================================================
RELATED CONCEPTS
==============================================================================

Next:
→ Grade Student Marks
→ Searched CASE
→ Conditional Aggregation

*/
