/*
===============================================================================
                           LEETCODE 1126
                          Active Businesses
===============================================================================

Difficulty    : Hard
Topics        : GROUP BY, AVG(), CASE, HAVING, CTE
Companies     : Amazon, Google, Microsoft, Meta, Yelp

===============================================================================
QUESTION
===============================================================================

Table: Events

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| business_id   | int     |
| event_type    | varchar |
| occurences    | int     |
+---------------+---------+

(business_id, event_type) is the primary key.

Each row represents the number of occurrences
of a specific event for a business.

Write a solution to find all businesses that are

"active".

A business is considered active if it has

more than one event type

whose occurences are strictly greater than the

average occurences

for that event type.

Return

business_id.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An online business directory tracks several activity metrics
such as reviews, advertisements, and page views.

A business is considered highly active when it performs
better than the average in multiple activity categories.

This helps identify top-performing businesses.

===============================================================================
OBJECTIVE
===============================================================================

Return

• business_id

for businesses that exceed the average
in more than one event type.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Common Table Expressions (CTEs)

✔ AVG()

✔ GROUP BY

✔ HAVING

✔ JOIN

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH EventAverage AS
(
    SELECT

        event_type,

        AVG(occurences) AS avg_occurrences

    FROM Events

    GROUP BY

        event_type
)

SELECT

    e.business_id

FROM Events e

JOIN EventAverage a

ON e.event_type = a.event_type

WHERE

    e.occurences > a.avg_occurrences

GROUP BY

    e.business_id

HAVING

    COUNT(*) > 1;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Calculate the average
occurrences for every event type.

----------------------------------------------------------

Step 2

Compare each business's
occurrence count against
its event type average.

----------------------------------------------------------

Step 3

Keep only event types where

Business Value

>

Average Value.

----------------------------------------------------------

Step 4

Group by business.

----------------------------------------------------------

Step 5

Return businesses exceeding
the average in

more than one

event type.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Reviews

Average

10

Business A

15

✔

----------------------------------

Ads

Average

20

Business A

30

✔

----------------------------------

Business A

↓

2 Event Types Above Average

↓

Active

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-------------+
| business_id |
+-------------+
| 1           |
| 3           |
+-------------+

===============================================================================
WHY USE A CTE?
===============================================================================

The average for each event type
must be calculated once.

The CTE makes the query

clean,

efficient,

and easy to understand.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    business_id

FROM Events e

WHERE occurences >
(
    SELECT AVG(occurences)

    FROM Events

    WHERE event_type = e.event_type
)

GROUP BY business_id

HAVING COUNT(*) > 1;

This correlated subquery also works,

but the CTE is generally more efficient
and readable.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each event is processed once
after computing averages.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For storing event averages.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why calculate averages first?

Every business must be compared
against the same benchmark.

----------------------------------------------------------

Q2. Why GROUP BY business_id?

To count qualifying event types
for each business.

----------------------------------------------------------

Q3. Why HAVING COUNT(*) > 1?

A business must exceed the average
in more than one event type.

----------------------------------------------------------

Q4. What if the requirement changes
to at least three event types?

Replace

COUNT(*) > 1

with

COUNT(*) >= 3.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Comparing businesses against
the overall average.

The comparison must be

per event type.

----------------------------------------------------------

❌ Using WHERE COUNT(*).

Aggregate filtering
belongs in HAVING.

----------------------------------------------------------

❌ Forgetting GROUP BY.

Businesses cannot be counted
independently.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Marketplace Analytics

• Business Performance Dashboards

• Sales Performance Monitoring

• Store Activity Analysis

• Operational KPI Reporting

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ AVG() creates category benchmarks.

✔ JOIN compares rows against benchmarks.

✔ HAVING filters grouped results.

✔ Benchmark comparison is a common
business analytics pattern.

✔ Frequently asked in analytics interviews.

===============================================================================
*/
