CREATE Procedure CMRC_ProductsMostPopular

AS

SELECT TOP 5 
    CMRC_OrderDetails.ProductID, 
    SUM(CMRC_OrderDetails.Quantity) as TotalNum, 
    CMRC_Products.ModelName
    
FROM    
    CMRC_OrderDetails
  INNER JOIN CMRC_Products ON CMRC_OrderDetails.ProductID = CMRC_Products.ProductID
  
GROUP BY 
    CMRC_OrderDetails.ProductID, 
    CMRC_Products.ModelName
    
ORDER BY 
    TotalNum DESC