-- select all col where the data accending order.
SELECT
	Country,
	sum(Score) AS Aggergated_score
FROM Sales.Customers
--WHERE Country = 'USA'
--ORDER BY Score DESC
GROUP BY Country
