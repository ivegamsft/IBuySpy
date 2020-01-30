

CREATE Procedure CMRC_ReviewsList
(
    @ProductID int
)
AS

SELECT 
    ReviewID, 
    CustomerName, 
    Rating, 
    Comments
    
FROM 
    CMRC_Reviews
    
WHERE 
    ProductID = @ProductID