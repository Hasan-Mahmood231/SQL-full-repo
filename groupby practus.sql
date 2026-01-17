-- Order Status Counts: Show each status and the total number of orders for that status.
USE CLASSICMODELS;
SELECT 
	STATUS,
	COUNT(*) AS TOTAL_ORDER
FROM classicmodels.orders
GROUP BY status;


-- List each country and the number of customers living there.Sort dec.
SELECT 
country,
COUNT(customerNumber) AS CUSTOMER_COUNTRY
FROM classicmodels.customers
group by country
order by CUSTOMER_COUNTRY desc;

-- Find the total quantityInStock for each productLine.

SELECT 
productName,
SUM(quantityInStock) AS TOTAL_PRODUCT
FROM classicmodels.products
GROUP BY productName;

-- List the officeCode for offices that have more than 3 employees working in them.
SELECT 
	officeCode,
	count(employeeNumber) as total_employ
FROM classicmodels.employees
group by officeCode
HAVING TOTAL_EMPLOY > 3
ORDER BY total_employ DESC;

-- Find the total creditLimit for every city. Order the results so the city with the
-- most credit appears firs
SELECT 
	SUM(creditLimit) AS total_creditLimit,
	city
from classicmodels.customers
GROUP BY CITY
ORDER BY total_creditLimit DESC;








