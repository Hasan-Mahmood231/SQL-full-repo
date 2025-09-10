SELECT
O.CustomerID,
P.Product,
O.Sales,
P.Price,
C.FirstName AS Customer_name,
C.Country,
E.FirstName AS Employ_name,
E.Salary
FROM Sales.Orders AS O
LEFT JOIN Sales.Products AS P
ON P.ProductID = O.ProductID

LEFT JOIN Sales.Customers AS C
ON C.CustomerID = O.CustomerID

LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID

