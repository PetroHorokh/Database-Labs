IF NOT EXISTS 
( 
	SELECT  *
    FROM    sys.schemas
    WHERE   name = N'Clinic' 
)
    EXEC('CREATE SCHEMA [Clinic]');
GO

DROP TABLE IF EXISTS [Clinic].[Special_account];
DROP TABLE IF EXISTS [Clinic].[Receipt];
DROP TABLE IF EXISTS [Clinic].[Speciality];
DROP TABLE IF EXISTS [Clinic].[Composition];
DROP TABLE IF EXISTS [Clinic].[Symptom_complex];
DROP TABLE IF EXISTS [Clinic].[Ban];
DROP TABLE IF EXISTS [Clinic].[Symptom];
DROP TABLE IF EXISTS [Clinic].[Medicine];
DROP TABLE IF EXISTS [Clinic].[Ingredient];
DROP TABLE IF EXISTS [Clinic].[Treatment];
DROP TABLE IF EXISTS [Clinic].[Illness];
DROP TABLE IF EXISTS [Clinic].[Illness_type];
DROP TABLE IF EXISTS [Clinic].[Appeal];
DROP TABLE IF EXISTS [Clinic].[Patient];
DROP TABLE IF EXISTS [Clinic].[Doctor];
DROP TABLE IF EXISTS [Clinic].[Category];
GO

CREATE TABLE [Clinic].[Special_account] (
    [patient_id] [uniqueidentifier] NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Special_account] ADD CONSTRAINT [PK_Special_account] PRIMARY KEY ([patient_id]);
GO

CREATE TABLE [Clinic].[Receipt] (
    [treatment_id] [uniqueidentifier] NOT NULL,
	[medicine_id] [uniqueidentifier] NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Receipt] ADD CONSTRAINT [PK_Receipt] PRIMARY KEY ([treatment_id], [medicine_id]);
GO

CREATE TABLE [Clinic].[Speciality] (
    [doctor_id] [uniqueidentifier] NOT NULL,
	[illness_id] [uniqueidentifier] NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Speciality] ADD CONSTRAINT [PK_Speciality] PRIMARY KEY ([doctor_id], [illness_id]);
GO

CREATE TABLE [Clinic].[Composition] (
    [medicine_id] [uniqueidentifier] NOT NULL,
	[ingredient_id] [uniqueidentifier] NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Composition] ADD CONSTRAINT [PK_Composition] PRIMARY KEY ([medicine_id],[ingredient_id]);
GO

CREATE TABLE [Clinic].[Symptom_complex] (
    [illness_id] [uniqueidentifier] NOT NULL,
	[symptom_id] [uniqueidentifier] NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Symptom_complex] ADD CONSTRAINT [PK_Symptom_complex] PRIMARY KEY ([illness_id],[symptom_id]);
GO

CREATE TABLE [Clinic].[Ban] (
    [patient_id] [uniqueidentifier] NOT NULL,
	[ingredient_id] [uniqueidentifier] NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Ban] ADD CONSTRAINT [PK_Ban] PRIMARY KEY ([patient_id], [ingredient_id]);
GO

CREATE TABLE [Clinic].[Symptom] (
    [id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Symptom] ADD CONSTRAINT [PK_Symptom] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Medicine] (
    [id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[effect] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Medicine] ADD CONSTRAINT [PK_Medicine] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Ingredient] (
    [id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Ingredient] ADD CONSTRAINT [PK_Ingredient] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Treatment] (
    [id] [uniqueidentifier] NOT NULL,
	[appeal_id] [uniqueidentifier] NOT NULL,
	[doctor_id] [uniqueidentifier] NULL,
	[illness_id] [uniqueidentifier] NULL,
	[diagnosis] [nvarchar](max) NULL,
	[treatment_rate] [int] NULL,
	[treatment_start] [datetime2](7) NULL,
	[treatment_end] [datetime2](7) NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Treatment] ADD CONSTRAINT [PK_Treatment] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Illness] (
    [id] [uniqueidentifier] NOT NULL,
	[illness_type_id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Illness] ADD CONSTRAINT [PK_Illness] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Illness_type] (
    [id] [uniqueidentifier] NOT NULL,
	[category_id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Illness_type] ADD CONSTRAINT [PK_Illness_type] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Patient] (
    [id] [uniqueidentifier] NOT NULL,
	[family_doctor_id] [uniqueidentifier] NOT NULL,
	[identification_number] [nvarchar](10) NULL,
	[name] [nvarchar](max) NOT NULL,
	[surname] [nvarchar](max) NOT NULL,
	[middlename] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL,
    );
ALTER TABLE [Clinic].[Patient] ADD CONSTRAINT [PK_Patient] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Appeal] (
    [id] [uniqueidentifier] NOT NULL,
	[patient_id] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](max) NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2] NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2] NULL,
    );
ALTER TABLE [Clinic].[Appeal] ADD CONSTRAINT [PK_Appeal] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Doctor] (
    [id] [uniqueidentifier] NOT NULL,
	[category_id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[surname] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Doctor] ADD CONSTRAINT [PK_Doctor] PRIMARY KEY ([id]);
GO

CREATE TABLE [Clinic].[Category] (
    [id] [uniqueidentifier] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[UCR] [nvarchar](max) NULL,
	[DCR] [datetime2](7) NULL,
	[ULR] [nvarchar](max) NULL,
	[DLC] [datetime2](7) NULL,
    );
ALTER TABLE [Clinic].[Category] ADD CONSTRAINT [PK_Category] PRIMARY KEY ([id]);
GO

/* Connections */
ALTER TABLE [Clinic].[Appeal] 
ADD CONSTRAINT [FK_Appeal_Patient] FOREIGN KEY([patient_id])
REFERENCES [Clinic].[Patient] ([id])

ALTER TABLE [Clinic].[Ban] 
ADD CONSTRAINT [FK_Ban_Patient] FOREIGN KEY([patient_id])
REFERENCES [Clinic].[Patient] ([id])

ALTER TABLE [Clinic].[Composition] 
ADD CONSTRAINT [FK_Composition_Ingredient] FOREIGN KEY([ingredient_id])
REFERENCES [Clinic].[Ingredient] ([id])

ALTER TABLE [Clinic].[Composition] 
ADD CONSTRAINT [FK_Composition_Medicine] FOREIGN KEY([medicine_id])
REFERENCES [Clinic].[Medicine] ([id])

ALTER TABLE [Clinic].[Treatment] 
ADD CONSTRAINT [FK_Treatment_Appeal] FOREIGN KEY([appeal_id])
REFERENCES [Clinic].[Appeal] ([id])

ALTER TABLE [Clinic].[Treatment] 
ADD CONSTRAINT [FK_Treatment_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [Clinic].[Doctor] ([id])

ALTER TABLE [Clinic].[Treatment] 
ADD CONSTRAINT [FK_Treatment_Illness] FOREIGN KEY([illness_id])
REFERENCES [Clinic].[Illness] ([id])

ALTER TABLE [Clinic].[Receipt] 
ADD CONSTRAINT [FK_Receipt_Treatment] FOREIGN KEY([treatment_id])
REFERENCES [Clinic].[Treatment] ([id])

ALTER TABLE [Clinic].[Receipt]
ADD CONSTRAINT [FK_Receipt_Medicine] FOREIGN KEY([medicine_id])
REFERENCES [Clinic].[Medicine] ([id])

ALTER TABLE [Clinic].[Speciality] 
ADD CONSTRAINT [FK_Speciality_Doctor] FOREIGN KEY([doctor_id])
REFERENCES [Clinic].[Doctor] ([id])

ALTER TABLE [Clinic].[Speciality]
ADD CONSTRAINT [FK_Speciality_Illness] FOREIGN KEY([illness_id])
REFERENCES [Clinic].[Illness] ([id])

ALTER TABLE [Clinic].[Ban]
ADD CONSTRAINT [FK_Ban_Ingredient] FOREIGN KEY([ingredient_id])
REFERENCES [Clinic].[Ingredient] ([id])

ALTER TABLE [Clinic].[Symptom_complex] 
ADD CONSTRAINT [FK_Symptom_complex_Illness] FOREIGN KEY([illness_id])
REFERENCES [Clinic].[Illness] ([id])

ALTER TABLE [Clinic].[Symptom_complex] 
ADD CONSTRAINT [FK_Symptom_complex_Symptom] FOREIGN KEY([symptom_id])
REFERENCES [Clinic].[Symptom] ([id])

ALTER TABLE [Clinic].[Special_account]
ADD CONSTRAINT [FK_Special_account_Patient] FOREIGN KEY([patient_id])
REFERENCES [Clinic].[Patient] ([id])

ALTER TABLE [Clinic].[Doctor]
ADD CONSTRAINT [FK_Doctor_Category] FOREIGN KEY([category_id])
REFERENCES [Clinic].[Category] ([id])

ALTER TABLE [Clinic].[Patient]
ADD CONSTRAINT [FK_Patient_Doctor] FOREIGN KEY([family_doctor_id])
REFERENCES [Clinic].[Doctor] ([id])

ALTER TABLE [Clinic].[Illness]
ADD CONSTRAINT [FK_Illness_Illness_type] FOREIGN KEY([illness_type_id])
REFERENCES [Clinic].[Illness_type] ([id])

ALTER TABLE [Clinic].[Illness_type]
ADD CONSTRAINT [FK_Illness_type_Category] FOREIGN KEY([category_id])
REFERENCES [Clinic].[Category] ([id])