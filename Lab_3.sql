-- grant and revoke commond for paper.
use classicmodels;
select 
* 
FROM classicmodels.customers;


-- rolback and savepoitn 

/* ================================================================
TRANSACTION CONTROL PLAYGROUND
Topic: COMMIT, ROLLBACK, and SAVEPOINTS
================================================================
*/

-- 1. SETUP: Create a fresh table to test with
USE BankingDB;
DROP TABLE IF EXISTS TestMoney;
CREATE TABLE TestMoney (
    ID INT PRIMARY KEY,
    AccountName VARCHAR(50),
    Balance INT
);

-- Put some starting money in the account
INSERT INTO TestMoney VALUES (1, 'TestUser', 500);

-- -------------------------------------------------------------
-- SCENARIO: The "Mistake and Undo" (ROLLBACK)
-- -------------------------------------------------------------

-- Start the "Mission" (Turns off auto-save)
START TRANSACTION;

    -- Oops! Someone accidentally sets the balance to 0
    UPDATE TestMoney SET Balance = 0 WHERE ID = 1;
    
    -- If you run this SELECT now, you will see 0 (but it's not permanent yet!)
    SELECT * FROM TestMoney AS Status_During_Error;

    -- Now, we trigger the "Undo" button
    ROLLBACK;

-- Check again. The balance is back to 500!
SELECT * FROM TestMoney AS Status_After_Rollback;


-- -------------------------------------------------------------
-- SCENARIO: The "Checkpoint" (SAVEPOINT)
-- -------------------------------------------------------------

START TRANSACTION;

    -- Step A: Add $500 (Total should be 1000)
    UPDATE TestMoney SET Balance = Balance + 500 WHERE ID = 1;
    
    -- CREATE A CHECKPOINT (Flag in the ground)
    SAVEPOINT ValidProgress;

    -- Step B: Another "Accidental" update (Changing name to 'ERROR')
    UPDATE TestMoney SET AccountName = 'ERROR' WHERE ID = 1;
    
    -- Check: You'll see the name is 'ERROR' and balance is 1000
    SELECT * FROM TestMoney AS Status_Before_Partial_Undo;

    -- GO BACK TO THE CHECKPOINT
    -- This undoes Step B, but KEEPS Step A!
    ROLLBACK TO SAVEPOINT ValidProgress;

    -- Finalize the mission (Save permanently)
    COMMIT;

-- FINAL RESULT: Balance is 1000, but Name is still 'TestUser'
SELECT * FROM TestMoney AS Final_Permanent_Status;

