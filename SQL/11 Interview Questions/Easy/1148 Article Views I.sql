/*
===============================================================================
                          LEETCODE 1148
                           Article Views I
===============================================================================

Difficulty    : Easy
Topics        : DISTINCT, WHERE
Companies     : Amazon, Google, Microsoft, Meta, LinkedIn

===============================================================================
QUESTION
===============================================================================

Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+

There is no primary key for this table.

Each row indicates that a viewer viewed an article on a given date.

Write a solution to find all authors who viewed at least one of their own
articles.

Return the result table sorted by id in ascending order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online publishing platform tracks article views.

The editorial team wants to identify authors who viewed their own
published articles.

This information helps analyze author engagement with their content.

As a Data Analyst, your task is to generate the required report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Author ID

where

author_id = viewer_id

Remove duplicate IDs.

Sort the result by ID in ascending order.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ DISTINCT

✔ WHERE

✔ ORDER BY

✔ Filtering

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT DISTINCT

    author_id AS id

FROM Views

WHERE

    author_id = viewer_id

ORDER BY

    id ASC;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Read all article view records.

----------------------------------------------------------

Step 2

Compare

author_id

with

viewer_id.

----------------------------------------------------------

Step 3

If both values are equal,

the author viewed their own article.

----------------------------------------------------------

Step 4

Use DISTINCT

to remove duplicate author IDs.

----------------------------------------------------------

Step 5

Sort the result in ascending order.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Views

+------------+-----------+-----------+
| Article ID | Author ID | Viewer ID |
+------------+-----------+-----------+
| 1          | 10        | 10        |
| 2          | 10        | 20        |
| 3          | 15        | 15        |
| 4          | 15        | 15        |
+------------+-----------+-----------+

Filter

author_id = viewer_id

↓

10

15

15

↓

DISTINCT

↓

10

15

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+
| id |
+----+
| 10 |
| 15 |
+----+

===============================================================================
WHY DISTINCT?
===============================================================================

An author may view their own article multiple times.

DISTINCT ensures each author appears only once
in the final result.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    author_id AS id

FROM Views

WHERE

    author_id = viewer_id

GROUP BY

    author_id

ORDER BY

    author_id;

GROUP BY can also remove duplicates.

However,

DISTINCT is simpler and more readable
for this problem.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

One scan of the Views table.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For storing distinct author IDs.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use DISTINCT?

To remove duplicate author IDs.

----------------------------------------------------------

Q2. Can GROUP BY replace DISTINCT?

Yes.

Both produce the same result.

----------------------------------------------------------

Q3. Why ORDER BY?

The problem explicitly requires
ascending order.

----------------------------------------------------------

Q4. What if ORDER BY is omitted?

The output order is not guaranteed.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting DISTINCT.

Duplicate author IDs would appear.

----------------------------------------------------------

❌ Comparing article_id with viewer_id.

The comparison should be

author_id = viewer_id.

----------------------------------------------------------

❌ Forgetting ORDER BY.

The output would not satisfy
the problem requirements.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Content Analytics

• Author Engagement Reports

• Publishing Platforms

• User Activity Analysis

• Digital Media Dashboards

• Editorial Performance Tracking

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ DISTINCT removes duplicate rows.

✔ WHERE filters matching records.

✔ ORDER BY sorts the final result.

✔ Read the output requirements carefully.

✔ A classic SQL filtering interview problem.

===============================================================================
*/
