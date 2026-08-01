# SQL Interview Frequently Asked Questions (FAQ)

> A comprehensive collection of the most frequently asked SQL interview questions with concise, interview-ready answers. This guide serves as a quick revision resource before SQL interviews for Data Analyst, Business Analyst, BI Developer, Analytics Engineer, and Data Scientist roles.

---

# 📚 Table of Contents

1. SQL Fundamentals
2. Joins
3. Aggregate Functions
4. GROUP BY & HAVING
5. Window Functions
6. Common Table Expressions (CTEs)
7. Subqueries
8. Indexes
9. Transactions
10. Normalization
11. Query Optimization
12. NULL Handling
13. Constraints
14. Keys
15. Real Interview Questions

---

# 1. SQL Fundamentals

## What is SQL?

SQL (Structured Query Language) is the standard language used to store, retrieve, manipulate, and analyze data stored in relational databases.

---

## What are the different SQL commands?

- DDL (CREATE, ALTER, DROP, TRUNCATE)
- DML (INSERT, UPDATE, DELETE)
- DQL (SELECT)
- DCL (GRANT, REVOKE)
- TCL (COMMIT, ROLLBACK, SAVEPOINT)

---

## Difference between DELETE, TRUNCATE and DROP

| DELETE | TRUNCATE | DROP |
|---------|----------|------|
| Removes rows | Removes all rows | Removes entire table |
| Can use WHERE | No WHERE | Removes structure |
| Can rollback (depends on DBMS) | Usually faster | Table no longer exists |

---

# 2. Joins

## Types of JOINs

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

---

## INNER JOIN vs LEFT JOIN

**INNER JOIN**

Returns only matching rows.

**LEFT JOIN**

Returns all rows from the left table and matching rows from the right table.

---

## SELF JOIN

A table joined with itself.

Commonly used for:

- Employee → Manager
- Parent → Child
- Category Hierarchies

---

# 3. Aggregate Functions

Common aggregate functions:

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## Difference between COUNT(*) and COUNT(column)

COUNT(*)

Counts every row.

COUNT(column)

Ignores NULL values.

---

# 4. GROUP BY & HAVING

## Why GROUP BY?

Groups rows before performing aggregation.

---

## WHERE vs HAVING

WHERE filters rows **before** aggregation.

HAVING filters groups **after** aggregation.

---

# 5. Window Functions

## What is a Window Function?

A window function performs calculations across a set of rows while preserving individual rows.

Examples:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()
- LEAD()
- SUM() OVER()
- COUNT() OVER()

---

## ROW_NUMBER vs RANK vs DENSE_RANK

### ROW_NUMBER()

Always assigns unique numbers.

1

2

3

---

### RANK()

Leaves gaps after ties.

1

2

2

4

---

### DENSE_RANK()

No gaps after ties.

1

2

2

3

---

## Running Total

```sql
SUM(sales)
OVER (
PARTITION BY region
ORDER BY order_date
)
```

---

# 6. Common Table Expressions (CTEs)

## What is a CTE?

A temporary named result set used to simplify complex SQL queries.

```sql
WITH Sales AS
(
SELECT ...
)
SELECT *
FROM Sales;
```

Advantages:

- Readability
- Reusability
- Easier debugging

---

# 7. Subqueries

Types:

- Scalar Subquery
- Correlated Subquery
- Nested Subquery

---

## Correlated Subquery

Executed once for every outer row.

---

# 8. Indexes

## What is an Index?

A database object that speeds up data retrieval.

Advantages:

- Faster SELECT

Disadvantages:

- Slower INSERT
- Slower UPDATE
- Uses storage

---

## Clustered vs Non-Clustered Index

Clustered

Data stored physically.

Only one per table.

Non-Clustered

Separate index structure.

Multiple allowed.

---

# 9. Transactions

Transaction Properties (ACID)

- Atomicity
- Consistency
- Isolation
- Durability

---

## COMMIT

Saves changes.

---

## ROLLBACK

Undo changes.

---

## SAVEPOINT

Rollback to a specific point.

---

# 10. Normalization

Normal Forms

- 1NF
- 2NF
- 3NF
- BCNF

Purpose:

Reduce redundancy.

Improve consistency.

---

# 11. Query Optimization

Common techniques:

- Avoid SELECT *
- Use indexes
- Filter early
- Avoid unnecessary DISTINCT
- Prefer EXISTS over IN for large datasets
- Write readable joins
- Use CTEs for clarity

---

# 12. NULL Handling

Functions:

COALESCE()

IFNULL()

ISNULL()

NULLIF()

---

# 13. Constraints

Common constraints:

- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK
- DEFAULT

---

# 14. Keys

Primary Key

Unique identifier.

---

Foreign Key

Maintains relationships.

---

Candidate Key

Can become primary key.

---

Composite Key

Combination of columns.

---

# 15. Frequently Asked Real Interview Questions

### SQL Fundamentals

- What is SQL?
- What is a Primary Key?
- Difference between CHAR and VARCHAR?
- What is a View?
- What is a Stored Procedure?

---

### Joins

- Explain every JOIN.
- LEFT vs INNER JOIN?
- SELF JOIN use cases?

---

### Aggregation

- GROUP BY vs DISTINCT?
- WHERE vs HAVING?

---

### Window Functions

- ROW_NUMBER vs RANK vs DENSE_RANK?
- Running Total?
- Moving Average?

---

### CTEs

- Why use CTE?
- Recursive CTE?

---

### Optimization

- How do indexes work?
- Why is my query slow?
- EXISTS vs IN?
- UNION vs UNION ALL?

---

### Advanced SQL

- Gaps & Islands
- Recursive Queries
- Median
- Pivot
- Dynamic SQL

---

# 🎯 Last-Minute Interview Checklist

Before your interview, make sure you can confidently explain:

- [ ] All JOIN types
- [ ] Aggregate Functions
- [ ] GROUP BY
- [ ] HAVING
- [ ] CASE
- [ ] Window Functions
- [ ] ROW_NUMBER()
- [ ] RANK()
- [ ] DENSE_RANK()
- [ ] CTEs
- [ ] Recursive CTEs
- [ ] Transactions
- [ ] Indexes
- [ ] Normalization
- [ ] Query Optimization
- [ ] NULL Handling
- [ ] Keys & Constraints

---

# 🚀 Final Advice

SQL interviews are rarely about memorizing syntax.

Interviewers want to evaluate how you think, structure queries, and solve business problems using data.

Focus on:

- Writing clean and readable SQL
- Explaining your reasoning
- Handling edge cases
- Considering performance
- Connecting technical solutions to business outcomes

Master these fundamentals alongside the interview questions in this repository, and you'll be well prepared for SQL interviews across startups, consulting firms, and large technology companies.

Happy Querying! 🚀
