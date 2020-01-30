
CREATE Procedure CMRC_OrdersList
(
    @CustomerID int
)
As

SELECT  
    CMRC_Orders.OrderID,
    Cast(sum(CMRC_OrderDetails.Quantity*CMRC_OrderDetails.UnitCost) as money) as OrderTotal,
    CMRC_Orders.OrderDate, 
    CMRC_Orders.ShipDate

FROM    
    CMRC_Orders 
  INNER JOIN CMRC_OrderDetails ON CMRC_Orders.OrderID = CMRC_OrderDetails.OrderID

GROUP BY    
    CustomerID, 
    CMRC_Orders.OrderID, 
    CMRC_Orders.OrderDate, 
    CMRC_Orders.ShipDate
HAVING  
    CMRC_Orders.CustomerID = @CustomerID