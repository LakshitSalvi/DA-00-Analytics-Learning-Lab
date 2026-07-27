# SQL Execution Order

Understanding SQL Execution Order is one of the most important concepts for writing correct queries and performing well in SQL interviews.

Although we write SQL queries in one order, the database executes them in a different order.

---

## Writing Order

This is how we normally write a SQL query.

```sql
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
```

---

## Actual Execution Order

The SQL engine processes the query in the following sequence:

```text
1. FROM
       ↓
2. WHERE
       ↓
3. GROUP BY
       ↓
4. HAVING
       ↓
5. SELECT
       ↓
6. DISTINCT
       ↓
7. ORDER BY
       ↓
8. LIMIT
```

---

# Step-by-Step Explanation

## 1. FROM

The database first identifies the table (or tables) from which the data will be retrieved.

```sql
FROM Employees
```

---

## 2. WHERE

Rows are filtered before any grouping or calculations take place.

```sql
WHERE department = 'Sales'
```

Only Sales department employees move to the next stage.

---

## 3. GROUP BY

Rows with the same values are grouped together.

```sql
GROUP BY department
```

This is commonly used with aggregate functions like:

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

---

## 4. HAVING

Filters groups after aggregation.

Unlike WHERE, HAVING works on grouped data.

```sql
HAVING COUNT(*) > 5
```

---

## 5. SELECT

Only now does SQL choose which columns to display.

```sql
SELECT department,
       COUNT(*)
```

---

## 6. DISTINCT

Duplicate rows are removed.

```sql
SELECT DISTINCT city
```

---

## 7. ORDER BY

The final result is sorted.

```sql
ORDER BY salary DESC
```

---

## 8. LIMIT

Finally, SQL returns only the requested number of rows.

```sql
LIMIT 10
```

---

# Complete Example

```sql
SELECT department,
       COUNT(*) AS total_employees
FROM Employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) >= 3
ORDER BY total_employees DESC
LIMIT 5;
```

### Execution Flow

```
Employees Table
      │
      ▼
FROM
      │
      ▼
WHERE salary > 50000
      │
      ▼
GROUP BY department
      │
      ▼
HAVING COUNT(*) >= 3
      │
      ▼
SELECT department, COUNT(*)
      │
      ▼
ORDER BY total_employees DESC
      │
      ▼
LIMIT 5
      │
      ▼
Final Result
```

---

# Common Interview Questions

### Q1. Why can't we use an alias in the WHERE clause?

Because the WHERE clause executes before the SELECT clause, the alias has not been created yet.

---

### Q2. Why does HAVING exist when we already have WHERE?

WHERE filters individual rows.

HAVING filters grouped rows after aggregation.

---

### Q3. Which clause executes first?

```
FROM
```

---

### Q4. Which clause executes last?

```
LIMIT
```

---

### Q5. What is the difference between WHERE and HAVING?

| WHERE | HAVING |
|--------|---------|
| Filters rows | Filters groups |
| Before GROUP BY | After GROUP BY |
| Cannot use aggregate functions | Can use aggregate functions |

---

# Common Mistakes

❌ Using aggregate functions inside WHERE

```sql
WHERE COUNT(*) > 5
```

✅ Correct

```sql
HAVING COUNT(*) > 5
```

---

❌ Assuming SELECT executes first

It doesn't.

The database executes FROM first.

---

❌ Forgetting ORDER BY before LIMIT

```sql
SELECT *
FROM Employees
LIMIT 5;
```

The returned rows are not guaranteed to be the highest-paid or latest employees.

Correct:

```sql
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;
```

---

# Quick Revision

```
FROM
   ↓
WHERE
   ↓
GROUP BY
   ↓
HAVING
   ↓
SELECT
   ↓
DISTINCT
   ↓
ORDER BY
   ↓
LIMIT
```

Remember this sequence for interviews—it explains why many SQL queries behave the way they do.

---

# Key Takeaways

- SQL is written in one order but executed in another.
- `FROM` always executes first.
- `WHERE` filters rows before grouping.
- `GROUP BY` creates groups for aggregation.
- `HAVING` filters groups after aggregation.
- `SELECT` chooses the output columns.
- `DISTINCT` removes duplicate rows.
- `ORDER BY` sorts the final result.
- `LIMIT` restricts the number of returned rows.

Mastering SQL execution order is essential for writing efficient queries, debugging SQL, and succeeding in technical interviews.
