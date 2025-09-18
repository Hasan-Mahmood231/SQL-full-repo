--store procedure is a way of storing one query for multiple usecase.

CREATE PROCEDURE OrderAggregate AS 
BEGIN
--this is query we'll use it multiple time so store by procedure.
SELECT
SalesPersonID,
MAX(OrderDate) AS max_order
FROM Sales.OrdersArchive
GROUP BY SalesPersonID
END
--now we can use it using this below Commond.
EXECUTE OrderAggregate



--now we can dynamicaly check the country results.
--alter work only on prebuild query
ALTER PROCEDURE country  @country NVARCHAR(34)
AS
BEGIN

DECLARE @Score int, @cun varchar
	SELECT
	@Score = c.Score,
	@cun = c.Country
	FROM Sales.Customers c
	WHERE c.Country = @country
print 'the score is ' + CAST(@score AS VARCHAR) ;
print 'the country is ' + @cun;
	
END

EXECUTE country  @country = 'USA'


