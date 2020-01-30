

CREATE Procedure CMRC_ShoppingCartItemCount
(
    @CartID    nvarchar(50),
    @ItemCount int OUTPUT
)
AS

SELECT 
    @ItemCount = COUNT(ProductID)
    
FROM 
    CMRC_ShoppingCart
    
WHERE 
    CartID = @CartID