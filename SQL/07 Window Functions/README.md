# Window Functions

## Overview

Window Functions perform calculations across a set of related rows while preserving the individual rows in the result set. Unlike aggregate functions, they do not group rows into a single output, making them ideal for rankings, running totals, moving averages, and comparative analysis.

Window Functions are widely used in business intelligence, financial reporting, customer analytics, and performance dashboards.

---

## Learning Objectives

After completing this section, you will be able to:

- Understand how Window Functions work
- Use the `OVER()` clause
- Rank records using `ROW_NUMBER()`
- Compare rankings with `RANK()` and `DENSE_RANK()`
- Assign groups using `NTILE()`
- Access previous and next rows using `LAG()` and `LEAD()`
- Calculate running totals and cumulative metrics
- Analyze business data using advanced SQL techniques

---

## Contents

| No. | Topic |
|-----|-------------------------------------------|
| 01 | Employee Salary Ranking |
| 02 | Top 3 Products by Revenue |
| 03 | Running Sales Total |
| 04 | Monthly Revenue Comparison |
| 05 | Previous Order Analysis |
| 06 | Next Customer Purchase |
| 07 | Customer Purchase Ranking |
| 08 | Quartile Analysis Using NTILE |
| 09 | Moving Average of Monthly Sales |
| 10 | Sales Performance Dashboard Metrics |

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

### Products

| Column |
|---------|
| product_id |
| product_name |
| category |
| supplier_id |
| price |

---

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

## SQL Concepts Covered

| Concept | Description |
|----------|-------------|
| `OVER()` | Defines the window for calculations |
| `PARTITION BY` | Divides rows into logical groups |
| `ORDER BY` (Window) | Specifies the order within each partition |
| `ROW_NUMBER()` | Assigns a unique sequential number |
| `RANK()` | Assigns rankings with gaps for ties |
| `DENSE_RANK()` | Assigns rankings without gaps |
| `NTILE()` | Divides rows into equal-sized groups |
| `LAG()` | Retrieves data from the previous row |
| `LEAD()` | Retrieves data from the next row |
| Running Total | Calculates cumulative totals |
| Moving Average | Calculates rolling averages |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SQL Fundamentals
- Filtering & Sorting
- Aggregate Functions
- Joins
- Subqueries
- Common Table Expressions (CTEs)

---

## Note

Window Functions are among the most powerful features of SQL for analytical workloads. They enable sophisticated calculations without collapsing rows, making them indispensable for business reporting, KPI tracking, trend analysis, and interview preparation for Data Analyst and Business Intelligence roles.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
