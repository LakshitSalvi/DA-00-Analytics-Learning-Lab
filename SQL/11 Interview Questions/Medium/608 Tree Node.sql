/*
===============================================================================
                           LEETCODE 608
                               Tree Node
===============================================================================

Difficulty    : Medium
Topics        : CASE Statement, SELF JOIN, Tree Structure
Companies     : Amazon, Microsoft, Google, Oracle, SAP

===============================================================================
QUESTION
===============================================================================

Table: Tree

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| p_id        | int     |
+-------------+---------+

id is the primary key.

Each node may have a parent node.

If p_id is NULL,
the node is the root.

Write a solution to classify each node as:

• Root
• Inner
• Leaf

Return the result table in any order.

===============================================================================
BUSINESS SCENARIO
===============================================================================

A company stores its organizational hierarchy in a database.

Each employee reports to a manager.

Management wants to classify every employee node as:

• CEO (Root)

• Manager (Inner)

• Individual Contributor (Leaf)

As a Data Analyst, your task is to classify each node.

===============================================================================
OBJECTIVE
===============================================================================

Return:

• id

• type

where type is

Root

Inner

Leaf

===============================================================================
CONCEPTS TESTED
===============================================================================

✔ CASE Statement

✔ Subquery

✔ IN

✔ NULL Handling

✔ Tree Structures

===============================================================================
SQL SOLUTION
===============================================================================
*/

SELECT

    id,

    CASE

        WHEN p_id IS NULL

        THEN 'Root'

        WHEN id IN
        (
            SELECT DISTINCT

                p_id

            FROM Tree

            WHERE p_id IS NOT NULL
        )

        THEN 'Inner'

        ELSE 'Leaf'

    END AS type

FROM Tree;

/*
===============================================================================
EXPLANATION
===============================================================================

Step 1

If

p_id IS NULL

↓

The node has no parent.

↓

Root

----------------------------------------------------------

Step 2

Otherwise,

check whether the node appears
as another node's parent.

↓

If YES

↓

Inner

----------------------------------------------------------

Step 3

Otherwise,

the node has no children.

↓

Leaf

===============================================================================
VISUAL REPRESENTATION
===============================================================================

        1
      /   \
     2     3
    / \
   4   5

Classification

1

↓

Root

2

↓

Inner

3

↓

Leaf

4

↓

Leaf

5

↓

Leaf

===============================================================================
EXPECTED OUTPUT
===============================================================================

+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
| 2  | Inner |
| 3  | Leaf  |
| 4  | Leaf  |
| 5  | Leaf  |
+----+-------+

===============================================================================
WHY CASE?
===============================================================================

CASE evaluates each node
based on business rules.

It allows multiple classifications
within a single query.

===============================================================================
ALTERNATIVE SOLUTION
===============================================================================

SELECT

    t1.id,

    CASE

        WHEN t1.p_id IS NULL

        THEN 'Root'

        WHEN EXISTS
        (
            SELECT 1

            FROM Tree t2

            WHERE t2.p_id = t1.id
        )

        THEN 'Inner'

        ELSE 'Leaf'

    END AS type

FROM Tree t1;

Using EXISTS is often more efficient than IN
for large datasets.

===============================================================================
TIME COMPLEXITY
===============================================================================

O(n)

Assuming indexes exist on id and p_id.

===============================================================================
SPACE COMPLEXITY
===============================================================================

O(n)

For the parent node lookup.

===============================================================================
INTERVIEW FOLLOW-UP QUESTIONS
===============================================================================

Q1. How is the Root identified?

Its parent ID is NULL.

----------------------------------------------------------

Q2. What makes a node an Inner node?

It has both

a parent

and

at least one child.

----------------------------------------------------------

Q3. What makes a node a Leaf?

It has no children.

----------------------------------------------------------

Q4. Can EXISTS replace IN?

Yes.

EXISTS is often preferred
for large datasets.

===============================================================================
COMMON MISTAKES
===============================================================================

❌ Checking only p_id.

A node can have a parent
and still be an Inner node.

----------------------------------------------------------

❌ Forgetting NULL handling.

The root node would never be identified.

----------------------------------------------------------

❌ Confusing parent IDs
with child IDs.

Always check whether

id

appears as

another row's p_id.

===============================================================================
REAL-WORLD APPLICATIONS
===============================================================================

• Organization Charts

• Folder Structures

• Category Hierarchies

• Product Catalog Trees

• File Systems

• Family Trees

===============================================================================
KEY TAKEAWAYS
===============================================================================

✔ CASE classifies rows using business rules.

✔ Tree structures rely on parent-child relationships.

✔ Root nodes have NULL parents.

✔ Inner nodes have children.

✔ Leaf nodes have no children.

✔ A classic hierarchy-based SQL interview problem.

===============================================================================
*/
