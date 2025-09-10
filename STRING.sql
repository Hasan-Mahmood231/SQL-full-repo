SELECT 
*,
SUBSTRING(CAST(CreationTime AS varchar),1,20)	
--CAST(CreationTime AS varchar) this is numeric col but we convert into string then perform the SUBSTRING operation.
--SUBSTRING(CreationTime,20,LEN(CreationTime)) AS Time_fit

FROM Sales.Orders


--Round numbers.
SELECT 
32.4434,
ROUND(32.4434,2) AS ROUND_1, --32.4400
ROUND(32.4434,1) AS ROUND_2  --32.4000