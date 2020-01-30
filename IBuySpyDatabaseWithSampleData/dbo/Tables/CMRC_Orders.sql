CREATE TABLE [dbo].[CMRC_Orders] (
    [OrderID]    INT      IDENTITY (1, 1) NOT NULL,
    [CustomerID] INT      NOT NULL,
    [OrderDate]  DATETIME CONSTRAINT [DF_Orders_OrderDate] DEFAULT (getdate()) NOT NULL,
    [ShipDate]   DATETIME CONSTRAINT [DF_Orders_ShipDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CMRC_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC),
    CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[CMRC_Customers] ([CustomerID])
);

