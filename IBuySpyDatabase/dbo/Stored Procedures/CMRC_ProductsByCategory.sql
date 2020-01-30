

CREATE Procedure CMRC_ProductsByCategory
(
    @CategoryID int
)
AS

SELECT 
    ProductID,
    ModelName,
    UnitCost, 
    ProductImage

FROM 
    CMRC_Products

WHERE 
    CategoryID = @CategoryID

ORDER BY 
    ModelName, 
    ModelNumber