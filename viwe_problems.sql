--check the view which is ready
SELECT*
FROM Sales.CustomerDetail

IF OBJECT_ID('dbo.CustomerDetail', 'V') IS NOT NULL
    DROP VIEW dbo.CustomerDetail;


