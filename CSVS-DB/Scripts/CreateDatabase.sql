-- ===============================================
-- CONFIG ASP.NET Commerce STARTER KIT DATABASE
-- Create Database Script
-- 
-- Version:	1.2 - 01/02 (swarren)
--
-- ===============================================

-- =======================================================
-- MAKE TABLES AND SPROCS FOR IBUYSPY Commerce DB
-- =======================================================

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_Products_Categories]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [CMRC_Products] DROP CONSTRAINT FK_Products_Categories
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_Orders_Customers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [CMRC_Orders] DROP CONSTRAINT FK_Orders_Customers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_OrderDetails_Orders]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [CMRC_OrderDetails] DROP CONSTRAINT FK_OrderDetails_Orders
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_Reviews_Products]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [CMRC_Reviews] DROP CONSTRAINT FK_Reviews_Products
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_ShoppingCart_Products]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [CMRC_ShoppingCart] DROP CONSTRAINT FK_ShoppingCart_Products
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_CustomerAdd]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_CustomerAdd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_CustomerAlsoBought]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_CustomerAlsoBought]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_CustomerDetail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_CustomerDetail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_CustomerLogin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_CustomerLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_OrdersAdd]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_OrdersAdd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_OrdersDetail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_OrdersDetail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_OrdersList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_OrdersList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ProductCategoryList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ProductCategoryList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ProductDetail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ProductDetail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ProductsByCategory]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ProductsByCategory]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ProductsMostPopular]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ProductsMostPopular]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ProductSearch]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ProductSearch]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ReviewsAdd]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ReviewsAdd]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ReviewsList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ReviewsList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartAddItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartAddItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartEmpty]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartEmpty]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartItemCount]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartItemCount]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartList]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartMigrate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartMigrate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartRemoveAbandoned]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartRemoveAbandoned]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartRemoveItem]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartRemoveItem]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartTotal]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartTotal]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCartUpdate]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [CMRC_ShoppingCartUpdate]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_Categories]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_Categories]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_Customers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_Customers]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_OrderDetails]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_OrderDetails]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_Orders]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_Orders]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_Products]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_Products]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_Reviews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_Reviews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[CMRC_ShoppingCart]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [CMRC_ShoppingCart]
GO


GO


GO


GO


GO


GO


GO


GO

 
GO

ALTER TABLE [CMRC_Customers] ADD 
	CONSTRAINT [PK_CMRC_Customers] PRIMARY KEY  NONCLUSTERED 
	(
		[CustomerID]
	)  ON [PRIMARY] ,
	CONSTRAINT [IX_Customers] UNIQUE  NONCLUSTERED 
	(
		[EmailAddress]
	)  ON [PRIMARY] 
GO

 
GO

ALTER TABLE [CMRC_Orders] ADD 
	CONSTRAINT [DF_Orders_OrderDate] DEFAULT (getdate()) FOR [OrderDate],
	CONSTRAINT [DF_Orders_ShipDate] DEFAULT (getdate()) FOR [ShipDate],
	CONSTRAINT [PK_CMRC_Orders] PRIMARY KEY  NONCLUSTERED 
	(
		[OrderID]
	)  ON [PRIMARY] 
GO

 
GO

ALTER TABLE [CMRC_ShoppingCart] ADD 
	CONSTRAINT [DF_ShoppingCart_Quantity] DEFAULT (1) FOR [Quantity],
	CONSTRAINT [DF_ShoppingCart_DateCreated] DEFAULT (getdate()) FOR [DateCreated],
	CONSTRAINT [PK_CMRC_ShoppingCart] PRIMARY KEY  NONCLUSTERED 
	(
		[RecordID]
	)  ON [PRIMARY] 
GO

 
GO

 
GO

 
GO


GO

 
GO


GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--
-- end make objects
-- 
