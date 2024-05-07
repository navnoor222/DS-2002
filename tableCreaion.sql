CREATE DATABASE IF NOT EXISTS STORESALE;
USE STORESALE;

DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Customers (
    CustomerID VARCHAR(50) PRIMARY KEY,
    CustomerName VARCHAR(255),
    Segment VARCHAR(255),
    Country VARCHAR(255),
    City VARCHAR(255),
    State VARCHAR(255),
    PostalCode VARCHAR(20),
    Region VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID VARCHAR(50) PRIMARY KEY,
    CustomerID VARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(100),
    Sales DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2),
    Profit DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Categories (
    CategoryName VARCHAR(255) PRIMARY KEY,
    SubCategory VARCHAR(255)
);

CREATE TABLE Products (
    ProductID VARCHAR(50) PRIMARY KEY,
    ProductName VARCHAR(255),
    CategoryName VARCHAR(255),
    Price DECIMAL(10, 2),
    FOREIGN KEY (CategoryName) REFERENCES Categories(CategoryName)
);



CREATE TABLE Order_Items (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID VARCHAR(50),
    ProductID VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
