CREATE OR ALTER TRIGGER [Clinic].[Pav_insert]
   ON [Clinic].[Patient_appeal_view]
   INSTEAD OF INSERT
AS
	INSERT INTO [Clinic].[Appeal]([patient_id], [text])
    SELECT CAST(SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME())) AS uniqueidentifier), Appeal_text FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Dtv_update]
   ON [Clinic].[Doctor_treatment_view]
   INSTEAD OF UPDATE
AS 
	UPDATE [Clinic].[Treatment]
	SET doctor_id=i.Treatment_doctor_id, 
		illness_id=i.Illness_id, 
		diagnosis=i.Diagnosis, 
		treatment_start=i.Treatment_start
	FROM inserted i
	WHERE id=i.Treatment_id
GO

CREATE OR ALTER TRIGGER [Clinic].[Fdpt_update]
	ON [Clinic].[Family_doctor_patient_treatment_view]
	INSTEAD OF UPDATE
AS
	DECLARE @Treatment_id uniqueidentifier, @Appeal_id uniqueidentifier

	SELECT @Appeal_id=i.Apppeal_id FROM inserted i

	SELECT @Treatment_id=T.id
	FROM [Clinic].[Treatment] T
	LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
	WHERE A.id=@Appeal_id

	IF(@Treatment_id IS NOT NULL)
		BEGIN
			RAISERROR('Treatment already apointed',1,1);
		END;
	ELSE
		BEGIN
			INSERT INTO [Clinic].[Treatment](appeal_id, doctor_id)
			SELECT i.Apppeal_id, i.Doctor_id FROM inserted i;
		END;
GO

CREATE OR ALTER TRIGGER [Clinic].[Fdpt_insert]
	ON [Clinic].[Family_doctor_patient_treatment_view]
	INSTEAD OF INSERT
AS
	INSERT INTO [Clinic].[Treatment](appeal_id, doctor_id)
	SELECT i.Apppeal_id, i.Doctor_id FROM inserted i;
GO

CREATE OR ALTER TRIGGER [Clinic].[Drv_insert]
	ON [Clinic].[Doctor_reciept_view]
	INSTEAD OF INSERT
AS
	
	DECLARE @Medicine_id uniqueidentifier, @Medicine_name nvarchar(max)
	
	SELECT @Medicine_name=i.Medicine_name FROM inserted i

	SELECT @Medicine_id=M.id
	FROM [Clinic].[Medicine] M
	WHERE M.name=@Medicine_name

	INSERT INTO [Clinic].[Receipt](treatment_id, medicine_id)
	SELECT i.Treatment_id, @Medicine_id FROM inserted i
GO
