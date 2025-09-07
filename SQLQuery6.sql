SELECT
	Country,
	AVG(Score) AS Avg_score
FROM Sales.Customers
	WHERE Score > 0
	GROUP BY Country
	HAVING AVG(Score) > 430