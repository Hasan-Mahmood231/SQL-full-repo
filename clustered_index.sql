--Trigger 
CREATE TABLE Sales.EmployLoge(
LogID int identity(1,1) primary key,
EmployID int,
LogMessage varchar(200),
LogDate date
)

--create tragger on EmployLoge table
CREATE TRIGGER OrderFinder ON Sales.Employees
AFTER INSERT
AS 
BEGIN
	INSERT INTO Sales.EmployLoge(EmployID,LogMessage,LogDate)
	SELECT
		EmployID,
		'New employ added'+CAST(EmployID AS VARCHAR),
		GETDATE()
		FROM INSERTED
END

SELECT* FROM Sales.EmployLoge

--INSERT INTO Sales.Employees(2, 'HASSAN', 'mahmood', 'developer', '1999-03-12', 'M', 322222);
INSERT INTO Sales.Employees
(EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary)
VALUES
(90, 'HASSAN', 'mahmood', 'developer', '1999-03-12', 'M', 322222);




