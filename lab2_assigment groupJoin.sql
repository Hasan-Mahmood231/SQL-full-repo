USE classicmodels;
SELECT 
    c.customerName,
    COUNT(o.orderNumber) AS totalOrders
FROM customers c
LEFT JOIN orders o
    ON c.customerNumber = o.customerNumber
GROUP BY c.customerNumber, c.customerName;

SELECT 
	e.firstName,
	e.lastName,
	e.reportsTo,
	count(o.country) as country
FROM classicmodels.employees as e
right JOIN classicmodels.offices as o
ON e.officeCode = o.officeCode
group by o.country