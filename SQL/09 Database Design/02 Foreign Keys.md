# 🔗 Foreign Keys

## 📖 What is a Foreign Key?

A **Foreign Key (FK)** is a column (or group of columns) in one table that refers to the **Primary Key** of another table.

It creates a relationship between two tables and ensures that the data remains consistent.

Think of a Foreign Key as a **bridge** that connects related tables.

---

# 🎯 Why Do We Need Foreign Keys?

Imagine an online shopping website.

There are two tables:

- Customers
- Orders

Every order belongs to a customer.

Instead of storing all customer details inside every order, we simply store the customer's unique ID.

This avoids duplicate data and keeps the database organized.

---

## Without a Foreign Key

### Customers

| CustomerID | Name |
|------------|------|
| 101 | Rahul |
| 102 | Priya |

### Orders

| OrderID | CustomerID |
|---------|------------|
| 5001 | 101 |
| 5002 | 999 |

Who is Customer **999**?

There is no such customer.

This creates **invalid data**.

---

## With a Foreign Key

### Customers

| CustomerID | Name |
|------------|------|
| 101 | Rahul |
| 102 | Priya |

### Orders

| OrderID | CustomerID |
|---------|------------|
| 5001 | 101 |
| 5002 | 102 |

Every order now belongs to a valid customer.

---

# Relationship

```text
Customers
──────────────

🔑 CustomerID

        ▲
        │
        │
        │ Foreign Key
        │

Orders
──────────────

🔗 CustomerID
OrderID
OrderDate
```

---

# SQL Syntax

```sql
CREATE TABLE Customers (

    customer_id INT PRIMARY KEY,

    customer_name VARCHAR(100)

);
```

```sql
CREATE TABLE Orders (

    order_id INT PRIMARY KEY,

    customer_id INT,

    order_date DATE,

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)

);
```

---

# How Foreign Keys Work

Suppose we insert

```text
Customers

101
102
103
```

Now inserting

```text
Orders

CustomerID = 101
```

✔ Allowed

---

Inserting

```text
CustomerID = 999
```

❌ Rejected

because Customer 999 does not exist.

This is called **Referential Integrity**.

---

# Referential Integrity

Referential Integrity means:

> Every Foreign Key value must exist in the referenced Primary Key table.

It prevents:

- Invalid records
- Orphan records
- Broken relationships
- Data inconsistency

---

# Parent Table vs Child Table

### Parent Table

Contains the Primary Key.

Example

```text
Customers
```

---

### Child Table

Contains the Foreign Key.

Example

```text
Orders
```

Relationship

```text
Customers
    │
    │
    └──────────▶ Orders
```

---

# ON DELETE Actions

When a parent record is deleted, SQL needs to know what should happen to related child records.

---

## RESTRICT

Do not allow deletion.

```sql
FOREIGN KEY (customer_id)

REFERENCES Customers(customer_id)

ON DELETE RESTRICT;
```

Example

Customer has existing orders.

Trying to delete the customer

❌ Not Allowed

---

## CASCADE

Delete child rows automatically.

```sql
ON DELETE CASCADE
```

Example

Delete Customer

↓

Delete all Orders

↓

Everything removed automatically.

---

## SET NULL

```sql
ON DELETE SET NULL
```

When the customer is deleted,

the CustomerID inside Orders becomes

```text
NULL
```

---

## SET DEFAULT

Supported by some databases.

Deleted values become

```text
Default Value
```

---

# ON UPDATE Actions

Foreign Keys also define behavior when the Primary Key changes.

Example

```sql
ON UPDATE CASCADE
```

If

```text
CustomerID

101

↓

501
```

then all related orders automatically become

```text
501
```

---

# Business Scenario

Imagine Flipkart.

Tables

```text
Customers
Orders
Payments
Products
Reviews
Addresses
```

Every table references

```text
CustomerID
```

using Foreign Keys.

Without Foreign Keys,

orders could belong to customers that don't exist.

Payments could point to deleted orders.

Reviews could reference products that were never created.

The database would become unreliable.

---

# Real-World Examples

| Parent Table | Child Table |
|--------------|-------------|
| Customers | Orders |
| Orders | Payments |
| Departments | Employees |
| Doctors | Patients |
| Students | Enrollments |
| Products | Reviews |
| Authors | Books |

---

# Advantages

✅ Prevents invalid data

✅ Maintains data integrity

✅ Connects multiple tables

✅ Eliminates orphan records

✅ Improves database reliability

---

# Best Practices

✔ Reference only Primary Keys or UNIQUE columns.

✔ Name Foreign Keys clearly.

✔ Use appropriate ON DELETE actions.

✔ Avoid circular relationships.

✔ Index Foreign Key columns for faster joins.

---

# Common Mistakes

### ❌ Referencing a Non-Primary Column

Always reference a Primary Key or UNIQUE column.

---

### ❌ Deleting Parent Records Accidentally

Without understanding CASCADE,

you may unintentionally delete thousands of child records.

---

### ❌ Ignoring Referential Integrity

Never insert Foreign Key values that don't exist.

---

### ❌ Circular Foreign Keys

Avoid situations where

Table A references Table B

and

Table B references Table A.

---

# Interview Questions

## Q1. What is a Foreign Key?

A Foreign Key is a column that references the Primary Key of another table.

---

## Q2. Can a table have multiple Foreign Keys?

Yes.

Example

Orders

```text
CustomerID

EmployeeID

ShipperID
```

All three can be Foreign Keys.

---

## Q3. Can a Foreign Key contain NULL?

Yes.

Unless the column is defined as

```sql
NOT NULL
```

---

## Q4. Can duplicate Foreign Key values exist?

Yes.

Many child records can reference the same parent record.

Example

Customer

101

can have

100 Orders.

---

## Q5. Difference Between Primary Key and Foreign Key?

| Primary Key | Foreign Key |
|-------------|-------------|
| Uniquely identifies a row | References another table |
| Unique | Can contain duplicates |
| Cannot be NULL | Can be NULL |
| One per table | Multiple allowed |

---

# Visual Representation

```text
Customers
────────────────────────

🔑 CustomerID

CustomerName

City

        │
        │
        │
        ▼

Orders
────────────────────────

OrderID

🔗 CustomerID

OrderDate

Amount
```

---

# Summary

A Foreign Key connects related tables and ensures that every referenced record exists.

It is one of the most important features of relational databases because it enforces **Referential Integrity**, prevents invalid data, and allows multiple tables to work together as a single connected system.

Every real-world database—whether for banking, healthcare, e-commerce, education, or social media—uses Foreign Keys extensively to maintain consistency and reliability.

---

## Key Takeaways

- A Foreign Key references a Primary Key.
- It connects related tables.
- It enforces Referential Integrity.
- It prevents orphan records.
- A table can have multiple Foreign Keys.
- Foreign Keys support actions like CASCADE, RESTRICT, and SET NULL.
