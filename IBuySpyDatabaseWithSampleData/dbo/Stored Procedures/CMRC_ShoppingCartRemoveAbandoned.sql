

CREATE Procedure CMRC_ShoppingCartRemoveAbandoned

AS

DELETE FROM CMRC_ShoppingCart

WHERE 
    DATEDIFF(dd, DateCreated, GetDate()) > 1