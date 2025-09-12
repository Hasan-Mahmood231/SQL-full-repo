--the DATEADD() function update and change the date values.
SELECT
CreationTime,
CAST( DATEADD(year,3,CreationTime)  as date)AS Next_year, -- the CAST function change the formate to date.
cast(DATEADD(month,4,CreationTime) AS date) as Update_month
FROM Sales.Orders


SELECT
DATEDIFF(Year,BirthDate,GETDATE()) as NEW_DATE,
DATEDIFF(MONTH,BirthDate,GETDATE()) as NEW_DATE,
DATEDIFF(DAY,BirthDate,GETDATE()) AS DAYS,
DATEDIFF(MONTH,BirthDate,O.OrderDate) AS NN
FROM Sales.Employees AS E
FULL JOIN Sales.Orders AS O
ON O.CustomerID = E.EmployeeID

 
-- find in how many days product delever.
SELECT
O.OrderDate,
O.ShipDate,
DATEDIFF(DAY,OrderDate,ShipDate)
FROM Sales.Orders as O

--ISNULL() repalce the null values.
SELECT 
*,
ISNULL(BillAddress,'NA') AS address
FROM Sales.Orders

---COALESCE check more than one col for null values.
SELECT 
ShipAddress,
BillAddress,
COALESCE(ShipAddress,BillAddress,'0') as fill_data
FROM Sales.Orders

--Question : merge the first and last name of the customer.
SELECT
C.CustomerID,
C.FirstName,
C.LastName,
C.Score,
C.FirstName + ' ' + ISNULL(C.LastName,'') AS FULL_NAME  --we say if last name is not presetn just leave empty.and show first name.
FROM Sales.Customers AS C


--NULLIF() return null where condition not match.
SELECT
*,
NULLIF(Quantity,0) final_product
FROM Sales.Orders

--IS NULL return TRUE if its null otherwise FALSE.
--Q : return those customer whos last name is null.
SELECT *
FROM Sales.Customers AS C
WHERE C.LastName IS NULL