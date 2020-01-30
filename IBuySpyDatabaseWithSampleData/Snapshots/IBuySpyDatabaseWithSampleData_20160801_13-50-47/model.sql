CREATE TABLE [dbo].[CMRC_Categories] (
    [CategoryID]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_CMRC_Categories] PRIMARY KEY NONCLUSTERED ([CategoryID] ASC)
);

GO
CREATE TABLE [dbo].[CMRC_Customers] (
    [CustomerID]   INT           IDENTITY (1, 1) NOT NULL,
    [FullName]     NVARCHAR (50) NULL,
    [EmailAddress] NVARCHAR (50) NULL,
    [Password]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_CMRC_Customers] PRIMARY KEY NONCLUSTERED ([CustomerID] ASC),
    CONSTRAINT [IX_Customers] UNIQUE NONCLUSTERED ([EmailAddress] ASC)
);

GO
CREATE TABLE [dbo].[CMRC_OrderDetails] (
    [OrderID]   INT   NOT NULL,
    [ProductID] INT   NOT NULL,
    [Quantity]  INT   NOT NULL,
    [UnitCost]  MONEY NOT NULL,
    CONSTRAINT [PK_CMRC_OrderDetails] PRIMARY KEY NONCLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[CMRC_Orders] ([OrderID]) NOT FOR REPLICATION
);

GO
CREATE TABLE [dbo].[CMRC_Orders] (
    [OrderID]    INT      IDENTITY (1, 1) NOT NULL,
    [CustomerID] INT      NOT NULL,
    [OrderDate]  DATETIME CONSTRAINT [DF_Orders_OrderDate] DEFAULT (getdate()) NOT NULL,
    [ShipDate]   DATETIME CONSTRAINT [DF_Orders_ShipDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CMRC_Orders] PRIMARY KEY NONCLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[CMRC_Customers] ([CustomerID]) NOT FOR REPLICATION
);

GO
CREATE TABLE [dbo].[CMRC_Products] (
    [ProductID]    INT             IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT             NOT NULL,
    [ModelNumber]  NVARCHAR (50)   NULL,
    [ModelName]    NVARCHAR (50)   NULL,
    [ProductImage] NVARCHAR (50)   NULL,
    [UnitCost]     MONEY           NOT NULL,
    [Description]  NVARCHAR (3800) NULL,
    CONSTRAINT [PK_CMRC_Products] PRIMARY KEY NONCLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[CMRC_Categories] ([CategoryID])
);

GO
CREATE TABLE [dbo].[CMRC_Reviews] (
    [ReviewID]      INT             IDENTITY (1, 1) NOT NULL,
    [ProductID]     INT             NOT NULL,
    [CustomerName]  NVARCHAR (50)   NULL,
    [CustomerEmail] NVARCHAR (50)   NULL,
    [Rating]        INT             NOT NULL,
    [Comments]      NVARCHAR (3850) NULL,
    CONSTRAINT [FK_Reviews_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[CMRC_Products] ([ProductID]) NOT FOR REPLICATION
);

GO
CREATE TABLE [dbo].[CMRC_ShoppingCart] (
    [RecordID]    INT           IDENTITY (1, 1) NOT NULL,
    [CartID]      NVARCHAR (50) NULL,
    [Quantity]    INT           CONSTRAINT [DF_ShoppingCart_Quantity] DEFAULT ((1)) NOT NULL,
    [ProductID]   INT           NOT NULL,
    [DateCreated] DATETIME      CONSTRAINT [DF_ShoppingCart_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CMRC_ShoppingCart] PRIMARY KEY NONCLUSTERED ([RecordID] ASC),
    CONSTRAINT [FK_ShoppingCart_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[CMRC_Products] ([ProductID])
);

GO
CREATE NONCLUSTERED INDEX [IX_ShoppingCart]
    ON [dbo].[CMRC_ShoppingCart]([CartID] ASC, [ProductID] ASC);

GO
CREATE PROCEDURE [dbo].[CMRC_CustomerAdd]
@FullName NVARCHAR (50) NULL, @Email NVARCHAR (50) NULL, @Password NVARCHAR (50) NULL, @CustomerID INT NULL OUTPUT
AS
INSERT  INTO CMRC_Customers (FullName, EmailAddress, Password)
VALUES                     (@FullName, @Email, @Password);
SELECT @CustomerID = @@Identity;

GO
CREATE PROCEDURE [dbo].[CMRC_CustomerAlsoBought]
@ProductID INT NULL
AS
SELECT   TOP 5 CMRC_OrderDetails.ProductID,
               CMRC_Products.ModelName,
               SUM(CMRC_OrderDetails.Quantity) AS TotalNum
FROM     CMRC_OrderDetails
         INNER JOIN
         CMRC_Products
         ON CMRC_OrderDetails.ProductID = CMRC_Products.ProductID
WHERE    OrderID IN (SELECT DISTINCT OrderID
                     FROM   CMRC_OrderDetails
                     WHERE  ProductID = @ProductID)
         AND CMRC_OrderDetails.ProductID != @ProductID
GROUP BY CMRC_OrderDetails.ProductID, CMRC_Products.ModelName
ORDER BY TotalNum DESC;

GO
CREATE PROCEDURE [dbo].[CMRC_CustomerDetail]
@CustomerID INT NULL, @FullName NVARCHAR (50) NULL OUTPUT, @Email NVARCHAR (50) NULL OUTPUT, @Password NVARCHAR (50) NULL OUTPUT
AS
SELECT @FullName = FullName,
       @Email = EmailAddress,
       @Password = Password
FROM   CMRC_Customers
WHERE  CustomerID = @CustomerID;

GO
CREATE PROCEDURE [dbo].[CMRC_CustomerLogin]
@Email NVARCHAR (50) NULL, @Password NVARCHAR (50) NULL, @CustomerID INT NULL OUTPUT
AS
SELECT @CustomerID = CustomerID
FROM   CMRC_Customers
WHERE  EmailAddress = @Email
       AND Password = @Password;
IF @@Rowcount < 1
    SELECT @CustomerID = 0;

GO
CREATE PROCEDURE [dbo].[CMRC_OrdersAdd]
@CustomerID INT NULL, @CartID NVARCHAR (50) NULL, @OrderDate DATETIME NULL, @ShipDate DATETIME NULL, @OrderID INT NULL OUTPUT
AS
BEGIN TRANSACTION AddOrder;
INSERT  INTO CMRC_Orders (CustomerID, OrderDate, ShipDate)
VALUES                  (@CustomerID, @OrderDate, @ShipDate);
SELECT @OrderID = @@Identity;
INSERT INTO CMRC_OrderDetails (OrderID, ProductID, Quantity, UnitCost)
SELECT @OrderID,
       CMRC_ShoppingCart.ProductID,
       Quantity,
       CMRC_Products.UnitCost
FROM   CMRC_ShoppingCart
       INNER JOIN
       CMRC_Products
       ON CMRC_ShoppingCart.ProductID = CMRC_Products.ProductID
WHERE  CartID = @CartID;
EXECUTE CMRC_ShoppingCartEmpty @CartID;
COMMIT TRANSACTION AddOrder;

GO
CREATE PROCEDURE [dbo].[CMRC_OrdersDetail]
@OrderID INT NULL, @CustomerID INT NULL, @OrderDate DATETIME NULL OUTPUT, @ShipDate DATETIME NULL OUTPUT, @OrderTotal MONEY NULL OUTPUT
AS
SELECT @OrderDate = OrderDate,
       @ShipDate = ShipDate
FROM   CMRC_Orders
WHERE  OrderID = @OrderID
       AND CustomerID = @CustomerID;
IF @@Rowcount = 1
    BEGIN
        SELECT @OrderTotal = CAST (SUM(CMRC_OrderDetails.Quantity * CMRC_OrderDetails.UnitCost) AS MONEY)
        FROM   CMRC_OrderDetails
        WHERE  OrderID = @OrderID;
        SELECT CMRC_Products.ProductID,
               CMRC_Products.ModelName,
               CMRC_Products.ModelNumber,
               CMRC_OrderDetails.UnitCost,
               CMRC_OrderDetails.Quantity,
               (CMRC_OrderDetails.Quantity * CMRC_OrderDetails.UnitCost) AS ExtendedAmount
        FROM   CMRC_OrderDetails
               INNER JOIN
               CMRC_Products
               ON CMRC_OrderDetails.ProductID = CMRC_Products.ProductID
        WHERE  OrderID = @OrderID;
    END

GO
CREATE PROCEDURE [dbo].[CMRC_OrdersList]
@CustomerID INT NULL
AS
SELECT   CMRC_Orders.OrderID,
         CAST (sum(CMRC_OrderDetails.Quantity * CMRC_OrderDetails.UnitCost) AS MONEY) AS OrderTotal,
         CMRC_Orders.OrderDate,
         CMRC_Orders.ShipDate
FROM     CMRC_Orders
         INNER JOIN
         CMRC_OrderDetails
         ON CMRC_Orders.OrderID = CMRC_OrderDetails.OrderID
GROUP BY CustomerID, CMRC_Orders.OrderID, CMRC_Orders.OrderDate, CMRC_Orders.ShipDate
HAVING   CMRC_Orders.CustomerID = @CustomerID;

GO
CREATE PROCEDURE [dbo].[CMRC_ProductCategoryList]
AS
SELECT   CategoryID,
         CategoryName
FROM     CMRC_Categories
ORDER BY CategoryName ASC;

GO
CREATE PROCEDURE [dbo].[CMRC_ProductDetail]
@ProductID INT NULL, @ModelNumber NVARCHAR (50) NULL OUTPUT, @ModelName NVARCHAR (50) NULL OUTPUT, @ProductImage NVARCHAR (50) NULL OUTPUT, @UnitCost MONEY NULL OUTPUT, @Description NVARCHAR (4000) NULL OUTPUT
AS
SELECT @ProductID = ProductID,
       @ModelNumber = ModelNumber,
       @ModelName = ModelName,
       @ProductImage = ProductImage,
       @UnitCost = UnitCost,
       @Description = Description
FROM   CMRC_Products
WHERE  ProductID = @ProductID;

GO
CREATE PROCEDURE [dbo].[CMRC_ProductsByCategory]
@CategoryID INT NULL
AS
SELECT   ProductID,
         ModelName,
         UnitCost,
         ProductImage
FROM     CMRC_Products
WHERE    CategoryID = @CategoryID
ORDER BY ModelName, ModelNumber;

GO
CREATE PROCEDURE [dbo].[CMRC_ProductSearch]
@Search NVARCHAR (255) NULL
AS
SELECT ProductID,
       ModelName,
       ModelNumber,
       UnitCost,
       ProductImage
FROM   CMRC_Products
WHERE  ModelNumber LIKE '%' + @Search + '%'
       OR ModelName LIKE '%' + @Search + '%'
       OR Description LIKE '%' + @Search + '%';

GO
CREATE PROCEDURE [dbo].[CMRC_ProductsMostPopular]
AS
SELECT   TOP 5 CMRC_OrderDetails.ProductID,
               SUM(CMRC_OrderDetails.Quantity) AS TotalNum,
               CMRC_Products.ModelName
FROM     CMRC_OrderDetails
         INNER JOIN
         CMRC_Products
         ON CMRC_OrderDetails.ProductID = CMRC_Products.ProductID
GROUP BY CMRC_OrderDetails.ProductID, CMRC_Products.ModelName
ORDER BY TotalNum DESC;

GO
CREATE PROCEDURE [dbo].[CMRC_ReviewsAdd]
@ProductID INT NULL, @CustomerName NVARCHAR (50) NULL, @CustomerEmail NVARCHAR (50) NULL, @Rating INT NULL, @Comments NVARCHAR (3850) NULL, @ReviewID INT NULL OUTPUT
AS
INSERT  INTO CMRC_Reviews (ProductID, CustomerName, CustomerEmail, Rating, Comments)
VALUES                   (@ProductID, @CustomerName, @CustomerEmail, @Rating, @Comments);
SELECT @ReviewID = @@Identity;

GO
CREATE PROCEDURE [dbo].[CMRC_ReviewsList]
@ProductID INT NULL
AS
SELECT ReviewID,
       CustomerName,
       Rating,
       Comments
FROM   CMRC_Reviews
WHERE  ProductID = @ProductID;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartAddItem]
@CartID NVARCHAR (50) NULL, @ProductID INT NULL, @Quantity INT NULL
AS
DECLARE @CountItems AS INT;
SELECT @CountItems = Count(ProductID)
FROM   CMRC_ShoppingCart
WHERE  ProductID = @ProductID
       AND CartID = @CartID;
IF @CountItems > 0
    UPDATE CMRC_ShoppingCart
    SET    Quantity = (@Quantity + CMRC_ShoppingCart.Quantity)
    WHERE  ProductID = @ProductID
           AND CartID = @CartID;
ELSE
    INSERT  INTO CMRC_ShoppingCart (CartID, Quantity, ProductID)
    VALUES                        (@CartID, @Quantity, @ProductID);

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartEmpty]
@CartID NVARCHAR (50) NULL
AS
DELETE CMRC_ShoppingCart
WHERE  CartID = @CartID;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartItemCount]
@CartID NVARCHAR (50) NULL, @ItemCount INT NULL OUTPUT
AS
SELECT @ItemCount = COUNT(ProductID)
FROM   CMRC_ShoppingCart
WHERE  CartID = @CartID;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartList]
@CartID NVARCHAR (50) NULL
AS
SELECT   CMRC_Products.ProductID,
         CMRC_Products.ModelName,
         CMRC_Products.ModelNumber,
         CMRC_ShoppingCart.Quantity,
         CMRC_Products.UnitCost,
         CAST ((CMRC_Products.UnitCost * CMRC_ShoppingCart.Quantity) AS MONEY) AS ExtendedAmount
FROM     CMRC_Products, CMRC_ShoppingCart
WHERE    CMRC_Products.ProductID = CMRC_ShoppingCart.ProductID
         AND CMRC_ShoppingCart.CartID = @CartID
ORDER BY CMRC_Products.ModelName, CMRC_Products.ModelNumber;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartMigrate]
@OriginalCartId NVARCHAR (50) NULL, @NewCartId NVARCHAR (50) NULL
AS
UPDATE CMRC_ShoppingCart
SET    CartID = @NewCartId
WHERE  CartID = @OriginalCartId;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartRemoveAbandoned]
AS
DELETE CMRC_ShoppingCart
WHERE  DATEDIFF(dd, DateCreated, GetDate()) > 1;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartRemoveItem]
@CartID NVARCHAR (50) NULL, @ProductID INT NULL
AS
DELETE CMRC_ShoppingCart
WHERE  CartID = @CartID
       AND ProductID = @ProductID;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartTotal]
@CartID NVARCHAR (50) NULL, @TotalCost MONEY NULL OUTPUT
AS
SELECT @TotalCost = SUM(CMRC_Products.UnitCost * CMRC_ShoppingCart.Quantity)
FROM   CMRC_ShoppingCart, CMRC_Products
WHERE  CMRC_ShoppingCart.CartID = @CartID
       AND CMRC_Products.ProductID = CMRC_ShoppingCart.ProductID;

GO
CREATE PROCEDURE [dbo].[CMRC_ShoppingCartUpdate]
@CartID NVARCHAR (50) NULL, @ProductID INT NULL, @Quantity INT NULL
AS
UPDATE CMRC_ShoppingCart
SET    Quantity = @Quantity
WHERE  CartID = @CartID
       AND ProductID = @ProductID;

GO
