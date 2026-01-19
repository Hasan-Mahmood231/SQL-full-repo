USE WealthManagementDB;

-- *********************************************************************************
-- 1. STORED PROCEDURES
-- *********************************************************************************

-- PROCEDURE: AddNewIncome
DROP PROCEDURE IF EXISTS sp_AddNewIncome;
DELIMITER //
CREATE PROCEDURE sp_AddNewIncome(
    IN p_InvestmentID INT,
    IN p_Amount DECIMAL(15,2),
    IN p_DateReceived DATE
)
BEGIN
    INSERT INTO Income_Transactions (Investment_ID, Amount, Date_Received)
    VALUES (p_InvestmentID, p_Amount, p_DateReceived);
    
    SELECT CONCAT('Income recorded for Investment ID: ', p_InvestmentID) AS Message;
END //
DELIMITER ;


-- PROCEDURE: GenerateMonthlyReport
DROP PROCEDURE IF EXISTS sp_GenerateMonthlyReport;
DELIMITER //
CREATE PROCEDURE sp_GenerateMonthlyReport(
    IN p_UserID INT,
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    DECLARE v_TotalIncome DECIMAL(15,2);
    DECLARE v_TotalExpense DECIMAL(15,2);

    -- Calculate total income
    SELECT IFNULL(SUM(Amount), 0) INTO v_TotalIncome
    FROM Income_Transactions IT
    JOIN Investments I ON IT.Investment_ID = I.Investment_ID
    WHERE I.User_ID = p_UserID AND IT.Date_Received BETWEEN p_StartDate AND p_EndDate;

    -- Calculate total expenses
    SELECT IFNULL(SUM(Expense_Amount), 0) INTO v_TotalExpense
    FROM Expense_Transactions
    WHERE User_ID = p_UserID AND Expense_Date BETWEEN p_StartDate AND p_EndDate;

    -- Insert results into the Financial_Reports table
    INSERT INTO Financial_Reports (User_ID, Start_Date, End_Date, Net_Profit_Loss)
    VALUES (p_UserID, p_StartDate, p_EndDate, (v_TotalIncome - v_TotalExpense));
    
    SELECT 'Financial Report Generated and Saved' AS Status;
END //
DELIMITER ;


-- PROCEDURE: UpdateRetailStoreStaff
DROP PROCEDURE IF EXISTS sp_UpdateRetailStoreStaff;
DELIMITER //
CREATE PROCEDURE sp_UpdateRetailStoreStaff(
    IN p_StoreID INT,
    IN p_NewEmployeeCount INT,
    IN p_NewManager VARCHAR(100)
)
BEGIN
    UPDATE Retail_Store_Details
    SET Number_of_Employees = p_NewEmployeeCount,
        Manager_Name = p_NewManager
    WHERE Store_ID = p_StoreID;
    
    SELECT 'Retail store operational details updated' AS Status;
END //
DELIMITER ;


-- *********************************************************************************
-- 2. VIEWS
-- *********************************************************************************

-- VIEW: vw_InvestmentROI
DROP VIEW IF EXISTS vw_InvestmentROI;
CREATE VIEW vw_InvestmentROI AS
SELECT 
    I.Investment_Name,
    AC.Asset_Category_Name,
    I.Purchase_Price,
    IFNULL(SUM(IT.Amount), 0) AS Total_Earnings,
    (IFNULL(SUM(IT.Amount), 0) - I.Purchase_Price) AS Net_Growth
FROM Investments I
JOIN Asset_Categories AC ON I.Asset_Type_ID = AC.Asset_Type_ID
LEFT JOIN Income_Transactions IT ON I.Investment_ID = IT.Investment_ID
GROUP BY I.Investment_ID, I.Investment_Name, AC.Asset_Category_Name, I.Purchase_Price;


-- VIEW: vw_BusinessVsPersonalExpenses
DROP VIEW IF EXISTS vw_BusinessVsPersonalExpenses;
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


-- VIEW: vw_CryptoRiskAnalysis
DROP VIEW IF EXISTS vw_CryptoRiskAnalysis;
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