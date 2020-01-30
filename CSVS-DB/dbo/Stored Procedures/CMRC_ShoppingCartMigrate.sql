CREATE Procedure CMRC_ShoppingCartMigrate
(
    @OriginalCartId nvarchar(50),
    @NewCartId      nvarchar(50)
)
AS

UPDATE 
    CMRC_ShoppingCart
    
SET 
    CartID = @NewCartId 
    
WHERE 
    CartID = @OriginalCartId