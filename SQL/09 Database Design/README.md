# Database Design

## Overview

Database Design is the process of organizing data into structured tables and defining relationships between them to ensure accuracy, consistency, and efficiency. A well-designed database minimizes redundancy, maintains data integrity, and supports scalable applications and analytical reporting.

In this section, you'll learn the core principles of relational database design and build a complete sample database that will be used throughout the remaining sections of this repository.

---

## Learning Objectives

After completing this section, you will be able to:

- Understand relational database concepts
- Design normalized database schemas
- Identify entities and relationships
- Create Primary Keys and Foreign Keys
- Apply database normalization techniques
- Define constraints for data integrity
- Create indexes for query optimization
- Build a complete retail database from scratch

---

## Contents

| No. | Topic |
|-----|----------------------------------------------|
| 01 | Relational Database Concepts |
| 02 | Entity Relationship Diagram (ERD) |
| 03 | Primary Keys & Foreign Keys |
| 04 | Database Normalization (1NF, 2NF, 3NF) |
| 05 | Constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`) |
| 06 | Indexes and Performance |
| 07 | RetailHub Database Schema |
| 08 | Create Database Script |
| 09 | Insert Sample Data |
| 10 | Database Documentation |

---

## RetailHub Sample Database

The complete SQL learning repository uses a unified sample database named **RetailHub**. All advanced SQL exercises and business case studies are based on this schema.

### Core Tables

| Table | Purpose |
|-------|---------|
| Customers | Customer information |
| Products | Product catalog |
| Categories | Product categories |
| Suppliers | Supplier details |
| Employees | Employee records |
| Orders | Customer orders |
| Order_Details | Products within each order |
| Payments | Payment transactions |
| Shippers | Shipping information |

---

## Database Concepts Covered

| Concept | Description |
|----------|-------------|
| Relational Database | Organizes data into related tables |
| Entity Relationship Diagram (ERD) | Visual representation of table relationships |
| Primary Key | Uniquely identifies each record |
| Foreign Key | Creates relationships between tables |
| Normalization | Reduces redundancy and improves consistency |
| Constraints | Enforces data validity |
| Indexes | Improves query performance |
| Referential Integrity | Maintains valid relationships between tables |

---

## Project Files

This section will include:

| File | Description |
|------|-------------|
| `RetailHub_ERD.png` | Entity Relationship Diagram |
| `RetailHub_Schema.sql` | Complete database schema |
| `Create_Database.sql` | Database creation script |
| `Insert_Sample_Data.sql` | Sample dataset for practice |
| `Database_Documentation.md` | Detailed schema documentation |

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
- CASE Statements

---

## Note

A strong understanding of database design is essential for writing efficient SQL queries and building scalable data solutions. The **RetailHub** database created in this section serves as the foundation for the Business Case Studies and Interview Questions that follow, providing a consistent and realistic environment for practicing SQL.

---

*This section will be updated as I progress through my Data Analytics learning journey.*
