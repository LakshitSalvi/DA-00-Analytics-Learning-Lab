/*
===============================================================================
                           LEETCODE 180
                         Consecutive Numbers
===============================================================================

Difficulty    : Medium
Topics        : SELF JOIN, Window Functions, LAG(), LEAD()
Companies     : Amazon, Google, Microsoft, Meta, Apple

===============================================================================
QUESTION
===============================================================================

Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+

id is the primary key.

id is an auto-increment column.

Write a solution to find all numbers that appear at least three times
consecutively.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A manufacturing company records machine status codes every second.

Engineers need to detect system failures where the same status code
appears three or more consecutive times.

As a Data Analyst, your task is to identify repeated consecutive values.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• ConsecutiveNums

that appear at least three consecutive times.

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ SELF JOIN

✔ Consecutive Records

✔ JOIN Conditions

✔ Window Functions

✔ LAG()

===============================================================================
SQL SOLUTION (SELF JOIN)
===============================================================================
*/

SELECT DISTINCT

    l1.num AS ConsecutiveNums

FROM Logs AS l1

INNER JOIN Logs AS l2

ON l1.id = l2.id - 1

INNER JOIN Logs AS l3

ON l2.id = l3.id - 1

WHERE

    l1.num = l2.num

AND l2.num = l3.num;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Join each row with the next row.

----------------------------------------------------------

Step 2

Join again with the third consecutive row.

----------------------------------------------------------

Step 3

Compare all three values.

----------------------------------------------------------

Step 4

Return distinct numbers that appear
three consecutive times.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

Logs

+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
+----+-----+

Join

1

↓

2

↓

3

↓

1 = 1 = 1

↓

Output

1

===============================================================================
EXPECTED OUTPUT
===============================================================================

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+

===============================================================================
WHY SELF JOIN?
===============================================================================

SELF JOIN allows rows from the same table
to be compared with neighboring rows.

Here,

each row is compared with

the next

and

the next after that.

===============================================================================
ALTERNATIVE SOLUTION (WINDOW FUNCTION)
===============================================================================

SELECT DISTINCT

    num AS ConsecutiveNums

FROM
(
    SELECT

        num,

        LAG(num,1)

            OVER
            (
                ORDER BY id
            ) AS Prev1,

        LAG(num,2)

            OVER
            (
                ORDER BY id
            ) AS Prev2

    FROM Logs

) AS ConsecutiveLogs

WHERE

    num = Prev1

AND num = Prev2;

Modern SQL databases generally prefer
the window function approach.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

assuming id is indexed.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use SELF JOIN?

Because consecutive rows must be compared
within the same table.

----------------------------------------------------------

Q2. Can LAG() solve this problem?

Yes.

Window functions make consecutive row
comparisons much simpler.

----------------------------------------------------------

Q3. Why use DISTINCT?

A number may appear more than three
consecutive times.

DISTINCT prevents duplicate output.

----------------------------------------------------------

Q4. What if the requirement changes to
four consecutive numbers?

Simply compare four consecutive rows
using another JOIN or another LAG().

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Comparing only two rows.

The problem requires three consecutive rows.

----------------------------------------------------------

❌ Forgetting DISTINCT.

The same number could appear multiple times.

----------------------------------------------------------

❌ Comparing id values instead of num values.

The IDs identify consecutive rows.

The comparison should be performed on num.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Fraud Detection

• Machine Failure Monitoring

• Website Error Tracking

• Sensor Data Analysis

• Manufacturing Analytics

• Time-Series Analysis

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ SELF JOIN compares neighboring rows.

✔ LAG() is a cleaner modern solution.

✔ DISTINCT removes duplicate results.

✔ Consecutive record analysis is common in analytics.

✔ One of the most frequently asked Medium SQL interview questions.

===============================================================================
*/
