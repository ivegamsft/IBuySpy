/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
DROP TABLE IF EXISTS CMRC_Reviews;
GO
DROP TABLE IF EXISTS CMRC_ShoppingCart;
GO
DROP TABLE IF EXISTS CMRC_Products;
GO
DROP TABLE IF EXISTS CMRC_Categories;
GO
DROP TABLE IF EXISTS CMRC_OrderDetails;
GO
DROP TABLE IF EXISTS CMRC_Orders;
GO
DROP TABLE IF EXISTS CMRC_Customers;
GO