--show the detail of customer order employ in one tbl and make it'sa view.
CREATE VIEW Sales.CustomerDetail AS 
(
	SELECT
		c.CustomerID,
		COALESCE(c.FirstName,'') + COALESCE(c.LastName,'') AS Name,
		c.Country,
		COALESCE(s.Total_Sale,0) AS  TotalSale,
		COALESCE(arvhai_order.MAX_order,'') AS OrderDate
	FROM Sales.Customers as c

	LEFT JOIN (
	SELECT
		CustomerID,
		COALESCE(SUM(Sales),0) AS Total_Sale
		FROM Sales.Orders
		GROUP BY CustomerID
	)s
	ON c.CustomerID = s.CustomerID

	LEFT JOIN(
		SELECT
		oa.CustomerID,
		MAX(oa.OrderDate) AS MAX_order
		FROM Sales.OrdersArchive AS oa
		GROUP BY oa.CustomerID
	)arvhai_order
	ON c.CustomerID = arvhai_order.CustomerID
)
