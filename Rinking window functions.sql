-- Select the row based on highest sale.
SELECT
* ,
ROW_NUMBER()	OVER(Order BY Sales DESC) NewRow,
RANK()			OVER(ORDER BY Sales DESC) RankRow,
DENSE_RANK()	OVER(ORDER BY Sales DESC) DenRank

FROM Sales.Orders


--find lowest 2 customer based on sales.
SELECT*
FROM(
	SELECT*,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) orderd_sales
	FROM Sales.Orders
)t WHERE orderd_sales <= 2 -- ->complete


--find lowest 2 customer based on their total sale. 
SELECT DISTINCT*
FROM(
	SELECT
	CustomerID,
	Sales,
	SUM(Sales) OVER( PARTITION BY CustomerID) Customer_total_sale,
	DENSE_RANK() OVER(ORDER BY CustomerID) RinkBased_col
	FROM Sales.Orders
)t WHERE RinkBased_col <= 2

--Divide all order into 3 category. highest to lowest. and show high,medium & low accordingly.
SELECT*,
CASE WHEN groups = 1THEN 'high'
	 WHEN groups = 2 THEN 'medium'
	 WHEN groups = 3 THEN 'low'
END Performance
FROM(
		SELECT
		OrderID,
		Sales,
		NTILE(3) OVER(ORDER BY Sales DESC) groups
		FROM Sales.Orders
	)t		-- -> Solve.


-- make col where status delivered and sales more then 50 -> (high order) otherwirse -> (low order)
SELECT
*,
CASE
	WHEN OrderStatus = 'Shipped' AND Sales >40 THEN 'High order'
	WHEN OrderStatus = 'Delivered' AND Sales >40 THEN 'Low order'
	ELSE 'Poor order'
END Order_final
FROM Sales.OrdersArchive

--find product whos lie below 40% sale.
SELECT *,
CONCAT(Order_Per * 100,'%')  AS Percentage_of_order
FROM(
	SELECT *,
    CUME_DIST() OVER(Order BY Sales) AS Order_Per
	FROM Sales.Orders
	)t
WHERE Order_Per <= 0.4