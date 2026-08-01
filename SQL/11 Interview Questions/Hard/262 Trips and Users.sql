/*
===============================================================================
                           LEETCODE 262
                           Trips and Users
===============================================================================

Difficulty    : Hard
Topics        : JOIN, CASE, GROUP BY, ROUND(), Conditional Aggregation
Companies     : Uber, Lyft, Amazon, Google, Microsoft

===============================================================================
QUESTION
===============================================================================

Table: Trips

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| client_id    | int     |
| driver_id    | int     |
| city_id      | int     |
| status       | enum    |
| request_at   | date    |
+--------------+---------+

id is the primary key.

status can be

completed

cancelled_by_driver

cancelled_by_client

----------------------------------------------------------

Table: Users

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| users_id     | int     |
| banned       | enum    |
| role         | enum    |
+--------------+---------+

users_id is the primary key.

banned

Yes

No

role

client

driver

Write a solution to calculate the

daily cancellation rate

between

2013-10-01

and

2013-10-03

considering only trips where

both

the client

and

the driver

are NOT banned.

Cancellation Rate =

Cancelled Trips

/

Total Trips

Round to

2 decimal places.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A ride-sharing company wants to monitor service quality.

Management tracks the percentage of cancelled trips each day,
but only considers trips involving verified (non-banned) users.

This KPI helps evaluate operational performance
and customer satisfaction.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Day

• Cancellation Rate

for each day.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ INNER JOIN

✔ CASE

✔ SUM()

✔ COUNT()

✔ ROUND()

✔ Conditional Aggregation

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    t.request_at AS Day,

    ROUND
    (
        SUM
        (
            CASE

                WHEN t.status <> 'completed'

                THEN 1

                ELSE 0

            END
        )

        /

        COUNT(*),

        2
    ) AS "Cancellation Rate"

FROM Trips t

JOIN Users c

ON t.client_id = c.users_id

JOIN Users d

ON t.driver_id = d.users_id

WHERE

    c.banned = 'No'

AND d.banned = 'No'

AND t.request_at BETWEEN '2013-10-01'
                     AND '2013-10-03'

GROUP BY

    t.request_at

ORDER BY

    t.request_at;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join Trips

with Clients

and Drivers.

----------------------------------------------------------

Step 2

Keep only

non-banned

clients

and

drivers.

----------------------------------------------------------

Step 3

Filter dates

between

2013-10-01

and

2013-10-03.

----------------------------------------------------------

Step 4

Treat

completed

↓

0

Cancelled

↓

1

----------------------------------------------------------

Step 5

SUM()

counts cancelled trips.

----------------------------------------------------------

Step 6

COUNT(*)

counts total trips.

----------------------------------------------------------

Step 7

Cancelled

/

Total

↓

Cancellation Rate

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Trips

Completed

Cancelled

Completed

Cancelled

↓

CASE

0

1

0

1

↓

SUM = 2

COUNT = 4

↓

2 / 4

↓

0.50

===============================================================================
EXPECTED OUTPUT
===============================================================================

+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
|2013-10-01  |0.33               |
|2013-10-02  |0.00               |
|2013-10-03  |0.50               |
+------------+-------------------+

===============================================================================
WHY CASE?
===============================================================================

CASE converts

trip status

into numeric values.

Cancelled trips become

1

Completed trips become

0

making aggregation simple.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    request_at,

    ROUND
    (
        AVG
        (
            CASE

                WHEN status='completed'

                THEN 0

                ELSE 1

            END
        ),
        2
    ) AS "Cancellation Rate"

FROM Trips ...

AVG()

automatically computes

Cancelled Trips

/

Total Trips.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each trip is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped daily statistics.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why join Users twice?

One join validates clients.

The other validates drivers.

----------------------------------------------------------

Q2. Why CASE?

To convert trip status
into numeric values.

----------------------------------------------------------

Q3. Can AVG() replace SUM()/COUNT()?

Yes.

AVG(1,0)

produces the same cancellation rate.

----------------------------------------------------------

Q4. Why filter banned users first?

Only eligible trips should contribute
to the KPI.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting to filter banned users.

----------------------------------------------------------

❌ Using LEFT JOIN.

INNER JOIN is required because
both users must exist.

----------------------------------------------------------

❌ Counting only cancelled trips.

The denominator must include

all valid trips.

----------------------------------------------------------

❌ Forgetting ROUND().

The output requires
two decimal places.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Ride-sharing Analytics

• Delivery Platform KPIs

• Cancellation Monitoring

• Customer Experience Dashboards

• Operational Performance Reports

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Multiple joins on the same table are common.

✔ CASE simplifies conditional counting.

✔ SUM()/COUNT() calculates ratios.

✔ Daily KPI reporting is a core analytics skill.

✔ One of the most frequently asked Hard SQL interview questions.

===============================================================================
*/
