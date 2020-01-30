CREATE Procedure CMRC_ProductDetail
(
    @ProductID    int,
    @ModelNumber  nvarchar(50) OUTPUT,
    @ModelName    nvarchar(50) OUTPUT,
    @ProductImage nvarchar(50) OUTPUT,
    @UnitCost     money OUTPUT,
    @Description  nvarchar(4000) OUTPUT
)
AS

SELECT 
    @ProductID    = ProductID,
    @ModelNumber  = ModelNumber,
    @ModelName    = ModelName,
    @ProductImage = ProductImage,
    @UnitCost     = UnitCost,
    @Description  = Description

FROM 
    CMRC_Products

WHERE 
    ProductID = @ProductID