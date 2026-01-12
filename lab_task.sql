SELECT *
FROM classicmodels.payments;
SELECT *
FROM classicmodels.orders;

-- shiped order total amount?
SELECT 
O.status,
sum(P.amount) AS TOTAL_AMOUNT
FROM classicmodels.orders AS O
JOIN classicmodels.payments AS P
ON O.customerNumber = P.customerNumber
GROUP BY O.status;

SELECT 
COUNT(comments)
from classicmodels.orders
where comments != 'NULL';

SELECT 
orderNumber,
SUM(quantityOrdered * priceEach)
FROM classicmodels.orderdetails
GROUP BY orderNumber;

SELECT *
FROM classicmodels.products;

-- Find customers who have placed more than 5 orders and have a total payment amount exceeding $50,000
SELECT *
FROM classicmodels.customers;
SELECT *
FROM classicmodels.orders
WHERE STATUS = 'Resolved'









