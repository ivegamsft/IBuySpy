CREATE Procedure CMRC_ShoppingCartRemoveItem
(
    @CartID nvarchar(50),
    @ProductID int
)
AS

DELETE FROM CMRC_ShoppingCart

WHERE 
    CartID = @CartID
  AND
    ProductID = @ProductID