/*
===============================================================================
                           LEETCODE 602
                Friend Requests II: Who Has the Most Friends
===============================================================================

Difficulty    : Medium
Topics        : UNION ALL, GROUP BY, COUNT()
Companies     : Meta, Google, Microsoft, LinkedIn, Uber

===============================================================================
QUESTION
===============================================================================

Table: RequestAccepted

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| requester_id  | int     |
| accepter_id   | int     |
| accept_date   | date    |
+---------------+---------+

(requester_id, accepter_id) is the primary key.

Each row indicates that a friend request has been accepted.

Write a solution to find the person who has the most friends.

Return:

• id
• num

where

num = total number of friends.

The test cases guarantee that only one person has the most friends.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A social networking platform wants to identify its most connected user.

Every accepted friendship increases the friend count of both the
requester and the accepter.

As a Data Analyst, your task is to determine which user has the
largest friend network.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• User ID

• Total Number of Friends

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ UNION ALL

✔ GROUP BY

✔ COUNT()

✔ ORDER BY

✔ LIMIT

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    id,

    COUNT(*) AS num

FROM
(
    SELECT

        requester_id AS id

    FROM RequestAccepted

    UNION ALL

    SELECT

        accepter_id AS id

    FROM RequestAccepted

) AS Friends

GROUP BY

    id

ORDER BY

    num DESC

LIMIT 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Each friendship contributes

one friend

to both users.

----------------------------------------------------------

Step 2

UNION ALL combines

Requester IDs

and

Accepter IDs

into one list.

----------------------------------------------------------

Step 3

Group by user ID.

----------------------------------------------------------

Step 4

Count friendships for each user.

----------------------------------------------------------

Step 5

Return the user with the largest count.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

RequestAccepted

+-----------+----------+
| Requester | Accepter |
+-----------+----------+
| 1         | 2        |
| 1         | 3        |
| 2         | 3        |
+-----------+----------+

UNION ALL

↓

1

1

2

2

3

3

↓

GROUP BY

1 → 2

2 → 2

3 → 2

↓

ORDER BY DESC

LIMIT 1

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+-----+
| id | num |
+----+-----+
| 3  | 8   |
+----+-----+

(The exact values depend on the dataset.)

===============================================================================
WHY UNION ALL?
===============================================================================

Each friendship belongs to

both

users.

UNION ALL preserves every occurrence.

Using UNION would incorrectly remove duplicates.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

A Common Table Expression (CTE) can improve readability.

WITH Friends AS
(
    SELECT requester_id AS id FROM RequestAccepted

    UNION ALL

    SELECT accepter_id FROM RequestAccepted
)

SELECT

    id,

    COUNT(*) AS num

FROM Friends

GROUP BY id

ORDER BY num DESC

LIMIT 1;

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Grouping and sorting dominate execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

To store the combined friend list.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use UNION ALL instead of UNION?

UNION removes duplicate rows.

UNION ALL keeps every friendship.

----------------------------------------------------------

Q2. Why count both requester and accepter?

Friendship is bidirectional.

Each accepted request increases
both users' friend counts.

----------------------------------------------------------

Q3. What if multiple users have
the same maximum friend count?

This problem guarantees only one answer.

Otherwise,

TOP 1 WITH TIES

or

DENSE_RANK()

could be used.

----------------------------------------------------------

Q4. Can this be solved without UNION ALL?

Yes.

Using UNPIVOT (SQL Server)

or other database-specific features,

but UNION ALL is the most portable solution.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using UNION.

Duplicate friendships may be removed.

----------------------------------------------------------

❌ Counting only requester_id.

Half of the friendships are ignored.

----------------------------------------------------------

❌ Forgetting ORDER BY before LIMIT.

The returned user may not have the
highest friend count.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Social Network Analytics

• Customer Referral Programs

• Network Analysis

• Community Detection

• Relationship Analytics

• Graph Data Reporting

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ UNION ALL combines rows without removing duplicates.

✔ GROUP BY counts occurrences.

✔ ORDER BY DESC finds the maximum.

✔ Friendship relationships often require counting both sides.

✔ A common SQL interview problem involving aggregation.

===============================================================================
*/
