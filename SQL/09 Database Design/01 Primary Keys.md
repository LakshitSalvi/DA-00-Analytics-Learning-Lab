# 🔑 Primary Keys

## 📖 What is a Primary Key?

A **Primary Key (PK)** is a column or a combination of columns that **uniquely identifies each row** in a table.

Think of it as the **identity card** of every record stored in a database.

Every table should have one primary key so that each record can be uniquely identified.

---

## 🎯 Why Do We Need Primary Keys?

Imagine an e-commerce website storing thousands of customers.

Without a unique identifier, two customers with the same name would be impossible to distinguish.

### ❌ Without Primary Key

| Name | City |
|------|------|
| Rahul | Pune |
| Rahul | Pune |

Which Rahul placed an order?

There is no way to know.

---

### ✅ With Primary Key

| CustomerID | Name | City |
|------------|------|------|
| 101 | Rahul | Pune |
| 102 | Rahul | Pune |

Now every customer can be identified uniquely.

---

# Characteristics of a Primary Key

A Primary Key must satisfy the following conditions.

| Property | Description |
|----------|-------------|
| Unique | Every value must be different |
| NOT NULL | Cannot contain NULL values |
| Stable | Should rarely change |
| One Per Table | Every table can have only one Primary Key |
| Indexed | Automatically indexed in most databases |

---

# SQL Syntax

```sql
CREATE TABLE Customers (

    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100),

    city VARCHAR(50)

);
```

---

# Example

### Customers Table

| customer_id | customer_name | city |
|-------------|---------------|------|
| 101 | Rahul | Pune |
| 102 | Priya | Mumbai |
| 103 | Aman | Jaipur |

Here,

```text
customer_id
```

is the Primary Key because every value is unique.

---

# Composite Primary Key

Sometimes a single column is not enough.

In that case, multiple columns together form the Primary Key.

Example:

```sql
CREATE TABLE Order_Items (

    order_id INT,

    product_id INT,

    quantity INT,

    PRIMARY KEY (order_id, product_id)

);
```

Neither column is unique individually.

But together,

```text
(order_id, product_id)
```

becomes unique.

---

# Business Scenario

Suppose Amazon stores millions of orders.

Instead of identifying customers using

- Name
- Mobile Number
- Email

they simply use

```text
CustomerID
```

Similarly,

Every order has

```text
OrderID
```

Every product has

```text
ProductID
```

This makes searching extremely fast and reliable.

---

# Real-World Examples

| Industry | Primary Key |
|-----------|-------------|
| Banking | Account Number |
| Hospital | Patient ID |
| College | Student ID |
| E-Commerce | Customer ID |
| Airlines | Ticket Number |
| Library | Book ID |
| Employee Management | Employee ID |

---

# Advantages

✅ Eliminates duplicate records

✅ Makes searching faster

✅ Improves data integrity

✅ Required for relationships

✅ Supports indexing

---

# Best Practices

✔ Use integer IDs whenever possible.

✔ Keep Primary Keys short.

✔ Never use names as Primary Keys.

✔ Avoid updating Primary Key values.

✔ Use surrogate keys instead of business data.

Example:

Good

```text
CustomerID
```

Bad

```text
Email
```

because emails can change.

---

# Common Mistakes

### ❌ Using Name

```text
Rahul
Rahul
Rahul
```

Names are never unique.

---

### ❌ Using Phone Number

People change phone numbers.

---

### ❌ Using Email

Emails can be updated.

---

### ❌ Allowing NULL

Primary Keys cannot contain NULL values.

---

### ❌ Updating Primary Keys Frequently

Changing Primary Keys may break relationships with other tables.

---

# Interview Questions

### Q1. Can a table have multiple Primary Keys?

**Answer**

No.

A table can have only one Primary Key.

However, that Primary Key may consist of multiple columns (Composite Primary Key).

---

### Q2. Can a Primary Key contain NULL?

No.

NULL values are not allowed.

---

### Q3. Can duplicate values exist?

No.

Primary Keys must always be unique.

---

### Q4. Is a Primary Key automatically indexed?

Yes.

Most database systems automatically create an index for the Primary Key.

---

### Q5. Can we change a Primary Key?

Yes, but it is generally discouraged because other tables may reference it through Foreign Keys.

---

# Visual Representation

```text
Customers
──────────────────────────────

🔑 customer_id
customer_name
city
email
phone

        │

        │ uniquely identifies

        ▼

Every customer record
```

---

# Summary

A Primary Key is the foundation of every relational database.

It ensures that every record can be uniquely identified, prevents duplicate data, and enables relationships between tables.

Without Primary Keys, maintaining data integrity in real-world systems such as banking, e-commerce, healthcare, and education would be extremely difficult.

---

## Key Takeaways

- A Primary Key uniquely identifies each row.
- It cannot contain NULL values.
- Duplicate values are not allowed.
- Every table should have one Primary Key.
- Composite Primary Keys use multiple columns.
- Primary Keys are the basis for table relationships.
