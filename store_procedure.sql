SELECT *
FROM Sales.Customers c
WHERE c.Country = 'USA'
--now this is simple query to take row of matching country.
 

--store procedure.
CREATE PROCEDURE CountryFinder AS 
BEGIN 
	SELECT*
	FROM Sales.Customers O
	WHERE O.Country = 'USA'
END

EXEC CountryFinder

--now we want to make it dynamic to find country.
ALTER PROCEDURE CountryFinder @co NVARCHAR(34)
AS 
BEGIN 
	SELECT*
	FROM Sales.Customers O
	WHERE O.Country = @co

DECLARE @count INT, @score FLOAT
	SELECT
	@count = COUNT(*),
	@score = AVG(Score)
	FROM Sales.Customers

	Print 'the score of the '+@co+' is almost ' + @count
END	--dynamic now

EXEC CountryFinder @co = 'duby'






END
