

CREATE Procedure CMRC_ReviewsAdd
(
    @ProductID     int,
    @CustomerName  nvarchar(50),
    @CustomerEmail nvarchar(50),
    @Rating        int,
    @Comments      nvarchar(3850),
    @ReviewID      int OUTPUT
)
AS

INSERT INTO CMRC_Reviews
(
    ProductID, 
    CustomerName, 
    CustomerEmail, 
    Rating, 
    Comments
)
VALUES
(
    @ProductID, 
    @CustomerName, 
    @CustomerEmail, 
    @Rating, 
    @Comments
)

SELECT 
    @ReviewID = @@Identity