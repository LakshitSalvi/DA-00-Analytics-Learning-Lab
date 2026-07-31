/*
===============================================================================
                             RETAILHUB DATABASE SCHEMA
===============================================================================

Project:
RetailHub - E-commerce Database

Description:
This SQL script creates a normalized relational database schema for an
e-commerce business. It demonstrates:

- Primary Keys
- Foreign Keys
- One-to-Many Relationships
- Many-to-Many Relationships (via Order_Items)
- Database Normalization (1NF, 2NF, 3NF)

===============================================================================
*/

-- ============================================================================
-- Create Database
-- ============================================================================

CREATE DATABASE RetailHub;

USE RetailHub;

-- ============================================================================
-- Categories
-- ============================================================================

CREATE TABLE Categories (

    CategoryID INT PRIMARY KEY AUTO_INCREMENT,

    CategoryName VARCHAR(100) NOT NULL,

    Description VARCHAR(255)

);

-- ============================================================================
-- Customers
-- ============================================================================

CREATE TABLE Customers (

    CustomerID INT PRIMARY KEY AUTO_INCREMENT,

    FirstName VARCHAR(50) NOT NULL,

    LastName VARCHAR(50) NOT NULL,

    Email VARCHAR(100) UNIQUE NOT NULL,

    Phone VARCHAR(20),

    City VARCHAR(100),

    State VARCHAR(100),

    Country VARCHAR(100),

    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- ============================================================================
-- Products
-- ============================================================================

CREATE TABLE Products (

    ProductID INT PRIMARY KEY AUTO_INCREMENT,

    CategoryID INT NOT NULL,

    ProductName VARCHAR(150) NOT NULL,

    Brand VARCHAR(100),

    Price DECIMAL(10,2) NOT NULL,

    Stock INT DEFAULT 0,

    FOREIGN KEY (CategoryID)

        REFERENCES Categories(CategoryID)

);

-- ============================================================================
-- Payments
-- ============================================================================

CREATE TABLE Payments (

    PaymentID INT PRIMARY KEY AUTO_INCREMENT,

    PaymentMethod VARCHAR(50) NOT NULL,

    PaymentStatus VARCHAR(30) NOT NULL,

    PaymentDate DATE NOT NULL

);

-- ============================================================================
-- Orders
-- ============================================================================

CREATE TABLE Orders (

    OrderID INT PRIMARY KEY AUTO_INCREMENT,

    CustomerID INT NOT NULL,

    PaymentID INT,

    OrderDate DATE NOT NULL,

    OrderStatus VARCHAR(30) NOT NULL,

    TotalAmount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (CustomerID)

        REFERENCES Customers(CustomerID),

    FOREIGN KEY (PaymentID)

        REFERENCES Payments(PaymentID)

);

-- ============================================================================
-- Order_Items
-- ============================================================================

CREATE TABLE Order_Items (

    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,

    OrderID INT NOT NULL,

    ProductID INT NOT NULL,

    Quantity INT NOT NULL,

    UnitPrice DECIMAL(10,2) NOT NULL,

    Discount DECIMAL(5,2) DEFAULT 0,

    FOREIGN KEY (OrderID)

        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)

        REFERENCES Products(ProductID)

);

-- ============================================================================
-- End of Schema
-- ============================================================================

/*
===============================================================================
TABLE RELATIONSHIPS
===============================================================================

Categories
      │
      │ 1
      ▼
Products

Customers
      │
      │ 1
      ▼
Orders

Payments
      │
      │ 1
      ▼
Orders

Orders
      │
      │ 1
      ▼
Order_Items
      ▲
      │
      │ M
Products

===============================================================================
NORMALIZATION
===============================================================================

✔ First Normal Form (1NF)

- Atomic values
- No repeating groups

✔ Second Normal Form (2NF)

- Product details separated from Order_Items
- Customer details separated from Orders

✔ Third Normal Form (3NF)

- Categories stored separately
- Payments stored separately

===============================================================================
*/
