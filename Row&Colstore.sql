
CREATE CLUSTERED COLUMNSTORE INDEX idx_CustomerIDX_CS
ON Sales.CustomerIDX


--error say that you cant create double comond so we drop it and then run
DROP INDEX [idx_CustomerIDX_CustomerID] ON Sales.CustomerIDX