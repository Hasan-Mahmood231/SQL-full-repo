-- QN1. Find the order place in each week.from order dataset.
SELECT
DATETRUNC(MONTH,OrderDate) WEEK_ORDER,
COUNT(*)
FROM Sales.Orders AS O
GROUP BY DATETRUNC(MONTH,OrderDate)

--HOW many order place in year.
SELECT 
month(OrderDate),
COUNT(*) AS NO_ORDER	--col which count the no of order.
FROM Sales.Orders
GROUP BY month(OrderDate)

--HOW many order place in month show month name.
SELECT 
DATENAME(MONTH,OrderDate),
COUNT(*) AS NO_ORDER	--col which count the no of order.
FROM Sales.Orders
GROUP BY DATENAME(MONTH,OrderDate)