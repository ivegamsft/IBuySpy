CREATE TABLE [dbo].[CMRC_Products] (
    [ProductID]    INT             IDENTITY (1, 1) NOT NULL,
    [CategoryID]   INT             NOT NULL,
    [ModelNumber]  NVARCHAR (50)   NULL,
    [ModelName]    NVARCHAR (50)   NULL,
    [ProductImage] NVARCHAR (50)   NULL,
    [UnitCost]     MONEY           NOT NULL,
    [Description]  NVARCHAR (3800) NULL,
    CONSTRAINT [PK_CMRC_Products] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[CMRC_Categories] ([CategoryID])
);

