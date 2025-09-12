--Q : List all customer who have not place any order tell now.
SELECT 
*,
o.CustomerID
FROM Sales.Customers AS c	-- NOW i know when in order tbl the customer ID is empty such customer not place any order
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL	-- so i search where id is null and now find those customer.