--Aggregation & Window
SELECT 
O.ProductID,
SUM(O.Sales) AS total_Sale -- after combining all product we find sum.
FROM Sales.Orders AS O
GROUP BY ProductID --by productID we combine everything related to single product.

SELECT
ProductID,
--SUM(O.OrderID)
COUNT(*) as count -- show how many time this productid appear in data.
FROM Sales.Orders AS O
GROUP BY ProductID

--WINDOW FUNCTION.
--partition by combine data with according to mention partition.
SELECT*,
SUM(Sales) OVER() AS TYPE1,
--MONTH(OrderDate) this part extract the month and then based on that we combine data & make table.
SUM(Sales) OVER(PARTITION BY MONTH(OrderDate)) AS PerMonthSum, --make groups according to months and then sum the sale.
COUNT(Sales) OVER(PARTITION BY MONTH(OrderDate)) AS PerMonthOrder
FROM Sales.Orders