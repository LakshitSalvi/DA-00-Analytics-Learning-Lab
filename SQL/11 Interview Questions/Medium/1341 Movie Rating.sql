/*
===============================================================================
                           LEETCODE 1341
                              Movie Rating
===============================================================================

Difficulty    : Medium
Topics        : JOIN, GROUP BY, AVG(), ORDER BY
Companies     : Amazon, Netflix, Google, Microsoft, Meta

===============================================================================
QUESTION
===============================================================================

Table: Movies

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| movie_id    | int     |
| title       | varchar |
+-------------+---------+

movie_id is the primary key.

----------------------------------------------------------

Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| name        | varchar |
+-------------+---------+

user_id is the primary key.

----------------------------------------------------------

Table: MovieRating

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| movie_id    | int     |
| user_id     | int     |
| rating      | int     |
| created_at  | date    |
+-------------+---------+

(movie_id, user_id) is the primary key.

Write a solution to report:

1. The user who rated the greatest number of movies.
   If there is a tie, return the lexicographically smaller name.

2. The movie with the highest average rating in February 2020.
   If there is a tie, return the lexicographically smaller movie title.

Return both answers as:

+---------+
| results |
+---------+

===============================================================================
BUSINESS SCENARIO
===============================================================================

A movie streaming platform wants two KPIs:

1. Identify the platform's most active reviewer.

2. Find the highest-rated movie during
February 2020.

If multiple users or movies tie,
alphabetical order determines the winner.

===============================================================================
OBJECTIVE
===============================================================================

Return two rows:

• Most Active User

• Highest Rated Movie (February 2020)

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ GROUP BY

✔ AVG()

✔ ORDER BY

✔ LIMIT

✔ UNION ALL

✔ Date Filtering

===============================================================================
SQL SOLUTION
===============================================================================
*/

(
SELECT

    u.name AS results

FROM Users u

JOIN MovieRating mr

ON u.user_id = mr.user_id

GROUP BY

    u.user_id,
    u.name

ORDER BY

    COUNT(*) DESC,
    u.name ASC

LIMIT 1
)

UNION ALL

(
SELECT

    m.title AS results

FROM Movies m

JOIN MovieRating mr

ON m.movie_id = mr.movie_id

WHERE

    DATE_FORMAT(mr.created_at,'%Y-%m') = '2020-02'

GROUP BY

    m.movie_id,
    m.title

ORDER BY

    AVG(mr.rating) DESC,
    m.title ASC

LIMIT 1
);

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join Users with MovieRating.

----------------------------------------------------------

Step 2

Count ratings submitted
by every user.

----------------------------------------------------------

Step 3

Sort by

COUNT(*) DESC

then

Name ASC

to resolve ties.

----------------------------------------------------------

Step 4

Join Movies with MovieRating.

----------------------------------------------------------

Step 5

Filter ratings from

February 2020.

----------------------------------------------------------

Step 6

Calculate

AVG(rating)

for every movie.

----------------------------------------------------------

Step 7

Sort by

Average Rating DESC

then

Movie Title ASC.

----------------------------------------------------------

Step 8

Combine both answers using

UNION ALL.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Users

Alex

15 Ratings

Bob

20 Ratings

Emma

20 Ratings

↓

Tie

↓

Alphabetically

↓

Bob

----------------------------------------------------------

Movies (February)

Movie A

4.8

Movie B

4.8

Movie C

4.5

↓

Tie

↓

Alphabetically

↓

Movie A

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+
| results    |
+------------+
| Daniel     |
| Frozen 2   |
+------------+

===============================================================================
WHY UNION ALL?
===============================================================================

The problem requires

two independent answers

returned in a single result set.

UNION ALL keeps both rows
without removing duplicates.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

Common Table Expressions (CTEs)
can separate the two calculations,
making the query easier to read.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping and sorting dominate execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped user and movie statistics.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why GROUP BY user_id?

To count ratings
for each user.

----------------------------------------------------------

Q2. Why ORDER BY name?

To resolve ties alphabetically.

----------------------------------------------------------

Q3. Why filter February
before GROUP BY?

Only February ratings
should influence averages.

----------------------------------------------------------

Q4. Why UNION ALL instead of UNION?

Both rows must always appear.

UNION ALL avoids unnecessary
duplicate elimination.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting alphabetical tie-breaking.

----------------------------------------------------------

❌ Calculating movie averages
using all months.

----------------------------------------------------------

❌ Using UNION instead of UNION ALL.

Although both work here,

UNION ALL is the intended choice.

----------------------------------------------------------

❌ Forgetting GROUP BY.

Aggregate functions require grouping.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Streaming Platform Analytics

• Customer Engagement Dashboards

• Product Review Analysis

• Content Recommendation Systems

• Business Intelligence Reporting

• User Activity Tracking

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ GROUP BY summarizes user and movie metrics.

✔ AVG() calculates average ratings.

✔ ORDER BY resolves ranking ties.

✔ UNION ALL combines independent reports.

✔ A common SQL interview question involving multiple aggregations.

===============================================================================
*/
