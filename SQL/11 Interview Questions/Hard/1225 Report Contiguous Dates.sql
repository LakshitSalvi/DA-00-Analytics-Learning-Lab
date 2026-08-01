/*
===============================================================================
                           LEETCODE 1225
                      Report Contiguous Dates
===============================================================================

Difficulty    : Hard
Topics        : Gaps & Islands, Window Functions, ROW_NUMBER(), UNION ALL
Companies     : Google, Amazon, Microsoft, Meta, Uber

===============================================================================
QUESTION
===============================================================================

Table: Failed

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| fail_date     | date    |
+---------------+---------+

fail_date is the primary key.

----------------------------------------------------------

Table: Succeeded

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| success_date     | date    |
+------------------+---------+

success_date is the primary key.

The two tables together contain every date between

2019-01-01

and

2019-12-31

exactly once.

Write a solution to report the contiguous periods
of success and failure.

Return

• period_state

• start_date

• end_date

ordered by start_date.

===============================================================================
BUSINESS SCENARIO
===============================================================================

An IT operations team tracks the daily health
of a production system.

Each day is classified as either

Succeeded

or

Failed.

Management wants continuous uptime
and downtime periods
instead of daily records.

===============================================================================
OBJECTIVE
===============================================================================

Return every continuous period
of

Succeeded

or

Failed

days.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ UNION ALL

✔ ROW_NUMBER()

✔ Gaps & Islands

✔ Common Table Expressions (CTEs)

✔ GROUP BY

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH AllDates AS
(
    SELECT

        success_date AS event_date,

        'succeeded' AS period_state

    FROM Succeeded

    WHERE success_date BETWEEN '2019-01-01'
                           AND '2019-12-31'

    UNION ALL

    SELECT

        fail_date,

        'failed'

    FROM Failed

    WHERE fail_date BETWEEN '2019-01-01'
                       AND '2019-12-31'
),

RankedDates AS
(
    SELECT

        event_date,

        period_state,

        DATE_SUB
        (
            event_date,
            INTERVAL ROW_NUMBER()
            OVER
            (
                PARTITION BY period_state
                ORDER BY event_date
            ) DAY
        ) AS grp

    FROM AllDates
)

SELECT

    period_state,

    MIN(event_date) AS start_date,

    MAX(event_date) AS end_date

FROM RankedDates

GROUP BY

    period_state,

    grp

ORDER BY

    start_date;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Combine

Succeeded

and

Failed

dates into one table.

----------------------------------------------------------

Step 2

Assign

ROW_NUMBER()

within each status.

----------------------------------------------------------

Step 3

Subtract the row number
from the date.

Consecutive dates
produce the same value.

----------------------------------------------------------

Step 4

Group by

Status

and

Calculated Group.

----------------------------------------------------------

Step 5

Return

Minimum Date

↓

Start

Maximum Date

↓

End

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Succeeded

Jan 1

Jan 2

Jan 3

↓

ROW_NUMBER()

1

2

3

↓

DATE - ROW_NUMBER()

Same Value

↓

One Group

----------------------------------

Failed

Jan 4

Jan 5

↓

Another Group

===============================================================================
EXPECTED OUTPUT
===============================================================================

+--------------+------------+------------+
| period_state | start_date | end_date   |
+--------------+------------+------------+
| succeeded    |2019-01-01  |2019-01-03  |
| failed       |2019-01-04  |2019-01-05  |
| succeeded    |2019-01-06  |2019-01-08  |
+--------------+------------+------------+

===============================================================================
WHY DATE_SUB()?
===============================================================================

Subtracting

ROW_NUMBER()

from consecutive dates
produces the same value.

This creates a unique identifier
for every contiguous period.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

LAG()

can detect status changes,

but the

ROW_NUMBER()

approach is more concise
and is the classic
Gaps & Islands solution.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting dates dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For window function processing.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why UNION ALL?

To combine both tables
into one timeline.

----------------------------------------------------------

Q2. Why partition by period_state?

Success and failure periods
must be grouped independently.

----------------------------------------------------------

Q3. Why DATE_SUB()?

It creates a constant value
for consecutive dates.

----------------------------------------------------------

Q4. How would you report
only failure periods?

Filter

WHERE period_state='failed'

after grouping.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting to filter
the 2019 date range.

----------------------------------------------------------

❌ Using UNION instead
of UNION ALL.

UNION ALL avoids
unnecessary duplicate removal.

----------------------------------------------------------

❌ Forgetting PARTITION BY.

Success and failure groups
would merge incorrectly.

----------------------------------------------------------

❌ Ordering by end_date.

The problem requires
ordering by start_date.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Server Uptime Monitoring

• Manufacturing Downtime Reports

• Machine Health Analytics

• Website Availability Tracking

• Customer Subscription Periods

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Gaps & Islands identifies contiguous periods.

✔ UNION ALL combines multiple event sources.

✔ ROW_NUMBER() creates sequence identifiers.

✔ DATE_SUB() groups consecutive dates elegantly.

✔ One of the most important Hard SQL interview patterns.

===============================================================================
*/
