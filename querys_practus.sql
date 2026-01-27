-- Find all unique countries where our customers live.
SELECT 
distinct(country)
FROM classicmodels.customers;

-- List the first and last names of employees who do not have a boss (reportsTo is NULL).
SELECT 
firstName,
lastName
FROM classicmodels.employees
WHERE reportsTo IS NULL;  

-- Display the top 5 most expensive products based on their MSRP.
SELECT 
*
FROM classicmodels.products
order by MSRP desc
limit 5;

-- Find all orders that have a status of 'Cancelled'.
SELECT *
FROM classicmodels.orders
WHERE status = 'Cancelled';

-- List all customers whose name starts with the letter 'A'
SELECT *
FROM classicmodels.customers
WHERE customerName LIKE 'A%';


-- Count how many customers are assigned to the Sales Rep with ID 1370.
SELECT 
COUNT(*)
FROM classicmodels.customers
WHERE salesRepEmployeeNumber = 1370;


-- Find the total quantityInStock for all products in the 'Planes' line.

SELECT 
SUM(quantityInStock)
FROM classicmodels.products
WHERE productLine = 'Planes';

-- Calculate the average creditLimit for customers living in 'USA'.
SELECT 
AVG(creditLimit)
FROM classicmodels.customers
WHERE country = 'USA';


-- Show the total number of customers in each country.
SELECT 
COUNTRY,
COUNT(customerNumber) AS TOTAL_CUSTOMER
FROM classicmodels.customers
GROUP BY country;


-- List only the countries that have more than 10 customers (Hint: Use HAVING).
SELECT 
COUNTRY,
COUNT(customerNumber) AS TOTAL_CUSTOMER
FROM classicmodels.customers
GROUP BY country
HAVING TOTAL_CUSTOMER > 10;


-- List each customerName and the city of the office their sales rep works in.
SELECT 
    c.customerName,
    o.city
FROM classicmodels.customers AS c
LEFT JOIN classicmodels.employees AS e
    ON c.salesRepEmployeeNumber = e.employeeNumber
LEFT JOIN classicmodels.offices AS o
    ON e.officeCode = o.officeCode;
    
-- Find the total amount paid by the customer 'Atelier graphique'.
select 
sum(p.amount)
from classicmodels.payments as p
left join classicmodels.customers c
ON p.customerNumber = c.customerNumber
where c.customerName = 'Atelier graphique';

-- List all orderNumbers along with the customerName who placed them
select *
from classicmodels.orders;

select 
o.orderNumber,
c.customerName
from classicmodels.customers as c
join classicmodels.orders as o
on c.customerNumber = o.customerNumber;

-- Show all productNames and the textDescription of their product line.

select 
pr.productName,
p.textDescription
from classicmodels.products as pr
left join classicmodels.productlines as p
on pr.productLine = p.productLine;

-- Find all products that have never been ordered (Hint: Use a LEFT JOIN and look for NULLs).
select *
from classicmodels.orderdetails;

SELECT p.*
FROM classicmodels.products AS p
LEFT JOIN classicmodels.orderdetails AS o
    ON p.productCode = o.productCode
WHERE o.productCode IS NULL;

-- List all products with a buyPrice between 50 and 100
SELECT *
FROM classicmodels.products
WHERE buyPrice > 50 AND buyPrice < 100;

-- customer and phon of all customer live in USA.
SELECT 
customerName,
phone
FROM classicmodels.customers
WHERE country = 'USA';

-- Find all customers who do not have a value in the addressLine2 column
SELECT *
FROM classicmodels.customers
WHERE addressLine2 IS NULL;

-- List all employees whose lastName starts with the letter 'B'.
SELECT *
FROM classicmodels.employees
WHERE lastName LIKE 'B%';

-- Basic Exclusion: List all products that do not start with the letter 'S'.
select *
from classicmodels.products
where productName  not like '1%';

-- Position Check: Retrieve all employees whose lastName has 'a' as the second letter.
SELECT *
FROM classicmodels.employees
WHERE lastName LIKE '_A%';

-- Find all customers whose city starts with 'L' and ends with 'n'.
SELECT *
FROM classicmodels.customers
WHERE city LIKE 'L%n';

-- List all products where the description contains the word 'Classic' anywhere in the text.
SELECT *
FROM classicmodels.products
WHERE productDescription LIKE '%Classic%';


-- Find all employees whose lastName starts with any letter between 'A' and 'E' (Hint: LIKE '[A-E]%').
SELECT *
FROM classicmodels.employees
WHERE lastName LIKE	'[A-E]%';

-- Find all products with a quantityInStock between 1000 and 5000.
select * from classicmodels.products
where quantityInStock >= 1000 and quantityInStock <= 5000;

-- List all customers alphabetically by their name (A to Z).
select *
from classicmodels.customers
order by country;

-- Display the top 10 most expensive products (MSRP) from highest to lowest.
select
 *
from classicmodels.products
order by buyPrice desc
;
-- Count the total number of orders placed in the database.
select 
count(*)
from classicmodels.orders;

-- Show the customerName and the orderNumber for every order placed. (Join customers and orders)
SELECT *
FROM classicmodels.customers;


-- Show all orders that are currently 'In Process' or 'On Hold'.
select *
from classicmodels.orders
where status = 'in Process' or 'On Hold';

-- Find all customers who do not have a value in the addressLine2 column.
select *
from classicmodels.customers
where addressLine2 IS NULL ;

-- List all employees whose lastName starts with the letter 'B'.
SELECT *
FROM classicmodels.employees
WHERE lastName LIKE 'B%';

-- Retrieve all employees whose lastName has 'a' as the second letter.
SELECT *
FROM classicmodels.employees
WHERE lastName LIKE '_a%'
























