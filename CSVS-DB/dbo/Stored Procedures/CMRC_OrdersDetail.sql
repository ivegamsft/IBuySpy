CREATE Procedure CMRC_OrdersDetail
(
    @OrderID    int,
    @CustomerID int,
    @OrderDate  datetime OUTPUT,
    @ShipDate   datetime OUTPUT,
    @OrderTotal money OUTPUT
)
AS

/* Return the order dates from the Orders
    Also verifies the order exists for this customer. */
SELECT 
    @OrderDate = OrderDate,
    @ShipDate = ShipDate
    
FROM    
    CMRC_Orders
    
WHERE   
    OrderID = @OrderID
    AND
    CustomerID = @CustomerID

IF @@Rowcount = 1
BEGIN

/* First, return the OrderTotal out param */
SELECT  
    @OrderTotal = Cast(SUM(CMRC_OrderDetails.Quantity * CMRC_OrderDetails.UnitCost) as money)
    
FROM    
    CMRC_OrderDetails
    
WHERE   
    OrderID= @OrderID

/* Then, return the recordset of info */
SELECT  
    CMRC_Products.ProductID, 
    CMRC_Products.ModelName,
    CMRC_Products.ModelNumber,
    CMRC_OrderDetails.UnitCost,
    CMRC_OrderDetails.Quantity,
    (CMRC_OrderDetails.Quantity * CMRC_OrderDetails.UnitCost) as ExtendedAmount

FROM
    CMRC_OrderDetails
  INNER JOIN CMRC_Products ON CMRC_OrderDetails.ProductID = CMRC_Products.ProductID
  
WHERE   
    OrderID = @OrderID

END