# 🔗 One-to-Many Relationship (1:M)

## 📖 What is a One-to-Many Relationship?

A **One-to-Many (1:M) Relationship** is a relationship where **one record in a parent table can be associated with multiple records in a child table**, while each child record belongs to only one parent record.

In simple words:

> One parent can have many children, but each child has only one parent.

This is the **most common relationship** in relational databases.

---

# 🎯 Why Do We Need One-to-Many Relationships?

Real-world data naturally contains situations where one entity owns or manages multiple related records.

Examples include:

- One customer places many orders.
- One department has many employees.
- One category contains many products.
- One teacher teaches many students.
- One author writes many books.

Instead of repeating the parent information for every record, we store it once and connect related records using a **Foreign Key**.

---

# Real-World Example

Consider an online shopping platform.

One customer can place many orders.

However,

every order belongs to only one customer.

Relationship

```text
One Customer

      │

      │

      ▼

Many Orders
```

---

# Visual Representation

```text
Customers

┌────────────────────────────┐
│ 🔑 CustomerID              │
│ CustomerName               │
│ City                       │
└────────────────────────────┘
             │
             │ 1
             │
             │
             │ ∞
             ▼
┌────────────────────────────┐
│ 🔑 OrderID                 │
│ 🔗 CustomerID              │
│ OrderDate                  │
│ OrderAmount                │
└────────────────────────────┘

One Customer
      │
      └──────────────► Many Orders
```

---

# SQL Example

## Customers Table

```sql
CREATE TABLE Customers (

    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100),

    city VARCHAR(50)

);
```

---

## Orders Table

```sql
CREATE TABLE Orders (

    order_id INT PRIMARY KEY,

    customer_id INT,

    order_date DATE,

    order_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)

        REFERENCES Customers(customer_id)

);
```

Notice that

```text
customer_id
```

is **not UNIQUE**.

This allows one customer to appear in multiple rows.

---

# Sample Data

## Customers

| CustomerID | Customer Name |
|------------|---------------|
| 101 | Rahul |
| 102 | Priya |

---

## Orders

| OrderID | CustomerID | Amount |
|---------|------------|--------|
| 5001 | 101 | 2500 |
| 5002 | 101 | 1800 |
| 5003 | 101 | 7200 |
| 5004 | 102 | 4100 |

Customer **101**

has placed

**3 Orders**

Customer **102**

has placed

**1 Order**

---

# Relationship Diagram

```text
Customers

101 Rahul
102 Priya

        │

        ▼

Orders

5001 → Customer 101

5002 → Customer 101

5003 → Customer 101

5004 → Customer 102
```

---

# More Real-World Examples

## Department → Employees

```text
One Department

↓

Many Employees
```

---

## Category → Products

```text
One Category

↓

Many Products
```

---

## Teacher → Students

```text
One Teacher

↓

Many Students
```

---

## Country → Cities

```text
One Country

↓

Many Cities
```

---

## Brand → Products

```text
One Brand

↓

Many Products
```

---

# Why is this Better?

Suppose customer information is stored inside every order.

```text
OrderID

Customer Name

Customer City

Customer Phone
```

Every order repeats the same customer information.

Problems:

- Duplicate data
- Larger storage
- Difficult updates
- Data inconsistency

Instead,

store customer information once.

Reference it using

```text
CustomerID
```

This follows the principles of database normalization.

---

# Advantages

✅ Reduces duplicate data

---

✅ Easier maintenance

Update customer information in only one place.

---

✅ Faster storage

Less repeated information.

---

✅ Better consistency

Customer information stays synchronized.

---

✅ Supports efficient JOIN operations

---

# Disadvantages

❌ Requires JOINs to retrieve complete information.

---

❌ More tables must be managed.

---

# Best Practices

✔ Always use a Foreign Key.

✔ Index Foreign Key columns.

✔ Use meaningful table names.

✔ Avoid storing repeated information.

✔ Enforce Referential Integrity.

---

# Common Mistakes

### ❌ Storing Customer Name in Orders

Bad Design

```text
Orders

OrderID

Customer Name

Customer City

Customer Phone
```

Customer information becomes duplicated.

---

### ❌ Missing Foreign Keys

Without Foreign Keys,

orders may reference customers that don't exist.

---

### ❌ Deleting Parent Records Improperly

Deleting a customer without handling related orders can create orphan records.

Use appropriate

- CASCADE
- RESTRICT
- SET NULL

actions.

---

# Interview Questions

## Q1. What is a One-to-Many Relationship?

One parent record can have multiple child records.

Each child record belongs to only one parent.

---

## Q2. Give real-world examples.

- Customer → Orders
- Department → Employees
- Category → Products
- Teacher → Students
- Country → Cities

---

## Q3. How is One-to-Many implemented?

Using a Foreign Key in the child table.

---

## Q4. Can multiple child rows reference the same parent?

Yes.

That is exactly how One-to-Many relationships work.

---

## Q5. What happens if a parent record is deleted?

It depends on the Foreign Key action:

- CASCADE
- RESTRICT
- SET NULL
- SET DEFAULT

---

# Business Scenario

An e-commerce company stores

Customers

Products

Orders

Payments

Addresses

One customer may place hundreds of orders over several years.

Instead of storing customer information repeatedly,

every order stores only

```text
CustomerID
```

When customer details are needed,

SQL combines the tables using

```sql
JOIN
```

This reduces redundancy and keeps the database consistent.

---

# Summary

A **One-to-Many relationship** is the backbone of relational database design.

It allows a single parent record to be associated with multiple child records while maintaining data integrity through Foreign Keys.

This relationship is used extensively in banking systems, e-commerce platforms, hospital management systems, schools, inventory systems, and nearly every business application built on a relational database.

---

## Key Takeaways

- One parent can have many child records.
- Each child belongs to only one parent.
- Implemented using a Foreign Key.
- Reduces duplicate data.
- Supports normalization.
- The most commonly used relationship in relational databases.
