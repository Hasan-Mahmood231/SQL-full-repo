--find female employ whos selery's higher then male.
SELECT*
FROM(
	SELECT*
	FROM Sales.Employees as e
	WHERE e.Gender = 'F'
	)t
WHERE t.Salary > ANY (SELECT Salary FROM Sales.Employees AS e1 WHERE e1.Gender = 'M')

--SELECT Salary FROM Sales.Employees AS e1 WHERE e1.Gender = 'M' this is seperate tbl and we comapir by slery.
