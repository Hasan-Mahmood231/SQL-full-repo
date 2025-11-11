 
--select only customer who place order.
--understand the forigen key and primery key.
SELECT *
FROM Sales.CustomerDetail as cd , Sales.Orders as ord
where cd.CustomerID = ord.CustomerID
