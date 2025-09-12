--CASE is used in sql for generating the values from data. it help us in making simple the data.
SELECT*,

CASE
	WHEN Sales > 30 THEN 1	--CONDITIONS
	ELSE 0
END SALE_SEPERATION,

--for finding the delivered order.
CASE 
	WHEN OrderStatus = 'Delivered' THEN 1
	ELSE 0
END ORDER_DETAIL

FROM Sales.Orders