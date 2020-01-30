CREATE Procedure CMRC_CustomerLogin
(
    @Email      nvarchar(50),
    @Password   nvarchar(50),
    @CustomerID int OUTPUT
)
AS

SELECT 
    @CustomerID = CustomerID
    
FROM 
    CMRC_Customers
    
WHERE 
    EmailAddress = @Email
  AND 
    Password = @Password

IF @@Rowcount < 1 
SELECT 
    @CustomerID = 0