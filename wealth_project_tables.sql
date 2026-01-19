-- 1. DATABASE CREATION
CREATE DATABASE IF NOT EXISTS WealthManagementDB;
USE WealthManagementDB;

-- 2. DROP TABLES IN REVERSE ORDER (To avoid Foreign Key Errors)
-- In MySQL, we drop child tables first.
DROP TABLE IF EXISTS Financial_Reports;
DROP TABLE IF EXISTS Retail_Store_Details;
DROP TABLE IF EXISTS Market_Value_Logs;
DROP TABLE IF EXISTS Expense_Transactions;
DROP TABLE IF EXISTS Payment_Methods;
DROP TABLE IF EXISTS Expense_Categories;
DROP TABLE IF EXISTS Income_Transactions;
DROP TABLE IF EXISTS Investments;
DROP TABLE IF EXISTS Asset_Categories;
DROP TABLE IF EXISTS Users;

-- 3. TABLE DEFINITIONS (MySQL Syntax)

CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Contact_Number VARCHAR(20),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Asset_Categories (
    Asset_Type_ID INT PRIMARY KEY AUTO_INCREMENT,
    Asset_Category_Name VARCHAR(50) NOT NULL,
    Risk_Level VARCHAR(20)
);

CREATE TABLE Investments (
    Investment_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Asset_Type_ID INT,
    Investment_Name VARCHAR(100),
    Purchase_Price DECIMAL(15,2),
    Purchase_Date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Asset_Type_ID) REFERENCES Asset_Categories(Asset_Type_ID)
);

CREATE TABLE Income_Transactions (
    Income_Transaction_ID INT PRIMARY KEY AUTO_INCREMENT,
    Investment_ID INT,
    Amount DECIMAL(15,2) NOT NULL,
    Date_Received DATE NOT NULL,
    Currency_Type VARCHAR(10) DEFAULT 'PKR',
    FOREIGN KEY (Investment_ID) REFERENCES Investments(Investment_ID)
);

CREATE TABLE Expense_Categories (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(50) NOT NULL,
    Tax_Deductible_Status TINYINT(1) DEFAULT 0,
    Is_Business_Related TINYINT(1) DEFAULT 1
);

CREATE TABLE Payment_Methods (
    Payment_Method_ID INT PRIMARY KEY AUTO_INCREMENT,
    Method_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Expense_Transactions (
    Expense_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Category_ID INT,
    Payment_Method_ID INT,
    Expense_Amount DECIMAL(15,2) NOT NULL,
    Expense_Date DATE NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Category_ID) REFERENCES Expense_Categories(Category_ID),
    FOREIGN KEY (Payment_Method_ID) REFERENCES Payment_Methods(Payment_Method_ID)
);

CREATE TABLE Market_Value_Logs (
    Log_ID INT PRIMARY KEY AUTO_INCREMENT,
    Investment_ID INT,
    Recorded_Market_Price DECIMAL(15,2),
    Log_Date DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (Investment_ID) REFERENCES Investments(Investment_ID)
);

CREATE TABLE Retail_Store_Details (
    Store_ID INT PRIMARY KEY AUTO_INCREMENT,
    Investment_ID INT,
    Store_Location VARCHAR(150),
    Manager_Name VARCHAR(100),
    Number_of_Employees INT,
    FOREIGN KEY (Investment_ID) REFERENCES Investments(Investment_ID)
);

CREATE TABLE Financial_Reports (
    Report_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Start_Date DATE,
    End_Date DATE,
    Net_Profit_Loss DECIMAL(15,2),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- 4. DATA INSERTION

INSERT INTO Users (Full_Name, Email, Contact_Number) VALUES
('Hassan Ali', 'hassan@gmail.com', '0301-1111111'),
('Aman Khan', 'aman@gmail.com', '0302-2222222'),
('Iqbal Ahmed', 'iqbal@gmail.com', '0303-3333333'),
('Wajid Hussain', 'wajid@gmail.com', '0304-4444444'),
('Salih Khan', 'salih@gmail.com', '0305-5555555'),
('Ali Khan', 'ali@gmail.com', '0306-6666666');

INSERT INTO Asset_Categories (Asset_Category_Name, Risk_Level) VALUES
('Real Estate', 'Low'), ('Stock Market', 'Medium'), ('Cryptocurrency', 'High'),
('Retail Business', 'Medium'), ('Fixed Salary', 'Low'), ('Gold', 'Low');

INSERT INTO Investments (User_ID, Asset_Type_ID, Investment_Name, Purchase_Price) VALUES
(1, 1, 'Commercial Plaza', 25000000.00),
(2, 2, 'Tech Shares', 500000.00),
(3, 3, 'Bitcoin', 1200000.00),
(4, 4, 'Retail Mart', 3500000.00),
(5, 1, 'Residential Plot', 4500000.00),
(6, 2, 'Bank Shares', 800000.00);

INSERT INTO Income_Transactions (Investment_ID, Amount, Date_Received) VALUES
(1, 500000.00, '2024-01-10'), (2, 120000.00, '2024-01-15'),
(3, 300000.00, '2024-02-01'), (4, 200000.00, '2024-02-10'),
(5, 150000.00, '2024-03-01'), (1, 500000.00, '2024-02-10');

INSERT INTO Expense_Categories (Category_Name, Tax_Deductible_Status, Is_Business_Related) VALUES
('Office Rent', 1, 1), ('Electricity', 1, 1), ('Staff Salary', 1, 1),
('Personal Shopping', 0, 0), ('Property Tax', 1, 1), ('Trading Fees', 0, 1);

INSERT INTO Payment_Methods (Method_Name) VALUES
('Cash'), ('Bank Transfer'), ('Credit Card'), ('Crypto Wallet'), ('Cheque'), ('Digital Wallet');

INSERT INTO Expense_Transactions (User_ID, Category_ID, Payment_Method_ID, Expense_Amount, Expense_Date) VALUES
(1, 1, 2, 80000.00, '2024-01-05'), (2, 3, 2, 120000.00, '2024-01-10'),
(3, 2, 1, 30000.00, '2024-02-01'), (4, 4, 3, 40000.00, '2024-02-05'),
(5, 5, 2, 25000.00, '2024-03-10'), (6, 6, 4, 5000.00, '2024-03-12');

INSERT INTO Market_Value_Logs (Investment_ID, Recorded_Market_Price, Log_Date) VALUES
(1, 27000000.00, '2024-03-01'), (3, 1500000.00, '2024-03-01'),
(2, 550000.00, '2024-03-01'), (4, 3600000.00, '2024-03-01'),
(5, 4800000.00, '2024-03-01'), (6, 750000.00, '2024-03-01');

INSERT INTO Retail_Store_Details (Investment_ID, Store_Location, Manager_Name, Number_of_Employees) VALUES
(4, 'Gulshan Karachi', 'Ali Raza', 15), (4, 'DHA Lahore', 'Usman Khan', 20),
(4, 'F-7 Islamabad', 'Sara Bibi', 10), (4, 'Saddar Rawalpindi', 'Hamza Ali', 12),
(4, 'Peshawar Road', 'Kamran Khan', 8), (4, 'University Road', 'Zainab Noor', 14);

INSERT INTO Financial_Reports (User_ID, Start_Date, End_Date, Net_Profit_Loss) VALUES
(1, '2024-01-01', '2024-03-31', 1200000.00), (2, '2024-01-01', '2024-03-31', 450000.00),
(3, '2024-01-01', '2024-03-31', 280000.00), (4, '2024-01-01', '2024-03-31', 900000.00),
(5, '2024-01-01', '2024-03-31', 150000.00), (6, '2024-01-01', '2024-03-31', 600000.00);

-- 5. FINAL VIEW
SELECT * FROM Financial_Reports;