-- First just show the data of two table.
SELECT*
FROM Sales.Customers

SELECT* 
FROM Sales.Customers


-----------------INNER JOIN--------------------
SELECT*
FROM Sales.Customers		--see the customer colm
INNER JOIN Sales.Orders		--and order colm

ON Customers.CustomerID = Orders.CustomerID		--if ids are match take that data.otherwise leave.

-----------------LEFT JOIN--------------------
--now if see only the left data completely and in write tbl only take 
--the match data. for unmatch data put NULL.

SELECT*
FROM Sales.Customers  AS C		--take this tbl completly without anychecking.
LEFT JOIN Sales.Orders AS S		--check only match data otherwise fill NULL.
ON C.CustomerID = S.CustomerID