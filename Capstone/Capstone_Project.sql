CREATE DATABASE SuperMart_Db;

USE SuperMart_Db;
GO

/*=============================================================================================================
                                                   ACTIVITY 1
  =============================================================================================================
*/

CREATE TABLE Customers(
CustomerId INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
City VARCHAR(100) NOT NULL,
Phone VARCHAR(20) NULL,
Email VARCHAR(50) NOT NULL
);

CREATE TABLE Orders(
OrderId INT PRIMARY KEY IDENTITY(100,1),
CustomerId INT NOT NULL,
OrderDate DATE NOT NULL, 
StatusCode CHAR(1) NOT NULL CHECK (StatusCode IN ('P','D','C')),
TotalAmount DECIMAL(10,2) NOT NULL,
CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);



/*=============================================================================================================
                                                   ACTIVITY 2
  =============================================================================================================
*/

  INSERT INTO Customers(FirstName, LastName, City, Phone, Email)
  VALUES
  ('Senamile', 'Mzimela', 'Cape Town', NULL, 'senamile.mzimela@email.com'),
  ('Lee-Shay', 'Arkeldien', 'Cape Town', NULL, 'shay.arkeldien@email.com'),
  ('Mamello', 'Mpeke', 'Johannesburg', NULL, 'mamello.mpeke@email.com'),
  ('Keamogetswe', 'Morolong', 'Pretoria', NULL, 'kea.morolong@email.com'),
  ('Luyanda', 'Dungayezi', 'Johannesburg', NULL, 'luyanda.dungayezi@email.com'),
  ('Lisa', 'Chinkota', 'Pretoria', NULL, 'lisa.chinkota@email.com'),
  ('Kamogelo', 'Legadimane', 'Cape Town', NULL, 'kamogelo.legadimane@email.com');

  UPDATE Customers
  SET Phone = '0732891918'
  WHERE CustomerId = 1;

  UPDATE Customers
  SET Phone = '0814562574'
  WHERE CustomerId = 4;

  UPDATE Customers
  SET Phone = '0821574631'
  WHERE CustomerId = 7;
  
  SELECT * FROM Customers;

  INSERT INTO Orders(CustomerId, OrderDate, StatusCode, TotalAmount)
  VALUES
  (1, '2026-01-15', 'P', 1200.00),
  (2, '2026-02-20', 'D', 350.00),
  (3, '2026-03-05', 'C', 780.00),
  (4, '2026-05-19', 'P', 1500.00),
  (3, '2026-05-25', 'D', 200.00),
  (5, '2026-06-30', 'C', 990.20),
  (4, '2026-07-28', 'D', 481.38),
  (4, '2026-08-18', 'C', 1745.50),
  (2, '2026-09-22', 'P', 600.00),
  (1, '2026-12-05', 'P', 400.00);

  SELECT * FROM Orders;

  
/*=============================================================================================================
                                                   ACTIVITY 3
  =============================================================================================================
*/

SELECT 
CustomerId,
FirstName + ' ' + LastName AS [Customer Name],
'South Africa' AS Country,
City,
COALESCE(Phone, 'No Phone Number') AS Phone
FROM Customers;

/*=============================================================================================================
                                                   ACTIVITY 4
  =============================================================================================================
*/

SELECT
FirstName + ' ' + LastName AS [Customer Name],
Email,
City
FROM Customers
WHERE City IN ('Johannesburg', 'Pretoria');

SELECT
OrderId,
CustomerId,
OrderDate,
StatusCode AS Status,
TotalAmount
FROM Orders
WHERE OrderDate BETWEEN '2026-01-01' AND '2026-03-31'; 

/*=============================================================================================================
                                                   ACTIVITY 5
  =============================================================================================================
*/

SELECT
c.FirstName + ' ' + c.LastName AS [Customer Name],
o.OrderId,
o.OrderDate,
o.TotalAmount
FROM Customers c
INNER JOIN Orders o
ON c.CustomerId = o.CustomerId;

SELECT
c.FirstName + ' ' + c.LastName AS [Customer Name],
o.OrderId,
o.OrderDate,
o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerId = o.CustomerId;

SELECT
c.FirstName + ' ' + c.LastName AS [Customer Name],
o.OrderId,
o.OrderDate,
o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerId = o.CustomerId;

SELECT
c.FirstName + ' ' + c.LastName AS [Customer Name],
o.OrderId,
o.OrderDate,
o.TotalAmount
FROM Customers c
FULL OUTER JOIN Orders o
ON c.CustomerId = o.CustomerId;

/*=============================================================================================================
                                                   ACTIVITY 6
  =============================================================================================================
*/

SELECT 
UPPER(FirstName + ' ' + LastName) AS [Customer Name],
'South Africa' AS Country,
LEN(FirstName) AS [First Name Length],
City
FROM Customers
ORDER BY FirstName ASC;

SELECT 
City,
COUNT(CustomerId) AS [Total Customers]
FROM Customers
GROUP BY City
ORDER BY [Total Customers] DESC;

SELECT
COUNT(OrderId) AS [Total Orders],
AVG(TotalAmount) AS [Average Order Amount],
MAX(TotalAmount) AS [Highest Order Amount],
MIN(TotalAmount) AS [Lowest Order Amount]
FROM Orders;

SELECT
o.OrderId,
o.OrderDate,
YEAR(o.OrderDate) AS [Order Year],
MONTH(o.OrderDate) AS [Order Month],
DATEDIFF(DAY, o.OrderDate, GETDATE()) AS [Days Since Order],
o.TotalAmount
FROM Orders o
ORDER BY o.TotalAmount DESC;

/*=============================================================================================================
                                                   ACTIVITY 7
  =============================================================================================================
*/
