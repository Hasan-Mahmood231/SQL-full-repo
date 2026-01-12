/*
   PROCEDURE: AddNewIncome
   Purpose: Automatically links a profit entry to an investment and updates 
            the businessman's real-time income history[cite: 48, 49].
*/
CREATE PROCEDURE sp_AddNewIncome
    @InvestmentID INT,
    @Amount DECIMAL(15,2),
    @DateReceived DATE,
    @Currency VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    -- Inserting the transaction into the income table [cite: 185]
    INSERT INTO Income_Transactions (Investment_ID, Amount, Date_Received)
    VALUES (@InvestmentID, @Amount, @DateReceived);
    
    PRINT 'Income transaction successfully recorded for Investment ID: ' + CAST(@InvestmentID AS VARCHAR);
END;
GO




/*
   PROCEDURE: GenerateMonthlyReport
   Purpose: Automates the calculation of Net Profit/Loss for a specific user 
            over a given date range[cite: 71, 73].
*/
CREATE PROCEDURE sp_GenerateMonthlyReport
    @UserID INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    DECLARE @TotalIncome DECIMAL(15,2);
    DECLARE @TotalExpense DECIMAL(15,2);

    -- Calculate total income from all investments for this user [cite: 15, 185]
    SELECT @TotalIncome = ISNULL(SUM(Amount), 0)
    FROM Income_Transactions IT
    JOIN Investments I ON IT.Investment_ID = I.Investment_ID
    WHERE I.User_ID = @UserID AND IT.Date_Received BETWEEN @StartDate AND @EndDate;

    -- Calculate total expenses for this user [cite: 15, 195]
    SELECT @TotalExpense = ISNULL(SUM(Expense_Amount), 0)
    FROM Expense_Transactions
    WHERE User_ID = @UserID AND Expense_Date BETWEEN @StartDate AND @EndDate;

    -- Insert results into the Financial_Reports table [cite: 71, 148]
    INSERT INTO Financial_Reports (User_ID, Start_Date, End_Date, Net_Profit_Loss)
    VALUES (@UserID, @StartDate, @EndDate, (@TotalIncome - @TotalExpense));
    
    PRINT 'Financial Report Generated: Net Profit/Loss calculated and saved.';
END;
GO



/*
   PROCEDURE: UpdateRetailStoreStaff
   Purpose: Manages operational details of physical shops separately from 
            the financial investment data[cite: 67, 146].
*/
CREATE PROCEDURE sp_UpdateRetailStoreStaff
    @StoreID INT,
    @NewEmployeeCount INT,
    @NewManager VARCHAR(100)
AS
BEGIN
    UPDATE Retail_Store_Details
    SET Number_of_Employees = @NewEmployeeCount,
        Manager_Name = @NewManager
    WHERE Store_ID = @StoreID;
    
    PRINT 'Retail store operational details updated successfully.';
END;
GO


-- ***********************************************NOW CREATE THE VIEW******************************************************************
/*
   1. VIEW: vw_InvestmentROI
   Purpose: Shows the businessman exactly which assets (Crypto, Retail, etc.) 
            are profitable by comparing Purchase Price to Total Income[cite: 20, 28].
*/
CREATE VIEW vw_InvestmentROI AS
SELECT 
    I.Investment_Name,
    AC.Asset_Category_Name,
    I.Purchase_Price,
    ISNULL(SUM(IT.Amount), 0) AS Total_Earnings,
    (ISNULL(SUM(IT.Amount), 0) - I.Purchase_Price) AS Net_Growth
FROM Investments I
JOIN Asset_Categories AC ON I.Asset_Type_ID = AC.Asset_Type_ID
LEFT JOIN Income_Transactions IT ON I.Investment_ID = IT.Investment_ID
GROUP BY I.Investment_Name, AC.Asset_Category_Name, I.Purchase_Price;
GO

/*
   2. VIEW: vw_BusinessVsPersonalExpenses
   Purpose: Separates lifestyle spending from business costs to provide 
            financial clarity[cite: 15, 53].
*/
CREATE VIEW vw_BusinessVsPersonalExpenses AS
SELECT 
    U.Full_Name,
    EC.Category_Name,
    CASE WHEN EC.Is_Business_Related = 1 THEN 'Business' ELSE 'Personal' END AS Spending_Type,
    ET.Expense_Amount,
    ET.Expense_Date
FROM Expense_Transactions ET
JOIN Users U ON ET.User_ID = U.User_ID
JOIN Expense_Categories EC ON ET.Category_ID = EC.Category_ID;
GO
SELECT * FROM vw_BusinessVsPersonalExpenses;

/*
   3. VIEW: vw_CryptoRiskAnalysis
   Purpose: Filters high-performing but high-risk assets like Cryptocurrency 
            for specialized monitoring[cite: 11, 41].
*/
CREATE VIEW vw_CryptoRiskAnalysis AS
SELECT 
    I.Investment_Name,
    ML.Recorded_Market_Price AS Current_Value,
    ML.Log_Date AS Last_Checked,
    AC.Risk_Level
FROM Investments I
JOIN Asset_Categories AC ON I.Asset_Type_ID = AC.Asset_Type_ID
JOIN Market_Value_Logs ML ON I.Investment_ID = ML.Investment_ID
WHERE AC.Asset_Category_Name = 'Cryptocurrency';
GO
