--create database inventory;

SELECT * FROM inventory_tb;

--Country wise total ordered item and available item where ordered item more than 2000
SELECT CountryName, CategoryName, SUM(OrderItemQuantity) AS OrderedItem, 
SUM(TotalItemQuantity) AS AvailableItem
FROM inventory_tb
GROUP BY CountryName, CategoryName
HAVING SUM(OrderItemQuantity)>2000
ORDER BY CategoryName;

--Maximum ordered product
SELECT TOP 1 CategoryName, SUM(OrderItemQuantity) 
FROM inventory_tb 
GROUP BY CategoryName
ORDER BY SUM(OrderItemQuantity) DESC;

--Maximum sale price
SELECT ProductName, ProductListPrice 
FROM inventory_tb
WHERE ProductListPrice IN
(SELECT MAX(ProductListPrice) 
FROM inventory_tb);

--select highest Sales region
WITH CTE(Region,Sales) AS(
	SELECT RegionName, SUM(ProductListPrice) 
	FROM inventory_tb
	GROUP BY RegionName
)
SELECT TOP 1 C.Region, MAX(C.Sales)
FROM CTE AS C 
GROUP BY C.Region
ORDER BY MAX(C.Sales) DESC; 

--Profit by designation
SELECT EmployeeJobTitle, SUM(Profit) 
FROM inventory_tb
GROUP BY EmployeeJobTitle;




