

CREATE Procedure CMRC_CustomerDetail
(
    @CustomerID int,
    @FullName   nvarchar(50) OUTPUT,
    @Email      nvarchar(50) OUTPUT,
    @Password   nvarchar(50) OUTPUT
)
AS

SELECT 
    @FullName = FullName, 
    @Email    = EmailAddress, 
    @Password = Password

FROM 
    CMRC_Customers

WHERE 
    CustomerID = @CustomerID