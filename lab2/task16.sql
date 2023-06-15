CREATE TABLE [Clinic].[Temp](
	[id] [uniqueidentifier] NOT NULL,
	[identification_number] [nvarchar](10) NULL,
	[name] [nvarchar](max) NOT NULL,
	[surname] [nvarchar](max) NOT NULL,
	[middlename] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [Clinic].[Temp] 
	([id],[name],[surname],[middlename],[identification_number],[address]) 
VALUES 
	('E524E481-6C46-BE8D-7183-1817AEA31382','Norman','Chase','Leilani','0023111921','Ap #861-4123 Elit St.'),
	('A34E9713-21F4-8A66-A5D8-2DABE7158D03','Savannah','Meyer','Russell','0103211927','P.O. Box 735, 5111 Non Av.')
GO

SELECT * FROM [Clinic].[Temp]
GO

DELETE FROM [Clinic].[Temp] WHERE name = 'Norman'
GO

SELECT * FROM [Clinic].[Temp]
GO

DROP TABLE IF EXISTS [Clinic].[Temp]
GO