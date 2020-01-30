CREATE TABLE [dbo].[CMRC_Customers] (
    [CustomerID]   INT           IDENTITY (1, 1) NOT NULL,
    [FullName]     NVARCHAR (50) NULL,
    [EmailAddress] NVARCHAR (50) NULL,
    [Password]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_CMRC_Customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC),
    CONSTRAINT [IX_Customers] UNIQUE NONCLUSTERED ([EmailAddress] ASC)
);

