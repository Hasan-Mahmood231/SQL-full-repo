SELECT*
INTO Sales.IndexCustomer
FROM Sales.Customers


SELECT*
FROM Sales.IndexCustomer

CREATE CLUSTERED INDEX idx_IndexCustomer_CustomerID
ON Sales.IndexCustomer (CustomerID)

CREATE NONCLUSTERED INDEX idx_IndexCustomer2_FirstName
ON Sales.IndexCustomer (FirstName)

CREATE NONCLUSTERED INDEX idx_IndexCustomer3_LastName
ON Sales.IndexCustomer (LastName)