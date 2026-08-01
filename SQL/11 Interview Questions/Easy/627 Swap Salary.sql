/*
===============================================================================
                           LEETCODE 627
                              Swap Salary
===============================================================================

Difficulty    : Easy
Topics        : UPDATE, CASE Statement
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Salary

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| sex         | ENUM    |
| salary      | int     |
+-------------+---------+

id is the primary key.

The sex column contains only two values:

'm' = Male

'f' = Female

Write a single UPDATE statement to swap all 'm' values to 'f'
and all 'f' values to 'm'.

Do not use a temporary table.

===============================================================================
BUSINESS SCENARIO
===============================================================================

During a data migration, the gender values of employees were
accidentally stored incorrectly.

The HR department needs a quick SQL solution to correct every
record without creating another table.

As a Data Analyst, your task is to update the data efficiently.

===============================================================================
OBJECTIVE
===============================================================================

Swap:

Male

↓

Female

Female

↓

Male

using a single SQL UPDATE statement.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ UPDATE

✔ CASE Statement

✔ Data Modification

✔ Conditional Logic

===============================================================================
SAFETY NOTE
===============================================================================

Before running any UPDATE statement on a production database:

✔ Take a backup.

✔ Test the query on a development database.

✔ Verify affected rows using a SELECT statement.

===============================================================================
SQL SOLUTION
===============================================================================
*/

UPDATE Salary

SET sex =

CASE

    WHEN sex = 'm'

    THEN 'f'

    ELSE 'm'

END;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Read every row in the Salary table.

----------------------------------------------------------

Step 2

Evaluate the CASE expression.

If

sex = 'm'

↓

Change it to

'f'

----------------------------------------------------------

Otherwise

↓

Change it to

'm'

----------------------------------------------------------

Every row is updated in a single statement.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Before

+----+-------+-----+
| id | name  | sex |
+----+-------+-----+
| 1  | Alice | f   |
| 2  | Bob   | m   |
| 3  | Emma  | f   |
| 4  | John  | m   |
+----+-------+-----+

↓

UPDATE

↓

After

+----+-------+-----+
| id | name  | sex |
+----+-------+-----+
| 1  | Alice | m   |
| 2  | Bob   | f   |
| 3  | Emma  | m   |
| 4  | John  | f   |
+----+-------+-----+

===============================================================================
EXPECTED OUTPUT
===============================================================================

Every employee's gender value is swapped.

Male

↓

Female

Female

↓

Male

===============================================================================
WHY CASE?
===============================================================================

CASE evaluates each row independently.

It allows multiple conditional updates within
a single UPDATE statement.

This avoids multiple UPDATE queries.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

UPDATE Salary

SET sex =

IF

(

    sex = 'm',

    'f',

    'm'

);

The IF() function works in MySQL.

However,

CASE is ANSI SQL compliant and portable
across most relational database systems.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Every row is updated exactly once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

No additional storage is required.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use CASE?

CASE allows multiple conditions
inside a single UPDATE statement.

----------------------------------------------------------

Q2. Can IF() replace CASE?

Yes.

MySQL supports IF().

CASE is more portable.

----------------------------------------------------------

Q3. Why not use two UPDATE statements?

Using two UPDATE statements could overwrite values incorrectly
unless temporary values are introduced.

The requirement also specifies using a single UPDATE statement.

----------------------------------------------------------

Q4. Does CASE execute row by row?

Yes.

Each row is evaluated independently.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Running

UPDATE Salary

SET sex = 'f'

This changes every row to female.

----------------------------------------------------------

❌ Using two UPDATE statements.

The problem explicitly requires
a single UPDATE statement.

----------------------------------------------------------

❌ Forgetting CASE.

CASE is the intended solution for conditional updates.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Data Migration

• Data Correction

• HR Database Maintenance

• ETL Data Cleansing

• Data Standardization

• Master Data Management

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ UPDATE modifies existing records.

✔ CASE enables conditional updates.

✔ One UPDATE statement can handle multiple cases.

✔ CASE is ANSI SQL compliant.

✔ A classic SQL interview question on UPDATE statements.

===============================================================================
*/
