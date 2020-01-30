CREATE Procedure CMRC_ShoppingCartTotal
(
    @CartID    nvarchar(50),
    @TotalCost money OUTPUT
)
AS

SELECT 
    @TotalCost = SUM(CMRC_Products.UnitCost * CMRC_ShoppingCart.Quantity)

FROM 
    CMRC_ShoppingCart,
    CMRC_Products

WHERE
    CMRC_ShoppingCart.CartID = @CartID
  AND
    CMRC_Products.ProductID = CMRC_ShoppingCart.ProductID