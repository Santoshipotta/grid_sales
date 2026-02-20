-- combining three years orders
With all_orders as (SELECT
 OrderID,
CustomerID,
ProductID,
OrderDate,
Quantity,
Revenue,
COGS 
FROM orders_2023

union all

SELECT
 OrderID,
CustomerID,
ProductID,
OrderDate,
Quantity,
Revenue,
COGS 
FROM orders_2024

union all

SELECT
 OrderID,
CustomerID,
ProductID,
OrderDate,
Quantity,
Revenue,
COGS 
FROM orders_2025)


-- building the main dataset query
SELECT
    a.OrderID,
    a.CustomerID,
    a.ProductID,
    a.OrderDate,
    a.Quantity,
    a.Revenue,
    a.COGS,
    c.CustomerJoinDate,
    c.Region,
    p.ProductName,
    p.ProductCategory,
    p.Price,
    p.Base_Cost,
    a.Revenue-a.COGS as Profit
    
FROM all_orders a
LEFT JOIN customers c
    ON a.CustomerID = c.CustomerID
LEFT JOIN products p
    ON a.ProductID = p.ProductID
    where a.CustomerID is not  null; -- dropping non customer ids
    
    
    
    
    
    
    
    


