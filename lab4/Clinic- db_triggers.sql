CREATE OR ALTER TRIGGER [Clinic].[Appeal_insertion]
   ON [Clinic].[Appeal]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Appeal]([id], [patient_id], [text], [UCR], [DCR])
    SELECT NEWID(), patient_id, text, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Appeal_update]
   ON  [Clinic].[Appeal]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Appeal]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Ban_insertion]
   ON [Clinic].[Ban]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Ban]([patient_id], [ingredient_id], [UCR], [DCR])
    SELECT patient_id, ingredient_id, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Ban_update]
   ON  [Clinic].[Ban]
   AFTER UPDATE
AS	
	DECLARE @patient_id uniqueidentifier, @ingredient_id uniqueidentifier

	SELECT @patient_id = i.patient_id, @ingredient_id=i.ingredient_id FROM inserted i

	UPDATE [Clinic].[Ban]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE patient_id=@patient_id AND ingredient_id=@ingredient_id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Category_insertion]
   ON [Clinic].[Category]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Category]([id], [title], [UCR], [DCR])
    SELECT NEWID(), title, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Category_update]
   ON  [Clinic].[Category]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Category]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Composition_insertion]
   ON [Clinic].[Composition]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Composition]([ingredient_id], [medicine_id], [UCR], [DCR])
    SELECT ingredient_id, medicine_id, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Composition_update]
   ON  [Clinic].[Composition]
   AFTER UPDATE
AS	
	DECLARE @medicine_id uniqueidentifier, @ingredient_id uniqueidentifier

	SELECT @medicine_id = i.medicine_id, @ingredient_id=i.ingredient_id FROM inserted i

	UPDATE [Clinic].[Composition]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE medicine_id=@medicine_id AND ingredient_id=@ingredient_id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Doctor_insertion]
   ON [Clinic].[Doctor]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Doctor]([id], [category_id], [name], [surname], [address], [UCR], [DCR])
    SELECT NEWID(), category_id, name, surname, address, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Doctor_update]
   ON  [Clinic].[Doctor]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Doctor]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Illness_insertion]
   ON [Clinic].[Illness]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Illness]([id], [illness_type_id], [name], [UCR], [DCR])
    SELECT NEWID(), illness_type_id, name, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Illness_update]
   ON  [Clinic].[Illness]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Illness]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Illness_type_insertion]
   ON [Clinic].[Illness_type]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Illness_type]([id],[category_id], [title], [UCR], [DCR])
    SELECT NEWID(), category_id, title, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Illness_type_update]
   ON  [Clinic].[Illness_type]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Illness_type]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Ingredient_insertion]
   ON [Clinic].[Ingredient]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Ingredient]([id], [name], [UCR], [DCR])
    SELECT NEWID(), name, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Ingredient_update]
   ON  [Clinic].[Ingredient]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Ingredient]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Medicine_insertion]
   ON [Clinic].[Medicine]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Medicine]([id], [name], [effect], [UCR], [DCR])
    SELECT NEWID(), name, effect, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Medicine_update]
   ON  [Clinic].[Medicine]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Medicine]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Patient_insertion]
   ON [Clinic].[Patient]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Patient]([id], [family_doctor_id], [name], [surname], [middlename], [identification_number], [address], [UCR], [DCR])
    SELECT NEWID(), family_doctor_id, name, surname, middlename, identification_number, address, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Patient_update]
   ON  [Clinic].[Patient]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Patient]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Patient_doctor_check]
	ON [Clinic].[Patient]
	FOR INSERT, UPDATE
AS
	DECLARE @doctor_id uniqueidentifier, @amount_of_patients int

	SELECT @doctor_id=family_doctor_id FROM inserted

	SELECT @amount_of_patients=COUNT(*)
	FROM 
	(
		SELECT DISTINCT P.id AS ID
		FROM [Clinic].[Doctor] D
		LEFT JOIN [Clinic].[Patient] P ON P.family_doctor_id=D.id
		WHERE D.id=@doctor_id
		UNION
		SELECT DISTINCT P.id AS ID
		FROM [Clinic].[Doctor] D
		LEFT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id
		LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
		LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
		WHERE D.id=@doctor_id
	) AS RES

	IF @amount_of_patients > 10
	BEGIN
		RAISERROR('Cannot assign more patients to this doctor( limit is 10)',1,1)
		ROLLBACK TRAN
	END
GO

CREATE OR ALTER TRIGGER [Clinic].[Receipt_insertion]
   ON [Clinic].[Receipt]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Receipt]([treatment_id], [medicine_id], [UCR], [DCR])
    SELECT treatment_id, medicine_id, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Receipt_update]
	ON  [Clinic].[Receipt]
	AFTER UPDATE
AS	
	DECLARE @medicine_id uniqueidentifier, @treatment_id uniqueidentifier

	SELECT @medicine_id = i.medicine_id, @treatment_id=i.treatment_id FROM inserted i

	UPDATE [Clinic].[Receipt]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE medicine_id=@medicine_id AND treatment_id=@treatment_id
GO

CREATE OR ALTER TRIGGER [Clinic].[Receipt_ban_check]
	ON  [Clinic].[Receipt]
    FOR INSERT,UPDATE
AS
	DECLARE @medicine_id uniqueidentifier, @treatment_id uniqueidentifier

	SELECT @medicine_id=medicine_id, @treatment_id=treatment_id FROM inserted

	IF EXISTS
	(
		SELECT *
		FROM [Clinic].[Treatment] T
		INNER JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
		LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
		LEFT JOIN [Clinic].[Ban] B ON B.patient_id=P.id

		WHERE T.id=@treatment_id AND B.ingredient_id IN 
		(
			SELECT I.id
			FROM [Clinic].[Medicine] M
			LEFT JOIN [Clinic].[Composition] C ON C.medicine_id=M.id
			LEFT JOIN [Clinic].[Ingredient] I  ON I.id=C.ingredient_id

			WHERE M.id=@medicine_id
		)
	) 
	BEGIN
		RAISERROR('Cannot prescribe this medicine, because it contains prohibited for patient ingredients',1,1)
		ROLLBACK TRAN
	END	
GO

CREATE OR ALTER TRIGGER [Clinic].[Special_account_insertion]
   ON [Clinic].[Special_account]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Special_account]([patient_id], [UCR], [DCR])
    SELECT patient_id, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Special_account_update]
   ON  [Clinic].[Special_account]
   AFTER UPDATE
AS	
	DECLARE @patient_id uniqueidentifier

	SELECT @patient_id = i.patient_id FROM inserted i

	UPDATE [Clinic].[Special_account]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE patient_id=@patient_id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Speciality_insertion]
   ON [Clinic].[Speciality]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Speciality]([doctor_id], [illness_id], [UCR], [DCR])
    SELECT doctor_id, illness_id, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Speciality_update]
   ON  [Clinic].[Speciality]
   AFTER UPDATE
AS	
	DECLARE @doctor_id uniqueidentifier, @illness_id uniqueidentifier

	SELECT @doctor_id = i.doctor_id, @illness_id=i.illness_id FROM inserted i

	UPDATE [Clinic].[Speciality]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE doctor_id=@doctor_id AND illness_id=@illness_id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Speciality_correctness_check]
	ON  [Clinic].[Speciality]
    FOR INSERT,UPDATE
AS
	DECLARE @doctor_id uniqueidentifier, @illness_id uniqueidentifier

	SELECT @doctor_id=doctor_id, @illness_id=illness_id FROM inserted

	DECLARE @category_of_doctor uniqueidentifier, @category_for_illness_type uniqueidentifier

	SELECT @category_of_doctor=C.id
	FROM [Clinic].[Doctor] D
	LEFT JOIN [Clinic].[Category] C ON C.id=D.category_id
	WHERE D.id=@doctor_id

	SELECT @category_for_illness_type=It.category_id
	FROM [Illness] I
	LEFT JOIN [Illness_type] It ON It.id=I.illness_type_id
	WHERE I.id=@illness_id

	IF @category_for_illness_type!=@category_of_doctor
	BEGIN
		RAISERROR('Cannot specify this doctor as a competent specialist for given illness, because they are working in another category',1,1)
		ROLLBACK TRAN
	END	
GO

CREATE OR ALTER TRIGGER [Clinic].[Symptom_insertion]
   ON [Clinic].[Symptom]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Symptom]([id], [description], [UCR], [DCR])
    SELECT NEWID(), description, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Symptom_update]
   ON  [Clinic].[Symptom]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Symptom]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Symptom_complex_insertion]
   ON [Clinic].[Symptom_complex]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Symptom_complex]([symptom_id], [illness_id], [UCR], [DCR])
    SELECT symptom_id, illness_id, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Symptom_complex_update]
   ON  [Clinic].[Symptom_complex]
   AFTER UPDATE
AS	
	DECLARE @symptom_id uniqueidentifier, @illness_id uniqueidentifier

	SELECT @symptom_id = i.symptom_id, @illness_id=i.illness_id FROM inserted i

	UPDATE [Clinic].[Symptom_complex]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE symptom_id=@symptom_id AND illness_id=@illness_id
GO 

CREATE OR ALTER TRIGGER [Clinic].[Treatment_insertion]
   ON [Clinic].[Treatment]
   INSTEAD OF INSERT
AS 
	INSERT INTO [Clinic].[Treatment]([id], [appeal_id], [doctor_id], [illness_id], [diagnosis], [treatment_start], [treatment_end], [treatment_rate], [UCR], [DCR])
    SELECT NEWID(), appeal_id, doctor_id, illness_id, diagnosis, treatment_start, treatment_end, treatment_rate, USER_NAME(), GETDATE() FROM inserted;
GO

CREATE OR ALTER TRIGGER [Clinic].[Treatment_update]
   ON  [Clinic].[Treatment]
   AFTER UPDATE
AS	
	DECLARE @id AS uniqueidentifier 

	SELECT @id = i.id FROM inserted i

	UPDATE [Clinic].[Treatment]
	SET ULR = USER_NAME(), DLC = GETDATE()
	WHERE id=@id
GO

CREATE OR ALTER TRIGGER [Clinic].[Treatment_correctness_check]
	ON [Clinic].[Treatment]
	FOR INSERT, UPDATE
AS
	DECLARE 
		@doctor_id uniqueidentifier, 
		@amount_of_patients int, 
		@patient_id uniqueidentifier, 
		@treatment_id uniqueidentifier,
		@amount_of_treated_years int

	SELECT @doctor_id=doctor_id, @treatment_id=id FROM inserted

	SELECT DISTINCT @patient_id=P.id FROM [Clinic].[Treatment] T
	LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
	LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
	WHERE T.id=@treatment_id

	SELECT @amount_of_patients=COUNT(*)
	FROM
	(
		SELECT DISTINCT P.id AS ID
		FROM [Clinic].[Doctor] D
		LEFT JOIN [Clinic].[Patient] P ON P.family_doctor_id=D.id
		WHERE D.id=@doctor_id
		UNION
		SELECT DISTINCT P.id AS ID
		FROM [Clinic].[Doctor] D
		LEFT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id
		LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
		LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
		WHERE D.id=@doctor_id
	) AS RES

	SELECT @amount_of_treated_years=SUM(YEAR(T.treatment_start))
	FROM [Clinic].[Patient] P
	RIGHT JOIN [Clinic].[Appeal] A ON A.patient_id=P.id
	LEFT JOIN [Clinic].[Treatment] T ON T.appeal_id=A.id
	WHERE T.treatment_end IS NULL AND P.id=@patient_id

	IF EXISTS
	(
		SELECT *
		FROM [Clinic].[Treatment] T
		LEFT JOIN [Clinic].[Illness] I ON I.id=T.illness_id
		LEFT JOIN [Clinic].[Illness_type] It ON It.id=I.illness_type_id
		LEFT JOIN [Clinic].[Doctor] D ON D.id=T.doctor_id
		WHERE T.id=@treatment_id AND D.category_id!=It.category_id
	)
	BEGIN
		RAISERROR('Cannot assign more patients to this doctor( limit is 10)', 1, 1)
		ROLLBACK TRAN
	END
	IF @amount_of_patients > 10
	BEGIN
		RAISERROR('Cannot assign this doctor to treat given illness', 1, 1)
		ROLLBACK TRAN
	END
	IF EXISTS
	(
		SELECT *
		FROM [Clinic].[Patient] P
		LEFT JOIN [Clinic].[Appeal] A ON A.patient_id=P.id
		LEFT JOIN [Clinic].[Treatment] T ON T.appeal_id=A.id
		WHERE P.id=@patient_id AND DATEDIFF(year, T.treatment_start, GETDATE()) > 3 AND T.treatment_end IS NULL
	)
	BEGIN
		IF EXISTS(SELECT * FROM [Clinic].[Special_account] WHERE patient_id=@patient_id)
			BEGIN
				PRINT 'This patient is in special account list';
			END
		ELSE
			BEGIN
				INSERT INTO [Clinic].[Special_account]([patient_id], [UCR], [DCR])
				VALUES(@patient_id, USER_NAME(), GETDATE());
			END
	END
	IF @amount_of_treated_years >= 7
	BEGIN
		IF EXISTS(SELECT * FROM [Clinic].[Special_account] WHERE patient_id=@patient_id)
			BEGIN
				PRINT 'This patient is in special account list';
			END
		ELSE
			BEGIN
				INSERT INTO [Clinic].[Special_account]([patient_id], [UCR], [DCR])
				VALUES(@patient_id, USER_NAME(), GETDATE())
			END
	END
	ELSE 
	BEGIN
		DELETE FROM [Clinic].[Special_account] WHERE patient_id=@patient_id;
	END
GO