SELECT 
OrderDate,
FORMAT(OrderDate,'dd') AS onlydate,
FORMAT(OrderDate,'ddd') AS abb_name,
FORMAT(OrderDate,'dddd') AS Full_name,

--for year
FORMAT(OrderDate,'yy') AS YEAR,
--FOR month
FORMAT(OrderDate,'MMM') AS MONTH

FROM Sales.Orders