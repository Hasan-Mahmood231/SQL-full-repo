SELECT
C.FirstName,
C.LastName
FROM Sales.Customers AS C

UNION	--by this union we combine all data and remove dublicate.

SELECT
E.FirstName,
E.LastName
FROM Sales.Employees AS E



-----------------UNION ALL-------------------
--select all data with dublicate.
SELECT
C.FirstName,
C.LastName
FROM Sales.Customers AS C

UNION ALL	--by UNION ALL we combine everything and not remove dublicate.

SELECT
E.FirstName,
E.LastName
FROM Sales.Employees AS E


---------------EXCEPT--------------
-- in except only show the data of a which is not present in b.
-- task is show only customer which is not employ.
SELECT
C.FirstName,
C.LastName
FROM Sales.Customers AS C

EXCEPT	--by UNION ALL we combine everything and not remove dublicate.

SELECT
E.FirstName,
E.LastName
FROM Sales.Employees AS E


--------------------INTERSECT-----------------------
--it return only the common values among 2 table and remove dublicate values.
SELECT
C.FirstName,
C.LastName
FROM Sales.Customers AS C

INTERSECT	--INTERSECT return only the common rows among 2 tbl.
SELECT
E.FirstName,
E.LastName
FROM Sales.Employees AS E


