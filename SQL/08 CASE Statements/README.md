# CASE Statements

## Overview

The `CASE` statement allows you to apply conditional logic within SQL queries. It works similarly to `IF...ELSE` statements in programming languages, enabling you to categorize, transform, and label data based on specified conditions.

`CASE` statements are widely used in dashboards, reports, business intelligence, and data analysis to create meaningful insights directly within SQL queries.

---

## Learning Objectives

After completing this section, you will be able to:

- Understand the purpose of `CASE` statements
- Use simple and searched `CASE` expressions
- Categorize data based on business rules
- Create calculated columns using conditional logic
- Combine `CASE` with Aggregate Functions
- Use `CASE` with Window Functions
- Build business-ready analytical reports

---

## Contents

| No. | Topic |
|-----|--------------------------------------------|
| 01 | Categorize Employee Salaries |
| 02 | Customer Membership Levels |
| 03 | Product Price Categories |
| 04 | Order Status Classification |
| 05 | Sales Performance Rating |
| 06 | Department-wise Bonus Calculation |
| 07 | Conditional Aggregation |
| 08 | Customer Purchase Segmentation |
| 09 | Revenue Band Analysis |
| 10 | Business Dashboard Indicators |

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
| order_status |

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
| Simple `CASE` | Compares a value against multiple possible values |
| Searched `CASE` | Evaluates multiple logical conditions |
| Conditional Columns | Creates new values based on business rules |
| Conditional Aggregation | Combines `CASE` with aggregate functions such as `SUM()` and `COUNT()` |
| Nested `CASE` | Uses one `CASE` statement inside another |
| `CASE` with Window Functions | Applies conditional logic to analytical calculations |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SQL Fundamentals
- Filtering & Sorting
- Aggregate Functions
- Joins
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions

---

## Note

`CASE` statements are one of the most practical SQL features for Data Analysts. They simplify business logic by allowing data to be classified, labeled, and transformed directly within SQL queries. This makes them essential for creating dashboards, KPI reports, customer segmentation, and executive summaries.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
