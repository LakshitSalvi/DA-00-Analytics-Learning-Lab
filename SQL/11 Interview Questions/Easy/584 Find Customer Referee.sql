/*
===============================================================================
                           LEETCODE 584
                        Find Customer Referee
===============================================================================

Difficulty    : Easy
Topics        : WHERE, NULL Handling
Companies     : Amazon, Google, Microsoft, Meta, Oracle

===============================================================================
QUESTION
===============================================================================

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+

id is the primary key.

Each row indicates the ID of a customer and the customer who referred them.

Write a solution to report the names of customers who are NOT referred by
the customer with id = 2.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online referral program rewards customers for inviting new users.

The marketing team wants to identify customers who were either:

• Not referred by Customer #2
• Not referred by anyone

These customers will receive a separate promotional campaign.

===============================================================================
OBJECTIVE
===============================================================================

Return the names of customers whose referee_id

• Is NOT equal to 2

OR

• Is NULL

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ WHERE Clause

✔ NULL Handling

✔ Logical Operators

✔ Filtering Data

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    name

FROM Customer

WHERE

    referee_id <> 2

    OR referee_id IS NULL;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Read every customer record.

----------------------------------------------------------

Step 2

Exclude customers whose referee_id is 2.

----------------------------------------------------------

Step 3

Include customers whose referee_id is NULL.

NULL means the customer was not referred by anyone.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Customer

+----+-------+------------+
| id | name  | referee_id |
+----+-------+------------+
| 1  | Will  | NULL       |
| 2  | Jane  | NULL       |
| 3  | Alex  | 2          |
| 4  | Bill  | NULL       |
| 5  | Zack  | 1          |
| 6  | Mark  | 2          |
+----+-------+------------+

Filter

referee_id <> 2

↓

Will

Jane

Bill

Zack

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------+
| name  |
+-------+
| Will  |
| Jane  |
| Bill  |
| Zack  |
+-------+

===============================================================================
WHY "IS NULL"?
===============================================================================

NULL is not equal to any value.

Even

NULL <> 2

returns UNKNOWN.

Therefore,

customers with NULL referee_id must be handled separately.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    name

FROM Customer

WHERE

    COALESCE(referee_id,0) <> 2;

COALESCE()

replaces NULL with 0,

allowing a single comparison.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

One scan of the Customer table.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why isn't

WHERE referee_id <> 2

enough?

Because NULL comparisons return UNKNOWN.

NULL rows would be excluded.

----------------------------------------------------------

Q2. What does

IS NULL

check?

It identifies rows where no referee exists.

----------------------------------------------------------

Q3. Can COALESCE() solve this problem?

Yes.

COALESCE(referee_id,0)

treats NULL as 0.

----------------------------------------------------------

Q4. What happens if referee_id is NOT NULL for every record?

Then

WHERE referee_id <> 2

would be sufficient.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting

OR referee_id IS NULL

Rows with NULL would be excluded.

----------------------------------------------------------

❌ Using

referee_id = NULL

Always use

IS NULL

for NULL comparisons.

----------------------------------------------------------

❌ Assuming NULL behaves like zero.

NULL represents an unknown value,
not zero.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Referral Program Analytics

• Marketing Campaign Segmentation

• Customer Acquisition Analysis

• CRM Reporting

• Loyalty Program Management

• User Growth Analysis

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ NULL comparisons require IS NULL.

✔ WHERE filters rows before grouping.

✔ OR combines multiple filter conditions.

✔ COALESCE() can simplify NULL handling.

✔ Understanding NULL behavior is essential for SQL interviews.

===============================================================================
*/
