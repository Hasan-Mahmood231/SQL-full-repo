 
--select only customer who place order.
SELECT *
FROM Sales.CustomerDetail as cd , Sales.Orders as ord
where cd.CustomerID = ord.CustomerID