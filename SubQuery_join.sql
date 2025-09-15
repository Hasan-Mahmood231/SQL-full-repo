--show customer detial and find order of each customer.
SELECT 
C.*,
t.ORDER_PERCUSTOMER
FROM Sales.Customers AS C
--use the left join to combine result.
LEFT JOIN(
	SELECT		--is a sub query.
	CustomerID,
	COUNT(*) AS ORDER_PERCUSTOMER
	FROM Sales.Orders
	GROUP BY CustomerID
	)t
ON C.CustomerID = t.CustomerID