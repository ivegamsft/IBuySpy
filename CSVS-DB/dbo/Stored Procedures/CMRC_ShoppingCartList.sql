CREATE Procedure CMRC_ShoppingCartList
(
    @CartID nvarchar(50)
)
AS

SELECT 
    CMRC_Products.ProductID, 
    CMRC_Products.ModelName,
    CMRC_Products.ModelNumber,
    CMRC_ShoppingCart.Quantity,
    CMRC_Products.UnitCost,
    Cast((CMRC_Products.UnitCost * CMRC_ShoppingCart.Quantity) as money) as ExtendedAmount

FROM 
    CMRC_Products,
    CMRC_ShoppingCart

WHERE 
    CMRC_Products.ProductID = CMRC_ShoppingCart.ProductID
  AND 
    CMRC_ShoppingCart.CartID = @CartID

ORDER BY 
    CMRC_Products.ModelName, 
    CMRC_Products.ModelNumber