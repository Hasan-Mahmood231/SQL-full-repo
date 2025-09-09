/*SELECT*
FROM Sales.Customers*/

-- Now update the only score of 5th ID customer.

UPDATE Sales.Customers
SET 
	Score = 90,
	Country = 'pakistan'
WHERE CustomerID = 5

SELECT*
FROM Sales.Customers


-- Delete the rows where id = 4 from customer table.
DELETE FROM Sales.Customers
WHERE CustomerID = 4


-- Now again insert same customer.
INSERT INTO Sales.Customers
VALUES(4,'hassan','mahmood','duby',8989)

SELECT*
FROM Sales.Customers
 