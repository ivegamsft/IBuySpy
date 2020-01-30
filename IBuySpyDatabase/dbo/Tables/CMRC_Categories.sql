CREATE TABLE [dbo].[CMRC_Categories] (
    [CategoryID]   INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_CMRC_Categories] PRIMARY KEY CLUSTERED ([CategoryID] ASC)
);


GO
