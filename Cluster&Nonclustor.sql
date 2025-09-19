SELECT*
INTO Sales.CustomerIDX
FROM Sales.Customers



SELECT*
FROM Sales.CustomerIDX
WHERE CustomerID = 1 -- now this is head and search whole table for 1 id.

--create cluster.
CREATE CLUSTERED INDEX idx_CustomerIDX_CustomerID
ON Sales.CustomerIDX (CustomerID)
-- now this is ok and when we search id its based on index. but whatif when we srach the first ,last name?
-- for that we made the nonclustered idx.




--create non clustered idx.
CREATE NONCLUSTERED INDEX ridx_CustomerIDX_CustomerID
ON Sales.CustomerIDX (CustomerID)

--for multiple col we do like
CREATE NONCLUSTERED INDEX midx_CustomerIDX_CustomerID
ON Sales.CustomerIDX (CustomerID,FirstName,LastName)