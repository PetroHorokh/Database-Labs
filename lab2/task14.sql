DROP TABLE IF EXISTS [Clinic].[Temp]
GO

CREATE TABLE [Clinic].[Temp](
	[id] [uniqueidentifier] NOT NULL,
	[identification_number] [nvarchar](10) NULL,
	[name] [nvarchar](max) NOT NULL,
	[surname] [nvarchar](max) NOT NULL,
	[middlename] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL,
 CONSTRAINT [PK_Temp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO [Clinic].[Temp] 
	([id],[name],[surname],[middlename],[identification_number],[address],UCR,DCR,ULR,DLC) 
VALUES 
	('E524E481-6C46-BE8D-7183-1817AEA31382','Norman','Chase','Leilani','0023111921','Ap #861-4123 Elit St.',N'dbo','Dec 2, 2023',N'dbo','Dec 2, 2023')
GO

INSERT INTO [Clinic].[Patient]
SELECT * FROM [Clinic].[Temp]

SELECT * FROM [Clinic].[Temp]

DROP TABLE IF EXISTS [Clinic].[Temp]
GO