/*
===============================================================================
                           LEETCODE 620
                           Not Boring Movies
===============================================================================

Difficulty    : Easy
Topics        : WHERE, ORDER BY, MOD()
Companies     : Amazon, Google, Microsoft, Meta, Netflix

===============================================================================
QUESTION
===============================================================================

Table: Cinema

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| movie       | varchar |
| description | varchar |
| rating      | float   |
+-------------+---------+

id is the primary key.

Each row represents a movie.

A movie is considered "not boring" if its description is not equal to
"boring".

Write a solution to report movies that satisfy both:

• id is odd
• description is not "boring"

Return the result ordered by rating in descending order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A movie streaming platform wants to promote highly rated movies.

The recommendation engine only considers movies that:

• Have an odd movie ID
• Are not marked as "boring"

The final list should display the highest-rated movies first.

As a Data Analyst, your task is to generate this recommendation report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• id
• movie
• description
• rating

Include only movies where:

• id is odd
• description <> 'boring'

Sort the result by rating in descending order.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ WHERE

✔ MOD()

✔ ORDER BY

✔ DESC

✔ Multiple Conditions

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    id,

    movie,

    description,

    rating

FROM Cinema

WHERE

    MOD(id, 2) = 1

    AND description <> 'boring'

ORDER BY

    rating DESC;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Select the required columns.

----------------------------------------------------------

Step 2

Filter movies whose ID is odd.

MOD(id,2) = 1

----------------------------------------------------------

Step 3

Exclude movies whose description is "boring".

----------------------------------------------------------

Step 4

Sort the remaining movies by rating
from highest to lowest.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Cinema

+----+----------+-------------+--------+
| id | Movie    | Description | Rating |
+----+----------+-------------+--------+
| 1  | Iron Man | interesting | 8.6    |
| 2  | Frozen   | boring      | 7.1    |
| 3  | Avatar   | exciting    | 9.0    |
| 4  | Cars     | boring      | 6.9    |
| 5  | Coco     | inspiring   | 8.8    |
+----+----------+-------------+--------+

Filter

Odd IDs

↓

1

3

5

↓

Remove "boring"

↓

1

3

5

↓

ORDER BY Rating DESC

↓

Avatar

Coco

Iron Man

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+----------+-------------+--------+
| id | movie    | description | rating |
+----+----------+-------------+--------+
| 3  | Avatar   | exciting    | 9.0    |
| 5  | Coco     | inspiring   | 8.8    |
| 1  | Iron Man | interesting | 8.6    |
+----+----------+-------------+--------+

===============================================================================
WHY MOD()?
===============================================================================

MOD(id,2)

returns the remainder after dividing by 2.

Odd numbers

↓

MOD(id,2)=1

Even numbers

↓

MOD(id,2)=0

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    id,

    movie,

    description,

    rating

FROM Cinema

WHERE

    id % 2 = 1

    AND description != 'boring'

ORDER BY

    rating DESC;

This syntax works in MySQL.

However,

MOD() and <> are ANSI SQL compliant
and more portable across databases.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Filtering requires scanning the table,
followed by sorting the qualifying rows.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use MOD(id,2)=1?

To identify odd numbers.

----------------------------------------------------------

Q2. Can % replace MOD()?

Yes.

In MySQL,

id % 2 = 1

produces the same result.

----------------------------------------------------------

Q3. Why ORDER BY rating DESC?

Because the question requires
the highest-rated movies first.

----------------------------------------------------------

Q4. Why use AND instead of OR?

Both conditions must be satisfied.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting ORDER BY.

The output will not match the required order.

----------------------------------------------------------

❌ Using MOD(id,2)=0.

This returns even IDs.

----------------------------------------------------------

❌ Using OR instead of AND.

The problem requires both conditions.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Movie Recommendation Systems

• Product Catalog Filtering

• Customer Segmentation

• Content Moderation

• Streaming Analytics

• Recommendation Engines

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ MOD() identifies odd and even numbers.

✔ WHERE supports multiple conditions.

✔ ORDER BY DESC sorts highest values first.

✔ Always read ordering requirements carefully.

✔ A common SQL filtering interview question.

===============================================================================
*/
