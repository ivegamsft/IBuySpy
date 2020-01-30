

CREATE Procedure CMRC_ShoppingCartUpdate
(
    @CartID    nvarchar(50),
    @ProductID int,
    @Quantity  int
)
AS

UPDATE CMRC_ShoppingCart

SET 
    Quantity = @Quantity

WHERE 
    CartID = @CartID 
  AND 
    ProductID = @ProductID