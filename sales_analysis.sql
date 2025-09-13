--SALES analysis using lead and leg function.
SELECT*,
tota_amount_order - previous_month AS TOTAL,
CONCAT( ROUND( CAST((tota_amount_order - previous_month) AS FLOAT)/previous_month*100,2),'%') AS PERCENTAGE
FROM(
	SELECT
		MONTH(OrderDate) as month_order,
		SUM(Sales) AS tota_amount_order,
		LAG(SUM(Sales)) OVER(Order BY MONTH(OrderDate)) as previous_month
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
	)t