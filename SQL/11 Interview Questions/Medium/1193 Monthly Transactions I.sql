/*
===============================================================================
                           LEETCODE 1193
                        Monthly Transactions I
===============================================================================

Difficulty    : Medium
Topics        : GROUP BY, Conditional Aggregation, SUM(), COUNT()
Companies     : Amazon, Google, Microsoft, Stripe, PayPal

===============================================================================
QUESTION
===============================================================================

Table: Transactions

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| id               | int     |
| country          | varchar |
| state            | enum    |
| amount           | int     |
| trans_date       | date    |
+------------------+---------+

id is the primary key.

state is either

'approved'

or

'declined'.

Write a solution to find for each month and country:

• Number of transactions
• Number of approved transactions
• Total transaction amount
• Total approved transaction amount

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A payment processing company wants to generate monthly financial reports.

Management needs to analyze transaction activity by country,
including approved payments and total transaction value.

These reports are used to monitor payment performance and regional trends.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• month

• country

• trans_count

• approved_count

• trans_total_amount

• approved_total_amount

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ GROUP BY

✔ DATE_FORMAT()

✔ CASE

✔ SUM()

✔ COUNT()

✔ Conditional Aggregation

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    DATE_FORMAT(trans_date,'%Y-%m') AS month,

    country,

    COUNT(*) AS trans_count,

    SUM
    (
        CASE

            WHEN state = 'approved'

            THEN 1

            ELSE 0

        END
    ) AS approved_count,

    SUM(amount) AS trans_total_amount,

    SUM
    (
        CASE

            WHEN state = 'approved'

            THEN amount

            ELSE 0

        END
    ) AS approved_total_amount

FROM Transactions

GROUP BY

    DATE_FORMAT(trans_date,'%Y-%m'),

    country;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Extract the month
from each transaction date.

----------------------------------------------------------

Step 2

Group records by

Month

and

Country.

----------------------------------------------------------

Step 3

Count all transactions.

----------------------------------------------------------

Step 4

Use CASE

to count approved transactions.

----------------------------------------------------------

Step 5

Calculate total transaction amount.

----------------------------------------------------------

Step 6

Calculate total approved amount.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Transactions

+---------+----------+-----------+
| Month   | Country  | Amount    |
+---------+----------+-----------+
|2020-01  | USA      | 100       |
|2020-01  | USA      | 200       |
|2020-01  | India    | 150       |
|2020-02  | USA      | 300       |
+---------+----------+-----------+

↓

GROUP BY

Month

Country

↓

USA

2020-01

Transactions

2

Approved

1

Amount

300

===============================================================================
EXPECTED OUTPUT
===============================================================================

+---------+---------+-------------+----------------+--------------------+-----------------------+
| month   | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+---------+---------+-------------+----------------+--------------------+-----------------------+
|2020-01  | USA     | 2           | 1              | 300                | 100                   |
|2020-01  | India   | 1           | 1              | 150                | 150                   |
+---------+---------+-------------+----------------+--------------------+-----------------------+

===============================================================================
WHY CASE INSIDE SUM()?
===============================================================================

CASE converts

approved

transactions into numeric values.

SUM()

then totals those values.

This technique is called

Conditional Aggregation.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

Some SQL databases support

COUNT(*) FILTER (WHERE state='approved')

which is more concise.

However,

CASE expressions work across
nearly all SQL databases.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Each transaction is processed once.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For grouped monthly summaries.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use DATE_FORMAT()?

To group transactions by month.

----------------------------------------------------------

Q2. Why SUM(CASE...) instead of COUNT()?

CASE allows conditional counting.

----------------------------------------------------------

Q3. Why GROUP BY month and country?

The report requires separate summaries
for each month and country.

----------------------------------------------------------

Q4. Can this be extended to quarterly reports?

Yes.

Replace the month formatting
with quarter-based grouping.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Forgetting DATE_FORMAT().

Transactions would be grouped
by individual dates.

----------------------------------------------------------

❌ Using COUNT(amount).

COUNT() ignores NULL values.

Use SUM(CASE...) for conditional counts.

----------------------------------------------------------

❌ Forgetting ELSE 0.

SUM() may return NULL
instead of the correct value.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Banking Analytics

• Payment Processing Reports

• Financial Dashboards

• Revenue Analysis

• Fraud Monitoring

• Business Intelligence

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ Conditional Aggregation is an essential SQL skill.

✔ CASE inside SUM() simplifies reporting.

✔ DATE_FORMAT() enables monthly reporting.

✔ GROUP BY summarizes business metrics.

✔ One of the most frequently asked SQL reporting questions.

===============================================================================
*/
