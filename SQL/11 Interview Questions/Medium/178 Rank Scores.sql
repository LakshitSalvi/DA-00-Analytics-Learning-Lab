/*
===============================================================================
                           LEETCODE 178
                              Rank Scores
===============================================================================

Difficulty    : Medium
Topics        : Window Functions, DENSE_RANK()
Companies     : Amazon, Google, Microsoft, Meta, Apple

===============================================================================
QUESTION
===============================================================================

Table: Scores

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+

id is the primary key.

Write a solution to rank the scores.

The ranking should satisfy:

• Highest score gets rank 1.
• If two scores are equal, they receive the same rank.
• The next rank should be consecutive (no gaps).

Return the result ordered by score in descending order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online learning platform wants to rank students based on their exam
scores.

Students with identical scores should receive the same rank.

Unlike traditional ranking, there should be no skipped rank numbers.

As a Data Analyst, your task is to generate the leaderboard.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• score

• rank

ordered by score in descending order.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Window Functions

✔ DENSE_RANK()

✔ ORDER BY

✔ Ranking

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    score,

    DENSE_RANK()

        OVER
        (
            ORDER BY score DESC
        ) AS `rank`

FROM Scores

ORDER BY

    score DESC;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Sort all scores in descending order.

----------------------------------------------------------

Step 2

Assign ranks using DENSE_RANK().

----------------------------------------------------------

Step 3

Equal scores receive the same rank.

----------------------------------------------------------

Step 4

The next distinct score receives the next consecutive rank.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Scores

+-------+
| Score |
+-------+
| 4.00  |
| 4.00  |
| 3.85  |
| 3.65  |
| 3.65  |
| 3.50  |
+-------+

Ranking

4.00

↓

Rank 1

4.00

↓

Rank 1

3.85

↓

Rank 2

3.65

↓

Rank 3

3.65

↓

Rank 3

3.50

↓

Rank 4

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

===============================================================================
WHY DENSE_RANK()?
===============================================================================

DENSE_RANK()

assigns the same rank to equal values,

and does not leave gaps in ranking.

This matches the problem requirements.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    score,

    (
        SELECT COUNT(DISTINCT score)

        FROM Scores s2

        WHERE s2.score >= s1.score

    ) AS `rank`

FROM Scores s1

ORDER BY

    score DESC;

This solution works without window functions,

but is slower and less readable.

===============================================================================
DENSE_RANK vs RANK vs ROW_NUMBER
===============================================================================

Scores

100

100

90

80

------------------------

ROW_NUMBER()

1

2

3

4

------------------------

RANK()

1

1

3

4

------------------------

DENSE_RANK()

1

1

2

3

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting dominates the execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For ranking operations.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use DENSE_RANK()?

Because equal scores receive the same rank
without gaps.

----------------------------------------------------------

Q2. What is the difference between
RANK() and DENSE_RANK()?

RANK() leaves gaps.

DENSE_RANK() does not.

----------------------------------------------------------

Q3. What does ROW_NUMBER() do?

It assigns a unique sequential number
to every row.

----------------------------------------------------------

Q4. Which ranking function is used for
leaderboards?

Usually DENSE_RANK(),

because tied players should share the same rank.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using RANK().

The problem requires consecutive ranks.

----------------------------------------------------------

❌ Using ROW_NUMBER().

Equal scores would receive different ranks.

----------------------------------------------------------

❌ Forgetting ORDER BY DESC.

Highest score must receive rank 1.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Student Leaderboards

• Sales Rankings

• Employee Performance Reports

• Gaming Leaderboards

• Customer Loyalty Programs

• Business Intelligence Dashboards

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ DENSE_RANK() creates consecutive rankings.

✔ Equal values receive the same rank.

✔ Window functions simplify analytical queries.

✔ Understand the difference between
ROW_NUMBER(), RANK(), and DENSE_RANK().

✔ One of the most important SQL window function interview questions.

===============================================================================
*/
