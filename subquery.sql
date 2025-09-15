--select product name,id,price and total Number of order.
SELECT
P.ProductID,
P.Category,
P.Price,
(SELECT COUNT(*) FROM Sales.Orders)TOTA_ORDER
FROM Sales.Products AS P

