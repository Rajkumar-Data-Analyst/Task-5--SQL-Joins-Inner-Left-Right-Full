USE ecommerce_cosmetics;
-- Create Customers Table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName  VARCHAR(100),
    Email  VARCHAR(100),
    PhoneNo VARCHAR(15),
    Address TEXT
);

INSERT INTO Customers (FullName, Email, PhoneNo, Address) VALUES ('Raj Kumar', 'raj@gmail.com', 8765435678, 'Noida India');
INSERT INTO Customers (FullName, Email, PhoneNo, Address) VALUES ('Venkatesh Kumar', 'ven@gmail.com', 8765435, 'Channai India');
INSERT INTO Customers (FullName, Email, PhoneNo, Address) VALUES ('Kiran Rao', 'rao@gmail.com', 5435678, 'Bangalore India');
INSERT INTO Customers (FullName, Email, PhoneNo, Address) VALUES ('Amir Khan', 'amir@gmail.com', 6543567, 'Mumbai India');
INSERT INTO Customers (FullName, Email, PhoneNo, Address) VALUES ('Uday Shetty', 'uday@gmail.com', 7655773, 'Hyderabad India');


SELECT * FROM customers;

-- Create Orders Table 

CREATE TABLE Orders_new (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductName VARCHAR (100),
    Amount DECIMAL (10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    
);
SELECT * FROM orders_new;

INSERT INTO Orders_new ( CustomerID, ProductName, Amount) VALUES (1, 'Lipstic', 200);
INSERT INTO Orders_new ( CustomerID, ProductName, Amount) VALUES (2, 'Face Wash', 500);
INSERT INTO Orders_new ( CustomerID, ProductName, Amount) VALUES (3, 'Eyeliner', 300);
INSERT INTO Orders_new ( CustomerID, ProductName, Amount) VALUES (4, 'Face Pouder', 500);
INSERT INTO Orders_new ( CustomerID, ProductName, Amount) VALUES (5, 'cream', 400);


SHOW TABLES;

/* DROP TABLE Payments;
DROP TABLE Orders;*/

-- Using Joins Queries
-- 1st Using INNER JOIN

SELECT 
    Customers.FullName,
    Orders_new.ProductName
FROM 
    Customers
INNER JOIN 
    Orders_new ON Customers.CustomerID = Orders_new.CustomerID
WHERE 
    Customers.FullName = 'Raj Kumar';
    

-- 2nd Using LEFT Join
SELECT
    Customers.FullName,
    Orders_new.ProductName
FROM
    Customers
LEFT JOIN
    Orders_new ON Customers.CustomerID = Orders_new.CustomerID
WHERE
    Orders_new.ProductName = 'Lipstic' OR Orders_new.OrderID = 1;  -- (You can use = 1, Replace value IS NULL if value null)

-- 3rd Using RIGHT JOIN
SELECT 
    Customers.FullName,
    Orders_new.ProductName
FROM 
    Customers
RIGHT JOIN 
    Orders_new ON Customers.CustomerID = Orders_new.CustomerID;  -- (You can use WHERE condition if value is NULL = WHERE Customers.CustomerID IS NULL;)
   
 
-- FULL JOIN using UNION of LEFT and RIGHT JOINs 

SELECT 
    Customers.CustomerID,
    Customers.FullName,
    Orders_new.ProductName
FROM 
    Customers
LEFT JOIN Orders_new ON Customers.CustomerID = Orders_new.CustomerID

UNION

SELECT 
    Orders_new.CustomerID,
    Customers.FullName,
    Orders_new.ProductName
FROM 
    Orders_new
RIGHT JOIN Customers ON Customers.CustomerID = Orders_new.CustomerID;


