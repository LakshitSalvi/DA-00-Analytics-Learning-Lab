/*
===============================================================================
                             LEETCODE 196
                          Delete Duplicate Emails
===============================================================================

Difficulty    : Easy
Topics        : DELETE, SELF JOIN
Companies     : Amazon, Google, Microsoft, Meta, Apple

===============================================================================
QUESTION
===============================================================================

Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

id is the primary key.

Each row contains an email.

Write a solution to delete all duplicate emails, keeping only one unique
email.

For duplicate emails, keep the row with the smallest id.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A CRM system contains duplicate customer records because of repeated
registrations.

Before launching a marketing campaign, the data engineering team wants to
clean the customer database by removing duplicate email addresses while
preserving the oldest record.

===============================================================================
OBJECTIVE
===============================================================================

Delete duplicate email records while keeping the row having
the smallest id.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ DELETE

✔ SELF JOIN

✔ Table Aliases

✔ Data Cleaning

✔ Primary Key

===============================================================================
SQL SOLUTION
===============================================================================
*/

DELETE p1

FROM Person AS p1

INNER JOIN Person AS p2

ON p1.email = p2.email

AND p1.id > p2.id;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join the Person table with itself.

----------------------------------------------------------

Step 2

Match rows having the same email.

----------------------------------------------------------

Step 3

Compare IDs.

The row having the larger id is considered the duplicate.

----------------------------------------------------------

Step 4

Delete only the duplicate rows.

The smallest id remains in the table.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Before

+----+------------------+
| id | email            |
+----+------------------+
| 1  | a@gmail.com      |
| 2  | b@gmail.com      |
| 3  | a@gmail.com      |
| 4  | b@gmail.com      |
| 5  | c@gmail.com      |
+----+------------------+

Duplicates

a@gmail.com

Keep

id = 1

Delete

id = 3

--------------------------

b@gmail.com

Keep

id = 2

Delete

id = 4

--------------------------

After

+----+------------------+
| id | email            |
+----+------------------+
| 1  | a@gmail.com      |
| 2  | b@gmail.com      |
| 5  | c@gmail.com      |
+----+------------------+

===============================================================================
WHY SELF JOIN?
===============================================================================

Each duplicate email exists within the same table.

A SELF JOIN allows us to compare one record with another record
having the same email.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

DELETE

FROM Person

WHERE id NOT IN
(
    SELECT *

    FROM
    (
        SELECT MIN(id)

        FROM Person

        GROUP BY email

    ) AS KeepRows
);

The extra subquery is required in MySQL because a table cannot be modified
and selected from in the same query.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n²)

Worst case without indexes.

With proper indexes on

email

the performance improves significantly.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why keep the smallest id?

Because it represents the oldest record.

----------------------------------------------------------

Q2. Can this be solved using GROUP BY?

Yes.

Find the minimum id for each email first,
then delete the remaining rows.

----------------------------------------------------------

Q3. Why is a SELF JOIN used?

Because duplicate records exist within the same table.

----------------------------------------------------------

Q4. Would this work without a primary key?

No.

Without a unique identifier,
there is no reliable way to determine which duplicate to keep.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Deleting every duplicate.

Always keep one record.

----------------------------------------------------------

❌ Comparing emails only.

The comparison must also include

id > id

to identify which record should be deleted.

----------------------------------------------------------

❌ Forgetting table aliases.

Aliases are required for SELF JOIN.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• CRM Data Cleaning

• Customer Database Maintenance

• Duplicate Record Removal

• Data Warehousing

• ETL Pipelines

• Master Data Management

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SELF JOIN is useful for duplicate removal.

✔ Keep the smallest primary key.

✔ DELETE can be combined with JOIN in MySQL.

✔ Data cleaning is one of the most common SQL tasks.

✔ Frequently asked in SQL interviews.

===============================================================================
*/
