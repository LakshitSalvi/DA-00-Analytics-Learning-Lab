/*
===============================================================================
                           LEETCODE 571
                Find Median Given Frequency of Numbers
===============================================================================

Difficulty    : Hard
Topics        : Window Functions, Running Total, Cumulative Frequency
Companies     : Google, Amazon, Microsoft, Meta, Bloomberg

===============================================================================
QUESTION
===============================================================================

Table: Numbers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| num         | int     |
| frequency   | int     |
+-------------+---------+

num is the primary key.

Each row indicates that

num

appears

frequency

times.

Write a solution to find the median.

Return

median

rounded to

1 decimal place.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A statistics platform stores compressed datasets.

Instead of storing every occurrence,
only the value and its frequency are saved.

The analytics team needs the dataset's median
without expanding all rows.

===============================================================================
OBJECTIVE
===============================================================================

Return

median

from the compressed dataset.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ Window Functions

✔ Running Total

✔ Cumulative Frequency

✔ SUM() OVER()

✔ AVG()

===============================================================================
SQL SOLUTION
===============================================================================
*/

WITH FrequencyRange AS
(
    SELECT

        num,

        frequency,

        SUM(frequency)

        OVER
        (
            ORDER BY num
        ) AS cumulative_frequency,

        SUM(frequency)

        OVER() AS total_frequency

    FROM Numbers
)

SELECT

    ROUND
    (
        AVG(num),
        1
    ) AS median

FROM FrequencyRange

WHERE

    cumulative_frequency >= total_frequency / 2.0

AND

    cumulative_frequency - frequency < total_frequency / 2.0;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Sort values
by number.

----------------------------------------------------------

Step 2

Calculate

running frequency.

----------------------------------------------------------

Step 3

Calculate

total frequency.

----------------------------------------------------------

Step 4

Locate the value(s)
containing the middle position.

----------------------------------------------------------

Step 5

AVG()

handles both

Odd

and

Even

datasets automatically.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Number

1

Frequency

2

↓

Positions

1

2

------------------------

Number

2

Frequency

3

↓

Positions

3

4

5

------------------------

Number

3

Frequency

1

↓

Position

6

Total Frequency

6

Median Positions

3

4

↓

Median

2

===============================================================================
EXPECTED OUTPUT
===============================================================================

+--------+
| median |
+--------+
| 2.0    |
+--------+

===============================================================================
WHY CUMULATIVE FREQUENCY?
===============================================================================

Instead of expanding rows,

the running total identifies
where the middle observations fall.

This is much more efficient.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

Expanding the dataset into individual rows
would also work,

but it is extremely inefficient
for large frequencies.

The cumulative-frequency approach
is the preferred interview solution.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n log n)

Sorting dominates execution.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For cumulative frequency calculations.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use cumulative frequency?

It identifies where the middle values
occur without expanding the dataset.

----------------------------------------------------------

Q2. Why AVG(num)?

For even-sized datasets,
two middle values may exist.

AVG() returns the correct median.

----------------------------------------------------------

Q3. Why divide by 2.0?

To avoid integer division.

----------------------------------------------------------

Q4. Can this approach scale
to millions of rows?

Yes.

It avoids generating
duplicate rows.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Expanding every frequency.

This wastes memory
and computation.

----------------------------------------------------------

❌ Forgetting cumulative frequency.

The median cannot be located.

----------------------------------------------------------

❌ Using AVG() over all numbers.

Median and average
are different statistics.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Statistical Analysis

• Census Reporting

• Survey Analytics

• Financial Risk Analysis

• Healthcare Research

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Cumulative frequency identifies median positions.

✔ Window functions eliminate the need
to expand compressed datasets.

✔ AVG() correctly handles both odd
and even totals.

✔ One of the most advanced SQL median problems.

✔ Frequently asked in data-intensive interviews.

===============================================================================
*/
