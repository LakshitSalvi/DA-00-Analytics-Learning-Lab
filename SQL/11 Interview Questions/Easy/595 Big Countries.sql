/*
===============================================================================
                           LEETCODE 595
                             Big Countries
===============================================================================

Difficulty    : Easy
Topics        : WHERE, Logical Operators
Companies     : Amazon, Google, Microsoft, Apple, Oracle

===============================================================================
QUESTION
===============================================================================

Table: World

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+

name is the primary key.

A country is considered big if:

• area >= 3,000,000

OR

• population >= 25,000,000

Write a solution to find the name, population, and area of the big countries.

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A global research organization is preparing a report on countries with
significant geographical size or population.

Policy makers want to identify countries that qualify as "big" based on
either land area or population.

As a Data Analyst, your task is to generate the required report.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• Country Name

• Population

• Area

for every country that satisfies at least one of the following:

• Area >= 3,000,000

OR

• Population >= 25,000,000

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ WHERE Clause

✔ OR Operator

✔ Comparison Operators

✔ Filtering Data

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    name,

    population,

    area

FROM World

WHERE

    area >= 3000000

    OR population >= 25000000;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

Read all records from the World table.

----------------------------------------------------------

Step 2

Check each country against the given conditions.

A country is considered big if:

• Area is at least 3,000,000

OR

• Population is at least 25,000,000

----------------------------------------------------------

Step 3

Return only the required columns.

===============================================================================
VISUAL REPRESENTATION
===============================================================================

World

+---------+----------+------------+
| Country | Area     | Population |
+---------+----------+------------+
| India   | 3287263  | 1400000000 |
| Nepal   | 147516   | 30000000   |
| Iceland | 103000   | 400000     |
+---------+----------+------------+

Evaluation

India

Area ✔

Population ✔

Include

------------------------

Nepal

Area ✘

Population ✔

Include

------------------------

Iceland

Area ✘

Population ✘

Exclude

===============================================================================
EXPECTED OUTPUT
===============================================================================

+---------+------------+----------+
| name    | population | area     |
+---------+------------+----------+
| India   | 1400000000 | 3287263  |
| Nepal   |   30000000 | 147516   |
+---------+------------+----------+

===============================================================================
WHY OR?
===============================================================================

The problem states that a country qualifies if

either

condition is true.

OR returns rows when at least one condition is satisfied.

Using AND would incorrectly require both conditions.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    name,

    population,

    area

FROM World

WHERE NOT

(
    area < 3000000

    AND population < 25000000

);

Although correct,

the first solution is simpler and easier to understand.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

One scan of the World table.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(1)

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. Why use OR instead of AND?

Because the question requires a country to satisfy
either condition.

----------------------------------------------------------

Q2. What would happen if AND were used?

Only countries satisfying both conditions
would be returned.

----------------------------------------------------------

Q3. Does SQL stop evaluating after the first TRUE condition?

The SQL optimizer determines execution strategy.
You should not rely on short-circuit evaluation.

----------------------------------------------------------

Q4. Can parentheses improve readability?

Yes.

Example:

WHERE

(
    area >= 3000000
    OR population >= 25000000
)

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Using AND instead of OR.

This changes the business requirement.

----------------------------------------------------------

❌ Returning all columns.

Return only:

• name

• population

• area

----------------------------------------------------------

❌ Confusing >= with >.

The problem explicitly states

greater than or equal to.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Country Demographics

• Census Reporting

• Geographic Analysis

• Government Dashboards

• Population Studies

• International Research

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ WHERE filters rows.

✔ OR checks multiple conditions.

✔ Read business requirements carefully.

✔ Return only the requested columns.

✔ A common introductory SQL interview question.

===============================================================================
*/
