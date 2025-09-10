SELECT*,
--TRIM(OrderStatus) AS TRIM_ORDER
LEN(OrderStatus) AS LENGTH_ORDER
FROM Sales.Orders

--WHERE LEN(ShipAddress) != LEN(TRIM(ShipAddress))


-------------------REPLACE---------------
SELECT*,
REPLACE(OrderDate,'-',' ') AS NEW_DATE
FROM Sales.Orders