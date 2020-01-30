


CREATE Procedure CMRC_OrdersAdd
(
    @CustomerID int,
    @CartID     nvarchar(50),
    @OrderDate  datetime,        
    @ShipDate   datetime,
    @OrderID    int OUTPUT
)
AS

BEGIN TRAN AddOrder

/* Create the Order header */
INSERT INTO CMRC_Orders
(
    CustomerID, 
    OrderDate, 
    ShipDate
)
VALUES
(   
    @CustomerID, 
    @OrderDate, 
    @ShipDate
)

SELECT
    @OrderID = @@Identity    

/* Copy items from given shopping cart to OrdersDetail table for given OrderID*/
INSERT INTO CMRC_OrderDetails
(
    OrderID, 
    ProductID, 
    Quantity, 
    UnitCost
)

SELECT 
    @OrderID, 
    CMRC_ShoppingCart.ProductID, 
    Quantity, 
    CMRC_Products.UnitCost

FROM 
    CMRC_ShoppingCart 
  INNER JOIN CMRC_Products ON CMRC_ShoppingCart.ProductID = CMRC_Products.ProductID
  
WHERE 
    CartID = @CartID

/* Removal of  items from user's shopping cart will happen on the business layer*/
EXEC CMRC_ShoppingCartEmpty @CartID

COMMIT TRAN AddOrder