SELECT CustomerName, Country 
FROM Customers 
WHERE Country = 'Germany' 
ORDER BY CustomerName;

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate 
FROM Orders 
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID 
FROM Customers 
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName 
FROM Orders 
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT ProductName, Price 
FROM Products 
WHERE SupplierID IN ( 
    SELECT SupplierID 
    FROM Suppliers 
    WHERE Country = 'USA' 
);

SELECT ProductName, Price 
FROM Products 
WHERE Price > ( 
    SELECT AVG(Price) FROM Products 
);

SELECT AVG(Price) AS AveragePrice 
FROM Products;

SELECT SupplierID, COUNT(*) AS TotalProducts 
FROM Products 
GROUP BY SupplierID;

SELECT OrderID, CustomerID, OrderDate 
FROM Orders 
WHERE OrderDate IN ( 
  SELECT MAX(OrderDate) 
  FROM Orders 
  GROUP BY CustomerID 
) 
ORDER BY OrderDate DESC;

SELECT Products.ProductName, Suppliers.SupplierName, 
Suppliers.ContactName 
FROM Products 
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

SELECT Employees.EmployeeID, Employees.LastName 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
WHERE Orders.OrderID IS NULL;

SELECT ProductName, Price 
FROM Products 
WHERE Price > ( 
  SELECT MAX(Price) 
  FROM Products 
  WHERE SupplierID = 1 
);

SELECT CustomerName 
FROM Customers 
WHERE CustomerID IN ( 
  SELECT CustomerID 
  FROM Orders 
  GROUP BY CustomerID 
  HAVING COUNT(OrderID) > 3 
);

SELECT AVG(ProductCount) AS AvgProductsPerOrder 
FROM ( 
  SELECT OrderID, COUNT(*) AS ProductCount 
  FROM OrderDetails 
  GROUP BY OrderID 
) AS OrderProductCounts;

SELECT 
  Orders.OrderID, 
  Customers.CustomerName, 
  SUM(OrderDetails.UnitPrice * OrderDetails.Quantity) AS TotalValue 
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID 
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID 
GROUP BY Orders.OrderID, Customers.CustomerName;