SELECT 
* 
FROM Sales.Customers


CREATE TABLE Sales.Pdata(
f_name VARCHAR(34),
l_name VARCHAR(34),
phon_no INT,
)


ALTER TABLE sales.Pdata add CNIC VARCHAR(23);
SELECT * FROM Sales.Pdata

ALTER TABLE Sales.pdata drop column CNIC