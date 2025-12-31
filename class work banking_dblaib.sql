SELECT 
*
FROM BankingDB.dbo.BankMaster

SELECT *
FROM BankingDB.dbo.Transactions

SELECT *
FROM BankingDB.dbo.Customers

USE BankingDB;
GO


--CUSTOMER WHO MADE TRANSECTION OUR SPECIFIC AMOUNT.
SELECT *
FROM BankingDB.dbo.Customers AS C
LEFT JOIN BankingDB.dbo.Transactions AS T
ON C.CustomerID = T.CustomerID
--Now let take the threshould amount of 150.
WHERE T.Amount > 150


--List of dormant accounts (no transaction in last 6 months).
SELECT *
FROM BankingDB.dbo.BankMaster AS B
WHERE B.LastTransactionDate < '2025-5-1'


--Show total balance per customer (using GROUP BY).
SELECT 
    FullName, 
    SUM(Balance) AS TotalCombinedBalance
FROM BankingDB.dbo.BankMaster
GROUP BY FullName;

--Detect suspicious transactions (amount + frequency).
SELECT FullName, AccountNumber, LastTransactionAmount, City
FROM BankMaster
WHERE LastTransactionAmount > 15000; -- This is our "Suspicious" Threshold

--Top 5 customers by total deposits.
SELECT TOP 5 FullName, AccountNumber, Balance
FROM BankMaster
ORDER BY Balance DESC; -- DESC means Highest to Lowest





SELECT 
    B.FullName, 
    B.Balance AS BankBalance, 
    O.OrderID, 
    O. AS OrderCost
FROM BankingDB.dbo.BankMaster AS B
JOIN SalesDB.Sales.Orders AS O
ON B.FullName = O.CustomerName -- Joining on Name
WHERE O.TotalAmount > B.Balance;