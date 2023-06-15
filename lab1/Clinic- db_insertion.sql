DELETE FROM [Clinic].[Ban];
DELETE FROM [Clinic].[Composition];
DELETE FROM [Clinic].[Symptom_complex];
DELETE FROM [Clinic].[Receipt];
DELETE FROM [Clinic].[Ingredient];
DELETE FROM [Clinic].[Medicine];
DELETE FROM [Clinic].[Special_account];
DELETE FROM [Clinic].[Treatment];
DELETE FROM [Clinic].[Appeal];
DELETE FROM [Clinic].[Patient];
DELETE FROM [Clinic].[Speciality];
DELETE FROM [Clinic].[Doctor];
DELETE FROM [Clinic].[Symptom];
DELETE FROM [Clinic].[Illness];
DELETE FROM [Clinic].[Illness_type];
DELETE FROM [Clinic].[Category];
GO

DECLARE @Category_title nvarchar(max), @Category_id uniqueidentifier

DECLARE Category_cursor CURSOR
FOR SELECT 
		title,
		id
	FROM [Clinic].[Category];

DECLARE @Illness_type_title nvarchar(max), @Illness_type_id uniqueidentifier

DECLARE Illness_type_cursor CURSOR
FOR SELECT 
		title,
		id
	FROM [Clinic].[Illness_type];

DECLARE @Illness_title nvarchar(max), @Illness_id uniqueidentifier

DECLARE Illness_cursor CURSOR
FOR SELECT 
		name,
		id
	FROM [Clinic].[Illness];

DECLARE @Medicine_name nvarchar(max), @Medicine_id uniqueidentifier

DECLARE Medicine_cursor CURSOR
FOR SELECT 
		name,
		id
	FROM [Clinic].[Medicine];

INSERT INTO [Clinic].[Category] (title)
VALUES ('ճ�����');
INSERT INTO [Clinic].[Category] (title)
VALUES ('���������');
INSERT INTO [Clinic].[Category] (title)
VALUES ('������������');
INSERT INTO [Clinic].[Category] (title)
VALUES ('�������');
INSERT INTO [Clinic].[Category] (title)
VALUES ('���������');
INSERT INTO [Clinic].[Category] (title)
VALUES ('�������������');

OPEN Category_cursor;

FETCH NEXT FROM Category_cursor INTO 
    @Category_title,
	@Category_id;

WHILE @@FETCH_STATUS = 0
    BEGIN
		IF @Category_title='ճ�����'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES(@Category_id, '������');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, '�������-������ ������������');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, '����� ������������');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, '����');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, '���������');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, '����', '�����', '���. ��������, 10');
		END
		ELSE IF @Category_title='���������'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '̳�����');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '�������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '��������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '��������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '���������������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '�������� ���');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, '����', '��������', '���. ���������, 15');
		END
		ELSE IF @Category_title='������������'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '��������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '���`�������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '��������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '�����������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '������ ������');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, '���������', '�����������', '���. �������, 20');
		END
		ELSE IF @Category_title='�������'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '��²');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '�����');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '³����� ����');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '��������� ��������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '������������ ������ �������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '����������� �������');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, '����', '���������', '���. �������, 5');
		END
		ELSE IF @Category_title='���������'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '������� �������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '����������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'ó�������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '������� ������� ������������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '������� ���� �����');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, '�����', '���������', '���. ����������, 12');
		END
		ELSE IF @Category_title='�������������'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'ĳ����');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'ó��������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'ó���������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '���������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '�������');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, '���������� ������������');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, '������', '������', '���. ���������� 123');
		END
        FETCH NEXT FROM Category_cursor INTO 
			@Category_title,
			@Category_id;
    END;

CLOSE Category_cursor;

OPEN Illness_type_cursor;

FETCH NEXT FROM Illness_type_cursor INTO 
    @Illness_type_title,
	@Illness_type_id;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @Illness_type_title='��²'
	BEGIN
		INSERT INTO [Clinic].[Illness] (illness_type_id, name)
		VALUES (@Illness_type_id, '��������');
		INSERT INTO [Clinic].[Illness] (illness_type_id, name)
		VALUES (@Illness_type_id, '���������');
		INSERT INTO [Clinic].[Illness] (illness_type_id, name)
		VALUES (@Illness_type_id, '������ ������� ������������ �������');
	END
	FETCH NEXT FROM Illness_type_cursor INTO 
		@Illness_type_title,
		@Illness_type_id;
END;

CLOSE Illness_type_cursor;

INSERT INTO [Clinic].[Symptom] (description)
VALUES ('���������� ����');
INSERT INTO [Clinic].[Symptom] (description)
VALUES ('������');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('�������� ���');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('�`���� ���');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('���� � ����');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('������ ����');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('����������� ����');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('��������');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('���������');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('������ �������');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('ĳ����');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('���������� �������');

OPEN Illness_cursor;

FETCH NEXT FROM Illness_cursor INTO 
    @Illness_title,
	@Illness_id;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @Illness_title='������ ������� ������������ �������'
	BEGIN
		INSERT INTO [Clinic].[Symptom_complex]([illness_id],[symptom_id])
		SELECT @Illness_id, id
		FROM [Clinic].[Symptom]
		WHERE description IN ('���������', '������', '�`���� ���', '�������� ���', '��������', 'ĳ����','���������� �������')
	END
	ELSE IF @Illness_title='��������'
	BEGIN
		INSERT INTO [Clinic].[Symptom_complex]([illness_id],[symptom_id])
		SELECT @Illness_id, id
		FROM [Clinic].[Symptom]
		WHERE description IN ('���������� �������', '������', '�������� ���', '���������� ����', '������ ����', '�`���� ���')
	END
	ELSE IF @Illness_title='���������'
	BEGIN
		INSERT INTO [Clinic].[Symptom_complex]([illness_id],[symptom_id])
		SELECT @Illness_id, id
		FROM [Clinic].[Symptom]
		WHERE description IN ('���� � ����', '������', '���`�������', '�����', '��������', '�������� ���','���������', '������ �������')
	END
	FETCH NEXT FROM Illness_cursor INTO 
		@Illness_title,
		@Illness_id;
END;

CLOSE Illness_cursor;

INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Remdesivir', '���������� ��, �������� ������� ������������');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Lopinavir/Ritonavir', '���������� ��, ���������� �������� SARS-CoV-2');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Favipiravir', '���������� ��, ���������� ������������ �������');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Dexamethasone', '������������� ��, ��������� ��������� � ��������');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Ivermectin', '���������� �� ������������� ��, �������� ��������� ����� �� ���������');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Oseltamivir', '���������� ��, �������� ��������� �����');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Ribavirin', '���������� ��, ���������� ��������� �����');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Cidofovir', '���������� ��, ���������� ��������� �����');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Interferon alpha', '������������ ������ ������, ���������� ��������� �����');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Brincidofovir', '���������� ��, ���������� ��������� �����');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Ibuprofen', '��������� ���������, �������� ���� �� ����');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Acetaminophen', '�������� ����������� ���, �������� ����');

INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Remdesivir');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Favipiravir');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Lopinavir');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Ritonavir');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Colloidal silicon dioxide');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Copovidone');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Sodium stearyl fumarate');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Sorbitan monolaurate');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Dexamethasone');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Propylene glycol');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Lactose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Ivermectin');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Silicone dioxide');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Sodium croscarmellose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Magnesium stearate');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Starch');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Stearic acid');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Talc');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Microcrystalline cellulose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Sodium starch glycolate');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Povidone');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Ethyl cellulose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Triacetin');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Hypromellose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Iron oxide red');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Titanium dioxide');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Yellow iron oxide');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Cidofovir');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Interferon alpha');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Crospovidone');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Mannitol');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Polyethylene glycol');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Polyvinyl alcohol');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Purified water');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Silicified microcrystalline cellulose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Colloidal anhydrous silica');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Sucrose');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Carnauba wax');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Acetaminophen');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Polysorbate 80');
INSERT INTO [Clinic].[Ingredient] (name)
VALUES ('Sucralose');

OPEN Medicine_cursor;

FETCH NEXT FROM Medicine_cursor INTO 
    @Medicine_name,
	@Medicine_id;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @Medicine_name='Remdesivir'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Remdesivir')
	END
	ELSE IF @Medicine_name='Favipiravir'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Favipiravir')
	END
	ELSE IF @Medicine_name='Lopinavir/Ritonavir'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Lopinavir', 'Ritonavir', 'Colloidal silicon dioxide', 'Copovidone', 'Sodium stearyl fumarate', 'Sorbitan monolaurate')
	END
	ELSE IF @Medicine_name='Dexamethasone'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Dexamethasone', 'Propylene glycol', 'Lactose', 'Magnesium stearate', 'Starch')
	END
	ELSE IF @Medicine_name='Ivermectin'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Ivermectin', 'Silicone dioxide', 'Sodium croscarmellose', 'Magnesium stearate', 'Starch')
	END
	ELSE IF @Medicine_name='Oseltamivir'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Stearic acid', 'Talc', 'Sodium croscarmellose')
	END
	ELSE IF @Medicine_name='Ribavirin'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Microcrystalline cellulose', 'Sodium starch glycolate', 'Povidone', 'Ethyl cellulose', 'Triacetin', 'Hypromellose', 'Iron oxide red', 'Titanium dioxide', 'Yellow iron oxide', 'Colloidal silicon dioxide', 'Magnesium stearate')
	END
	ELSE IF @Medicine_name='Cidofovir'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Cidofovir')
	END
	ELSE IF @Medicine_name='Interferon alpha'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Interferon alpha')
	END
	ELSE IF @Medicine_name='Brincidofovir'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Colloidal silicon dioxide', 'Crospovidone', 'Magnesium stearate', 'Mannitol', 'Microcrystalline Cellulose', 'Polyethylene glycol', 'Polyvinyl alcohol', 'Purified water', 'Silicified microcrystalline cellulose','Talc', 'Titanium dioxide')
	END
	ELSE IF @Medicine_name='Ibuprofen'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Lactose', 'Starch', 'Hypromellose', 'Sodium starch glycolate', 'Colloidal anhydrous silica', 'Magnesium stearate', 'Sucrose', 'Talc', 'Titanium dioxide', 'Carnauba wax')
	END
	ELSE IF @Medicine_name='Acetaminophen'
	BEGIN
		INSERT INTO [Clinic].[Composition]([medicine_id],[ingredient_id])
		SELECT @Medicine_id, id
		FROM [Clinic].[Ingredient]
		WHERE name IN ('Acetaminophen', 'Carnauba wax', 'Hypromellose', 'Iron oxide', 'Magnesium stearate', 'Starch', 'Polyethylene glycol', 'Cellulose', 'Purified water', 'Sodium starch glycolate', 'Polysorbate 80', 'Sucralose', 'Titanium dioxide')
	END
	FETCH NEXT FROM Medicine_cursor INTO 
	    @Medicine_name,
		@Medicine_id;
END;

CLOSE Medicine_cursor;

DEALLOCATE Medicine_cursor;
DEALLOCATE Illness_cursor;
DEALLOCATE Illness_type_cursor;
DEALLOCATE Category_cursor;
GO

DECLARE @Doctor_id uniqueidentifier

SELECT TOP 1 @Doctor_id=D.id
FROM [Clinic].[Doctor] D
LEFT JOIN [Clinic].[Category] C ON C.id=D.category_id
WHERE C.title='�������'

INSERT INTO [Clinic].[Patient] (family_doctor_id, name, middlename, surname, identification_number, address)
VALUES (@doctor_id, N'����', N'��������', N'���������', N'1234567890', N'���. �������, 1');
INSERT INTO [Clinic].[Patient] (family_doctor_id, name, middlename, surname, identification_number, address)
VALUES (@doctor_id, N'�����', N'��������', N'���������', N'9876543210', N'��. ��������, 15');

SELECT TOP 1 @Doctor_id=D.id
FROM [Clinic].[Doctor] D
LEFT JOIN [Clinic].[Category] C ON C.id=D.category_id
WHERE C.title='���������'

INSERT INTO [Clinic].[Patient] (family_doctor_id, name, middlename, surname, identification_number, address)
VALUES (@doctor_id, N'����', N'�������', N'��������', N'2468135790', N'���. �������, 25');
GO

DECLARE @Patient_id uniqueidentifier, @Appeal_id uniqueidentifier, @Doctor_id uniqueidentifier, @Illness_id uniqueidentifier

SELECT TOP 1 @Patient_id=P.id
FROM [Clinic].[Patient] P
WHERE P.identification_number='2468135790'

INSERT INTO [Clinic].[Appeal] (patient_id,text)
VALUES (@Patient_id, N'�������� ���, ³�������� �����, ³�������� ����');

SELECT TOP 1 @Appeal_id=A.id
FROM [Clinic].[Appeal] A
LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
WHERE P.identification_number='2468135790' AND (A.text LIKE '%�������� ���%' OR A.text LIKE '%³�������� ����%')

SELECT TOP 1 @Doctor_id=D.id
FROM [Clinic].[Doctor] D
LEFT JOIN [Clinic].[Category] C ON C.id=D.category_id
WHERE C.title='�������'

SELECT TOP 1 @Illness_id=I.id
FROM [Clinic].[Illness] I
WHERE I.name='���������'

INSERT INTO [Clinic].[Treatment](appeal_id,doctor_id,illness_id,treatment_start)
VALUES(@Appeal_id, @Doctor_id, @Illness_id, '2022-01-01 00:00:00')