------------------------DATETIME--------------------
--DAY,MONTH,YEAR - > Directly return their values from date col.
SELECT
OrderID,
CreationTime,
--EOMONTH().
DAY(EOMONTH(CreationTime)) AS LAST_DAY, --extract the last date of the month.

--this is the way of extracting verious factore from data using DATEPART(year,value)
DATEPART(YEAR,CreationTime) YEAR_dp,
DATEPART(WEEK,CreationTime) WEEK_dp,
DATEPART(HOUR,CreationTime) Hours_dp,
--this is way of extracting verious factore from data usign DAY,MONTH,YEAR -> 
DAY(CreationTime) Day,
YEAR(CreationTime) Year,
MONTH(CreationTime) Month,
--this is way of extracting verious factore (Name) from data in string form usign DAY,MONTH,YEAR -> DATENAME(VAL,DATE)
DATENAME(Month,CreationTime) AS month_withName,
DATENAME(WEEKDAY,CreationTime),

--DATETRUNC()-> we can reset the part of date we want.
DATETRUNC(MONTH,CreationTime) AS SEC -- we can put	DAY,WEEK,MONTH,YEAR etc.
FROM Sales.Orders