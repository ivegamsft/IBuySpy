CREATE Procedure CMRC_ShoppingCartEmpty
(
    @CartID nvarchar(50)
)
AS

DELETE FROM CMRC_ShoppingCart

WHERE 
    CartID = @CartID