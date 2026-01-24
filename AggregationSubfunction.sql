---find total number of order. / total number of oder for each customer.
SELECT
o.OrderID,
o.OrderDate,
o.CustomerID,
COUNT(*) over(PARTITION BY o.CustomerID) as TotalOder,
COUNT(CustomerID) OVER() AS CUSTOMERS
FROM Sales.Orders AS o


SELECT
CustomerID,
SUM(CustomerID) NoOfOder
FROM Sales.Orders
GROUP BY CustomerID

--Make another row put 1 if number of order and customerid is same other wise put 0.
SELECT*,
CASE
	WHEN 
		COUNT(OrderID) OVER()  = COUNT(CustomerID) OVER() THEN 1
		else 0
	END Checking,
	COUNT(ShipAddress) OVER() AS Ship_address_count,--itll remove null and count NO of address.
	COUNT(NULLIF(BillAddress,'')) OVER() AS Bill_Address,
	NULLIF(BillAddress,''),	--by this line we put null in emptyspaces.
	--LEN(BillAddress) AS length_bill
	

	--find the dublicate data.
	COUNT(*) OVER(PARTITION BY OrderID) AS UNIQE_VAL
FROM Sales.Orders



SELECT*,
COUNT(*) OVER(PARTITION BY OrderID) AS CHECK_DUB -- Check dublicate.
FROM Sales.OrdersArchive