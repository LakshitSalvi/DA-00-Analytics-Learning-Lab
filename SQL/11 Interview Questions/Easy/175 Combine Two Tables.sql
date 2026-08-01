/*
===============================================================================
                             LEETCODE 175
                           Combine Two Tables
===============================================================================

Difficulty    : Easy
Topics        : JOIN, LEFT JOIN
Companies     : Amazon, Microsoft, Google, Meta, Accenture

===============================================================================
QUESTION
===============================================================================

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+

personId is the primary key.

----------------------------------------------------------

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+

addressId is the primary key.

Write a solution to report the first name, last name, city, and state of
each person.

If the address of a person is not available, report NULL instead.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

Imagine you are working as a Data Analyst in a CRM (Customer Relationship
Management) system.

The customer information is stored in one table while the address details
are stored separately.

Management wants a report that lists every customer, even if they have not
yet provided their address.

===============================================================================
OBJECTIVE
===============================================================================

Retrieve:

• First Name
• Last Name
• City
• State

Display every person, even if they don't have an address.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ LEFT JOIN

✔ Primary Key

✔ Foreign Key

✔ NULL Handling

✔ Basic SQL Joins

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    p.firstName,

    p.lastName,

    a.city,

    a.state

FROM Person AS p

LEFT JOIN Address AS a

ON p.personId = a.personId;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Start with the Person table because every person should appear in
the final result.

----------------------------------------------------------

Step 2

Join the Address table using personId.

personId is the common column between both tables.

----------------------------------------------------------

Step 3

Use LEFT JOIN.

LEFT JOIN returns:

• Every record from Person
• Matching records from Address

If no matching address exists,

City and State become NULL.

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------+----------+----------+-----------+
| firstName | lastName | city     | state     |
+-----------+----------+----------+-----------+
| Allen     | Wang     | New York | New York  |
| Bob       | Alice    | NULL     | NULL      |
+-----------+----------+----------+-----------+

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Person

+----------+
| Person   |
+----------+
| Allen    |
| Bob      |
+----------+

        LEFT JOIN

Address

+--------------+
| Address      |
+--------------+
| Allen        |
+--------------+

↓

Result

Allen → New York

Bob → NULL

===============================================================================
WHY LEFT JOIN?
===============================================================================

Suppose the data is:

Person

1 Allen

2 Bob

----------------------------------------------------------

Address

1 New York

----------------------------------------------------------

INNER JOIN

Returns

Allen

----------------------------------------------------------

LEFT JOIN

Returns

Allen

Bob

Since the question asks to return EVERY person,

LEFT JOIN is the correct choice.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    Person.firstName,

    Person.lastName,

    Address.city,

    Address.state

FROM Person

LEFT JOIN Address

USING(personId);

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

where n is the number of rows.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

No additional storage is used.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why LEFT JOIN instead of INNER JOIN?

Because the question requires every person to appear,
even if they don't have an address.

----------------------------------------------------------

Q2. What if the question asked only people having addresses?

Use INNER JOIN.

----------------------------------------------------------

Q3. What happens if multiple addresses exist for one person?

The person will appear multiple times,
once for each matching address.

----------------------------------------------------------

Q4. Which table should be placed on the LEFT side?

The table whose complete data must be returned.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using INNER JOIN.

People without addresses disappear.

----------------------------------------------------------

❌ Joining on addressId.

The correct join column is personId.

----------------------------------------------------------

❌ Forgetting the ON condition.

This creates a Cartesian Product.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Customer Management Systems

• Employee Information Systems

• Banking Customer Profiles

• Hospital Patient Records

• CRM Reporting

• HR Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ LEFT JOIN keeps all rows from the left table.

✔ NULL represents missing matching data.

✔ Join tables using their common key.

✔ Read the question carefully before choosing the JOIN type.

✔ This is one of the most frequently asked SQL interview questions.

===============================================================================
*/
