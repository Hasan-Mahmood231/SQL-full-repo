--DML class prictus.
SELECT 
* 
FROM Sales.Customers

--UPDATE the country name of pakistan of id 4.
UPDATE SALES.Customers
SET Country = 'pakistan'
WHERE Sales.Customers.CustomerID = 4

--just check for safe update.
SELECT 
*
FROM Sales.Customers
Where CustomerID = 4

-- change the score to 90 and update name to hassan of 5th id.
UPDATE Sales.Customers
SET FirstName = 'Hassan',
	Score = 90
WHERE CustomerID = 5

--Feltring data 
 