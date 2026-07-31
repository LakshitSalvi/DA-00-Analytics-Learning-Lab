/*
===============================================================================
                           RETAILHUB SAMPLE DATA
===============================================================================

Description:
Sample data for the RetailHub database.

This dataset demonstrates:

• Multiple Customers
• Multiple Product Categories
• Multiple Products
• Different Payment Methods
• Orders
• Order Items

The data is suitable for practicing SQL queries including:
SELECT, WHERE, GROUP BY, HAVING, JOINS,
Subqueries, Window Functions, CTEs and CASE.

===============================================================================
*/

-- ============================================================================
-- Categories
-- ============================================================================

INSERT INTO Categories (CategoryName, Description)
VALUES
('Electronics', 'Electronic Devices'),
('Home Appliances', 'Household Products'),
('Furniture', 'Home & Office Furniture'),
('Fashion', 'Clothing & Accessories'),
('Books', 'Educational & Entertainment Books');

-- ============================================================================
-- Customers
-- ============================================================================

INSERT INTO Customers
(FirstName, LastName, Email, Phone, City, State, Country)
VALUES
('Rahul','Sharma','rahul@example.com','9876543210','Pune','Maharashtra','India'),
('Priya','Verma','priya@example.com','9876543211','Mumbai','Maharashtra','India'),
('Aman','Singh','aman@example.com','9876543212','Delhi','Delhi','India'),
('Sneha','Patel','sneha@example.com','9876543213','Ahmedabad','Gujarat','India'),
('Karan','Mehta','karan@example.com','9876543214','Jaipur','Rajasthan','India');

-- ============================================================================
-- Products
-- ============================================================================

INSERT INTO Products
(CategoryID, ProductName, Brand, Price, Stock)
VALUES
(1,'Laptop','Dell',65000,30),
(1,'Wireless Mouse','Logitech',1200,150),
(1,'Mechanical Keyboard','Keychron',5200,60),
(2,'Air Conditioner','LG',42000,15),
(2,'Refrigerator','Samsung',58000,10),
(3,'Office Chair','Green Soul',8500,40),
(3,'Study Table','IKEA',12500,25),
(4,'Running Shoes','Nike',4500,80),
(4,'Backpack','Wildcraft',2500,120),
(5,'SQL for Beginners','Packt',899,200);

-- ============================================================================
-- Payments
-- ============================================================================

INSERT INTO Payments
(PaymentMethod, PaymentStatus, PaymentDate)
VALUES
('Credit Card','Completed','2026-01-05'),
('UPI','Completed','2026-01-06'),
('Debit Card','Completed','2026-01-08'),
('Net Banking','Completed','2026-01-09'),
('Cash on Delivery','Pending','2026-01-10');

-- ============================================================================
-- Orders
-- ============================================================================

INSERT INTO Orders
(CustomerID, PaymentID, OrderDate, OrderStatus, TotalAmount)
VALUES
(1,1,'2026-01-05','Delivered',66200.00),
(2,2,'2026-01-06','Delivered',5700.00),
(3,3,'2026-01-08','Shipped',42000.00),
(1,4,'2026-01-09','Delivered',13400.00),
(5,5,'2026-01-10','Processing',7000.00);

-- ============================================================================
-- Order Items
-- ============================================================================

INSERT INTO Order_Items
(OrderID, ProductID, Quantity, UnitPrice, Discount)
VALUES

-- Order 1
(1,1,1,65000,0),
(1,2,1,1200,0),

-- Order 2
(2,3,1,5200,500),

-- Order 3
(3,4,1,42000,0),

-- Order 4
(4,6,1,8500,500),
(4,9,2,2500,0),

-- Order 5
(5,8,1,4500,0),
(5,10,2,899,0);

-- ============================================================================
-- Verify Data
-- ============================================================================

SELECT * FROM Categories;

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Payments;

SELECT * FROM Orders;

SELECT * FROM Order_Items;

/*
===============================================================================
PRACTICE QUESTIONS
===============================================================================

1. Show all customers.

2. List all products costing more than ₹5,000.

3. Find the total number of orders.

4. Show products sorted by price.

5. Find customers from Maharashtra.

6. Display total sales by customer.

7. Display total revenue by product.

8. Show the most expensive product.

9. Count products in each category.

10. Show average order value.

11. Find customers who placed more than one order.

12. Display order details with customer names.

13. Show top 5 highest-selling products.

14. Calculate running total of sales.

15. Rank products by revenue.

===============================================================================
END OF SAMPLE DATA
===============================================================================
*/
