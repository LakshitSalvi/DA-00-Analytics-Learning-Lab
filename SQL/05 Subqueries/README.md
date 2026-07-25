# Subqueries

## Overview

A Subquery is a query nested inside another SQL query. It allows you to use the result of one query as input for another, making it possible to solve more complex business problems that cannot be handled using a single query.

Subqueries are commonly used in Data Analytics to compare values, identify trends, filter records based on calculated results, and generate business insights from related datasets.

---

## Learning Objectives

After completing this section, you will be able to:

- Understand what a Subquery is
- Write nested SQL queries
- Use Single-Row Subqueries
- Use Multi-Row Subqueries
- Use Correlated Subqueries
- Use Subqueries with `WHERE`
- Use Subqueries with `FROM`
- Use Subqueries with `SELECT`
- Compare Subqueries with Joins
- Solve real-world business problems using Subqueries

---

## Contents

| No. | Topic |
|-----|------------------------------------------|
| 01 | Employees Above Average Salary |
| 02 | Second Highest Salary |
| 03 | Customers with Maximum Orders |
| 04 | Products More Expensive Than Average |
| 05 | Departments with Highest Payroll |
| 06 | Customers Who Never Ordered |
| 07 | Top Selling Product |
| 08 | Monthly Revenue Comparison |

---

## Assumed Database Structure

The practice questions in this section use the following sample tables.

### Customers

| Column |
|---------|
| customer_id |
| first_name |
| last_name |
| email |
| city |

---

### Employees

| Column |
|---------|
| employee_id |
| first_name |
| last_name |
| department |
| salary |
| manager_id |

---

### Products

| Column |
|---------|
| product_id |
| product_name |
| category |
| price |

---

### Orders

| Column |
|---------|
| order_id |
| customer_id |
| order_date |
| total_amount |

---

### Order_Details

| Column |
|---------|
| order_detail_id |
| order_id |
| product_id |
| quantity |
| unit_price |

---

## SQL Concepts Covered

| Concept | Description |
|----------|-------------|
| Single-Row Subquery | Returns one value to the outer query |
| Multi-Row Subquery | Returns multiple values |
| Correlated Subquery | Executes once for each row processed by the outer query |
| Nested Query | One query inside another |
| EXISTS | Checks whether matching rows exist |
| NOT EXISTS | Returns rows where no matching record exists |
| IN | Matches values from a Subquery result |
| NOT IN | Excludes values returned by a Subquery |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SQL Fundamentals
- Filtering & Sorting
- Aggregate Functions
- Joins

---

## Note

Subqueries provide an elegant way to solve analytical problems by breaking complex logic into smaller, reusable queries. Although many Subqueries can also be written using Joins or Common Table Expressions (CTEs), understanding Subqueries is essential for SQL interviews and real-world data analysis.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
