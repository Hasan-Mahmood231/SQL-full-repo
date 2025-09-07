SELECT
	Country,
	AVG(Score) AS Avg_score
FROM Sales.Customers
	WHERE Score > 0
	GROUP BY Country
	HAVING AVG(Score) > 430

	---Creat new tale with some col and then print it (DDL)---
CREATE TABLE Future_sale
(
Products VARCHAR(30),
product_id int,
sale_expect int
)

--Now want to remove the Products from Future_sale. -> (DDL)Alter commond.
ALTER TABLE Future_sale
DROP COLUMN Products	--successfully run.

--Now want to add the products to Future_sale -> (DDL) Alter commond.
ALTER TABLE Future_sale
ADD Products VARCHAR(30) NOT NULL --successfull run.


-- Now add the data into Future_sale table.
INSERT INTO Future_sale (product_id,sale_expect,Products)
VALUES
	(23,9000,'skin care'),
	(24,12000, 'hair oile')	--successfull run.

SELECT *
FROM Future_sale
