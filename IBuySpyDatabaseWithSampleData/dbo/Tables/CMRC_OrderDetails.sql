CREATE TABLE [dbo].[CMRC_OrderDetails] (
    [OrderID]   INT   NOT NULL,
    [ProductID] INT   NOT NULL,
    [Quantity]  INT   NOT NULL,
    [UnitCost]  MONEY NOT NULL,
    CONSTRAINT [PK_CMRC_OrderDetails] PRIMARY KEY CLUSTERED ([OrderID] ASC, [ProductID] ASC),
    CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[CMRC_Orders] ([OrderID])
);

