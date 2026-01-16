SELECT *
FROM classicmodels.employees;

-- firstly we run the commond of drop and then recreate db and from import option import the db.
-- now we ll again recover the database so...
CREATE DATABASE classicmodels;
use  classicmodels;
SELECT *
FROM classicmodels.employees;