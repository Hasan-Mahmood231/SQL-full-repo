USE classicmodels;
SELECT 
    c.customerName,
    COUNT(o.orderNumber) AS totalOrders
FROM customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber, c.customerName;

-- find total no of customer for each country.
select 
country,
count(customerNumber) AS CustomerID
FROM classicmodels.customers
group by country
order by customerID desc;

-- find the highest score of customer for each country.

SELECT 
    country, 
    MAX(creditLimit) AS HighestCreditLimit
FROM customers
GROUP BY country
ORDER BY HighestCreditLimit DESC;


-- Employee Offices: Show the City of each office and the Count of
-- employees working in that specific office.

SELECT 
o.city,
count(e.officeCode) as total_employ
FROM classicmodels.offices AS o
LEFT JOIN classicmodels.employees AS e
ON o.officeCode = e.officeCode
group by o.city;

-- Customer Sales Reps: List each Customer Name along with the First Name and Last Name 
-- of their assigned Sales Representative.

SELECT 
c.customerName,
c.salesRepEmployeeNumber,
e.firstName,
e.lastName
FROM classicmodels.customers as c
left join classicmodels.employees as e
ON c.customerNumber = e.employeeNumber;

select *
from classicmodels.employees;

-- : Find the total number of orders that have a Status of 'On Hold' or 'Disputed'.

select 
status,
count(orderNumber) as total_no_odr
from classicmodels.orders
where status = 'Disputed' OR status = 'On Hold'
GROUP BY STATUS;


-- For each Order Number, calculate the total dollar amount of that order 
-- (Hint: You need to multiply quantityOrdered by priceEach in the orderdetails table).
SELECT 
orderNumber,
sum(quantityOrdered * priceEach) as total_doler
FROM classicmodels.orderdetails
group by orderNumber

