-- copy data from one table to another.

--Creat table and then we'll add values.
CREATE TABLE employ(
	name_f varchar(30) NOT NULL,
	country varchar(40) NOT NULL,
	Score int 
	)

--Now our job is to insert values to this table from customer table.
INSERT INTO employ(name_f,country,Score)
SELECT 
	FirstName,
	Country,
	90
FROM Sales.Customers

SELECT*
FROM employ