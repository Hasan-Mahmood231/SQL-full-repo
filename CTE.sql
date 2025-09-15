--find total sale per customer.
WITH Ttotal_Sale_cte AS(	--cte
	SELECT
		CustomerID,
		SUM(Sales) AS Total_Sale
	FROM Sales.Orders
	GROUP BY CustomerID
),
Last_order AS 
(
	SELECT 
	CustomerID,
	MAX(OrderDate) as Last_order_Date
	FROM Sales.Orders
	GROUP BY CustomerID
),
--now rink customer based on total sale (nested cte)
Rank_cte AS 
(
	SELECT
	CustomerID,
	Total_Sale,
	RANK() OVER(ORDER BY Total_Sale DESC) AS Rinked_customer
	FROM Ttotal_Sale_cte	--come from parent CTE so this is nested cte.
)

--now devide the customer in sigmentation based on total sale.
,Sigment_cte AS 
(
SELECT*,
	CASE 
		 WHEN Total_Sale > 100 THEN 'High'
		 WHEN Total_Sale < 100 THEN 'LOW'
		 ELSE 'POOR '
	END Quality
FROM Ttotal_Sale_cte
)











SELECT
C.CustomerID,		--col_1
C.FirstName,		--col_2
tc.Total_Sale,		--access the total sale using cte. --col_3
ls.Last_order_Date	--access the last order using cte. --col_4
,rc.Rinked_customer --access the rink using cte. --col_5
,sc.Quality			--make the segmentation usin cte --col_6
FROM Sales.Customers AS C
LEFT JOIN Ttotal_Sale_cte AS tc		-- use the cte to git the total sale for each customer.
ON C.CustomerID = tc.CustomerID
LEFT JOIN Last_order AS ls
ON C.CustomerID = ls.CustomerID
LEFT JOIN Rank_cte AS rc
ON C.CustomerID = rc.CustomerID
LEFT JOIN Sigment_cte AS sc
ON C.CustomerID = sc.CustomerID