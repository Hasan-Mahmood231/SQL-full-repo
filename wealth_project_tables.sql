--Project: Wealth & Investment Management System
--  DATABASE CREATION
CREATE DATABASE WealthManagementDB;
GO
USE WealthManagementDB;
GO

-- 2. TABLE DEFINITIONS (Normalized to 3NF)

-- Table 1: Users (Businessman Profile)
CREATE TABLE Users (
    User_ID INT PRIMARY KEY IDENTITY(1,1),
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Contact_Number VARCHAR(20),
    Created_At DATETIME DEFAULT GETDATE()
);

-- Table 2: Asset_Categories (Grouping Logic)
CREATE TABLE Asset_Categories (
    Asset_Type_ID INT PRIMARY KEY IDENTITY(1,1),
    Asset_Category_Name VARCHAR(50) NOT NULL,
    Risk_Level VARCHAR(20) -- Low, Medium, High
);

-- Table 3: Investments (Main Portfolio)
CREATE TABLE Investments (
    Investment_ID INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT FOREIGN KEY REFERENCES Users(User_ID),
    Asset_Type_ID INT FOREIGN KEY REFERENCES Asset_Categories(Asset_Type_ID),
    Investment_Name VARCHAR(100),
    Purchase_Price DECIMAL(15,2),
    Purchase_Date DATE DEFAULT CAST(GETDATE() AS DATE)
);

-- Table 4: Income_Transactions (Profit Logs)
CREATE TABLE Income_Transactions (
    Income_Transaction_ID INT PRIMARY KEY IDENTITY(1,1),
    Investment_ID INT FOREIGN KEY REFERENCES Investments(Investment_ID),
    Amount DECIMAL(15,2) NOT NULL,
    Date_Received DATE NOT NULL,
    Currency_Type VARCHAR(10) DEFAULT 'PKR'
);

-- Table 5: Expense_Categories (Cost Management)
CREATE TABLE Expense_Categories (
    Category_ID INT PRIMARY KEY IDENTITY(1,1),
    Category_Name VARCHAR(50) NOT NULL,
    Tax_Deductible_Status BIT DEFAULT 0, -- 1 for Yes, 0 for No
    Is_Business_Related BIT DEFAULT 1
);

-- Table 7: Payment_Methods (Lookup Table)
CREATE TABLE Payment_Methods (
    Payment_Method_ID INT PRIMARY KEY IDENTITY(1,1),
    Method_Name VARCHAR(50) NOT NULL
);

-- Table 6: Expense_Transactions (Spending Logs)
CREATE TABLE Expense_Transactions (
    Expense_ID INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT FOREIGN KEY REFERENCES Users(User_ID),
    Category_ID INT FOREIGN KEY REFERENCES Expense_Categories(Category_ID),
    Payment_Method_ID INT FOREIGN KEY REFERENCES Payment_Methods(Payment_Method_ID),
    Expense_Amount DECIMAL(15,2) NOT NULL,
    Expense_Date DATE NOT NULL
);

-- Table 8: Market_Value_Logs (Tracking Growth)
CREATE TABLE Market_Value_Logs (
    Log_ID INT PRIMARY KEY IDENTITY(1,1),
    Investment_ID INT FOREIGN KEY REFERENCES Investments(Investment_ID),
    Recorded_Market_Price DECIMAL(15,2),
    Log_Date DATE DEFAULT CAST(GETDATE() AS DATE)
);

-- Table 9: Retail_Store_Details (Specific for Retail Marts)
CREATE TABLE Retail_Store_Details (
    Store_ID INT PRIMARY KEY IDENTITY(1,1),
    Investment_ID INT FOREIGN KEY REFERENCES Investments(Investment_ID),
    Store_Location VARCHAR(150),
    Manager_Name VARCHAR(100),
    Number_of_Employees INT
);

-- Table 10: Financial_Reports (Decision Making)
CREATE TABLE Financial_Reports (
    Report_ID INT PRIMARY KEY IDENTITY(1,1),
    User_ID INT FOREIGN KEY REFERENCES Users(User_ID),
    Start_Date DATE,
    End_Date DATE,
    Net_Profit_Loss DECIMAL(15,2)
);
GO

-- 3. DATA INSERTION (6 Rows Per Table)

INSERT INTO Users (Full_Name, Email, Contact_Number) VALUES
('Hassan Ali', 'hassan@gmail.com', '0301-1111111'),
('Aman Khan', 'aman@gmail.com', '0302-2222222'),
('Iqbal Ahmed', 'iqbal@gmail.com', '0303-3333333'),
('Wajid Hussain', 'wajid@gmail.com', '0304-4444444'),
('salih khan', 'abeera@gmail.com', '0305-5555555'),
('ali Khan', 'nabeha@gmail.com', '0306-6666666');

INSERT INTO Asset_Categories (Asset_Category_Name, Risk_Level) VALUES
('Real Estate', 'Low'),
('Stock Market', 'Medium'),
('Cryptocurrency', 'High'),
('Retail Business', 'Medium'),
('Fixed Salary', 'Low'),
('Gold', 'Low');

INSERT INTO Investments (User_ID, Asset_Type_ID, Investment_Name, Purchase_Price) VALUES
(1, 1, 'Commercial Plaza', 25000000.00),
(2, 2, 'Tech Shares', 500000.00),
(3, 3, 'Bitcoin', 1200000.00),
(4, 4, 'Retail Mart', 3500000.00),
(5, 1, 'Residential Plot', 4500000.00),
(6, 2, 'Bank Shares', 800000.00);

INSERT INTO Income_Transactions (Investment_ID, Amount, Date_Received) VALUES
(1, 500000.00, '2024-01-10'),
(2, 120000.00, '2024-01-15'),
(3, 300000.00, '2024-02-01'),
(4, 200000.00, '2024-02-10'),
(5, 150000.00, '2024-03-01'),
(1, 500000.00, '2024-02-10');

INSERT INTO Expense_Categories (Category_Name, Tax_Deductible_Status, Is_Business_Related) VALUES
('Office Rent', 1, 1),
('Electricity', 1, 1),
('Staff Salary', 1, 1),
('Personal Shopping', 0, 0),
('Property Tax', 1, 1),
('Trading Fees', 0, 1);

INSERT INTO Payment_Methods (Method_Name) VALUES
('Cash'), ('Bank Transfer'), ('Credit Card'), ('Crypto Wallet'), ('Cheque'), ('Digital Wallet');

INSERT INTO Expense_Transactions (User_ID, Category_ID, Payment_Method_ID, Expense_Amount, Expense_Date) VALUES
(1, 1, 2, 80000.00, '2024-01-05'),
(2, 3, 2, 120000.00, '2024-01-10'),
(3, 2, 1, 30000.00, '2024-02-01'),
(4, 4, 3, 40000.00, '2024-02-05'),
(5, 5, 2, 25000.00, '2024-03-10'),
(6, 6, 4, 5000.00, '2024-03-12');

INSERT INTO Market_Value_Logs (Investment_ID, Recorded_Market_Price, Log_Date) VALUES
(1, 27000000.00, '2024-03-01'),
(3, 1500000.00, '2024-03-01'),
(2, 550000.00, '2024-03-01'),
(4, 3600000.00, '2024-03-01'),
(5, 4800000.00, '2024-03-01'),
(6, 750000.00, '2024-03-01');

INSERT INTO Retail_Store_Details (Investment_ID, Store_Location, Manager_Name, Number_of_Employees) VALUES
(4, 'Gulshan Karachi', 'Ali Raza', 15),
(4, 'DHA Lahore', 'Usman Khan', 20),
(4, 'F-7 Islamabad', 'Sara Bibi', 10),
(4, 'Saddar Rawalpindi', 'Hamza Ali', 12),
(4, 'Peshawar Road', 'Kamran Khan', 8),
(4, 'University Road', 'Zainab Noor', 14);

INSERT INTO Financial_Reports (User_ID, Start_Date, End_Date, Net_Profit_Loss) VALUES
(1, '2024-01-01', '2024-03-31', 1200000.00),
(2, '2024-01-01', '2024-03-31', 450000.00),
(3, '2024-01-01', '2024-03-31', 280000.00),
(4, '2024-01-01', '2024-03-31', 900000.00),
(5, '2024-01-01', '2024-03-31', 150000.00),
(6, '2024-01-01', '2024-03-31', 600000.00);
GO


SELECT 
*
FROM Financial_Reports