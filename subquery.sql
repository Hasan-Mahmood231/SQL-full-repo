--select product name,id,price and total Number of order.
SELECT
P.ProductID,
P.Category,
P.Price,
(SELECT COUNT(*) FROM Sales.Orders)TOTA_ORDER
FROM Sales.Products AS P


--show detail of order made by customer in germany..
SELECT*
FROM Sales.Orders AS O
WHERE O.CustomerID IN (
				SELECT	--by subquery gain all order from germany
				CustomerID
				FROM Sales.Customers
				WHERE Country = 'Germany'
				)

