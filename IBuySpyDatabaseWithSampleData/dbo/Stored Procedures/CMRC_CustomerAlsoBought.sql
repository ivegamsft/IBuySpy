

CREATE Procedure CMRC_CustomerAlsoBought
(
    @ProductID int
)
As

/* We want to take the top 5 products contained in
    the orders where someone has purchased the given Product */
SELECT  TOP 5 
    CMRC_OrderDetails.ProductID,
    CMRC_Products.ModelName,
    SUM(CMRC_OrderDetails.Quantity) as TotalNum

FROM    
    CMRC_OrderDetails
  INNER JOIN CMRC_Products ON CMRC_OrderDetails.ProductID = CMRC_Products.ProductID

WHERE   OrderID IN 
(
    /* This inner query should retrieve all orders that have contained the productID */
    SELECT DISTINCT OrderID 
    FROM CMRC_OrderDetails
    WHERE ProductID = @ProductID
)
AND CMRC_OrderDetails.ProductID != @ProductID 

GROUP BY CMRC_OrderDetails.ProductID, CMRC_Products.ModelName 

ORDER BY TotalNum DESC