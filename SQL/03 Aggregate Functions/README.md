# Aggregate Functions

## Overview

Aggregate Functions are used to perform calculations on multiple rows of data and return a single summarized result. They are essential for data analysis, reporting, and business intelligence, allowing analysts to measure performance, identify trends, and generate key metrics.

In this section, you'll learn how to summarize data using SQL aggregate functions and group records to answer real-world business questions.

---

## Learning Objectives

After completing this section, you will be able to:

- Count records using `COUNT()`
- Calculate totals using `SUM()`
- Find averages using `AVG()`
- Determine minimum values using `MIN()`
- Determine maximum values using `MAX()`
- Group records using `GROUP BY`
- Filter grouped data using `HAVING`
- Generate business summary reports

---

## Contents

| No.| Topic                                   |
|----|-----------------------------------------|
| 01 | Count Total Customers                   |
| 02 | Calculate Total Revenue                 |
| 03 | Find Average Employee Salary            |
| 04 | Find Lowest Product Price               |
| 05 | Find Highest Order Value                |
| 06 | Sales by Category                       |
| 07 | Departments with More Than 10 Employees |
| 08 | Count Unique Customers                  |
| 09 | Monthly Sales Summary                   |

---

## Assumed Database Structure

The practice questions in this section use the following sample tables.

### Customers

| Column      |
|-------------|
| customer_id |
| first_name  |
| last_name   |
| email       |
| city        |

---

### Products

| Column         |
|----------------|
| product_id     |
| product_name   |
| category       |
| price          |
| stock_quantity |

---

### Employees

| Column      |
|-------------|
| employee_id |
| first_name  |
| last_name   |
| department  |
| salary      |
| manager_id  |

---

### Orders

| Column       |
|--------------|
| order_id     |
| customer_id  |
| product_id   |
| order_date   |
| quantity     |
| total_amount |

---

## Aggregate Functions Covered

| Function   | Purpose                          |
|------------|----------------------------------|
| `COUNT()`  | Counts the number of rows        |
| `SUM()`    | Calculates the total value       |
| `AVG()`    | Calculates the average value     |
| `MIN()`    | Returns the smallest value       |
| `MAX()`    | Returns the largest value        |
| `GROUP BY` | Groups rows with the same values |
| `HAVING`   | Filters grouped results          |

---

## Prerequisites

Before starting this section, you should be familiar with:

- SQL Fundamentals
- Filtering & Sorting
- Basic `SELECT` statements
- `WHERE` clause

---

## Note

Aggregate Functions form the backbone of business reporting. They are frequently used in dashboards, KPI calculations, financial reports, sales analysis, and operational reporting.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
