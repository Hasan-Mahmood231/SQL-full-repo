--customer retntion analysis.

SELECT
	OrderID,
	AVG(DATEDIFF(DAY,OrderDate,ShipDate)) AS 'Total difference'
FROM Sales.Orders
GROUP BY OrderID