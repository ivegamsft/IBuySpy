CREATE Procedure CMRC_ProductCategoryList

AS

SELECT 
    CategoryID,
    CategoryName

FROM 
    CMRC_Categories

ORDER BY 
    CategoryName ASC