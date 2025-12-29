--JOIN in sql.

SELECT *
FROM Sales.Customers

SELECT *
FROM Sales.Orders

--INEER JION.
SELECT *
FROM Sales.Customers AS CS
INNER JOIN Sales.Orders AS ORD
ON CS.CustomerID = ORD.CustomerID