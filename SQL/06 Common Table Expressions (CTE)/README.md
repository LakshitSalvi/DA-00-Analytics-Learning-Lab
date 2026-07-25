# Common Table Expressions (CTE)

## Overview

A Common Table Expression (CTE) is a temporary named result set that exists only for the duration of a single SQL query. CTEs improve query readability by breaking complex logic into smaller, reusable parts.

They are commonly used in Data Analytics to simplify data transformations, calculate rankings, generate running totals, analyze hierarchical data, and improve the maintainability of SQL queries.

---

## Learning Objectives

After completing this section, you will be able to:

- Understand what a Common Table Expression (CTE) is
- Create CTEs using the `WITH` clause
- Improve query readability and maintainability
- Replace complex nested subqueries with CTEs
- Build multiple CTEs in a single query
- Use Recursive CTEs for hierarchical data
- Solve business problems using CTEs

---

## Contents

| No. | Topic |
|-----|--------------------------------------|
| 01 | Employee Salary Ranking |
| 02 | Running Monthly Sales |
| 03 | Department Salary Analysis |
| 04 | Hierarchical Employee Structure |
| 05 | Customer Retention Analysis |

---

## Assumed Database Structure

The practice questions in this section use the following sample tables.

### Employees

| Column |
|---------|
| employee_id |
| first_name |
| last_name |
| department |
| manager_id |
| salary |
| hire_date |

---

### Customers

| Column |
|---------|
| customer_id |
| first_name |
| last_name |
| city |

---

### Orders

| Column |
|---------|
| order_id |
| customer_id |
| order_date |
| total_amount |

---

### Monthly_Sales

| Column |
|---------|
| month |
| revenue |

---

## SQL Concepts Covered

| Concept | Description |
|----------|-------------|
| Common Table Expression (CTE) | Creates a temporary named result set |
| `WITH` Clause | Defines one or more CTEs |
| Multiple CTEs | Uses multiple temporary result sets in a single query |
| Recursive CTE | Processes hierarchical or recursive data |
| Readability | Breaks large SQL queries into logical steps |
| Maintainability | Makes complex queries easier to understand and modify |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SQL Fundamentals
- Filtering & Sorting
- Aggregate Functions
- Joins
- Subqueries

---

## Note

CTEs are widely used in modern SQL development because they improve readability without creating permanent database objects. They are particularly useful for complex reporting, analytical queries, and preparing datasets for dashboards.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
