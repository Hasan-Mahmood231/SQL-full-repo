

ALTER PROCEDURE dd @country NVARCHAR(34)
AS
BEGIN
	SELECT*
	FROM Sales.Customers c
	WHERE c.Country = @country
END