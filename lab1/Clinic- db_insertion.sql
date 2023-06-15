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
VALUES ('Хірургія');
INSERT INTO [Clinic].[Category] (title)
VALUES ('Неврологія');
INSERT INTO [Clinic].[Category] (title)
VALUES ('Офтальмологія');
INSERT INTO [Clinic].[Category] (title)
VALUES ('Педіатрія');
INSERT INTO [Clinic].[Category] (title)
VALUES ('Кардіологія');
INSERT INTO [Clinic].[Category] (title)
VALUES ('Ендокринологія');

OPEN Category_cursor;

FETCH NEXT FROM Category_cursor INTO 
    @Category_title,
	@Category_id;

WHILE @@FETCH_STATUS = 0
    BEGIN
		IF @Category_title='Хірургія'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES(@Category_id, 'Травми');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, 'Серцево-судинні захворювання');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, 'Ракові захворювання');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, 'Грижі');
			INSERT INTO [Clinic].[Illness_type] ([category_id], [title])
			VALUES (@Category_id, 'Апендицит');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, 'Іван', 'Мороз', 'вул. Шевченка, 10');
		END
		ELSE IF @Category_title='Неврологія'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Мігрень');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Епілепсія');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Паркінсон');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Деменція');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Нейрофіброматоз');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Головний біль');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, 'Марія', 'Сидорова', 'вул. Корольова, 15');
		END
		ELSE IF @Category_title='Офтальмологія'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Глаукома');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Кон`юнктивіт');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Блефарит');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Кератоконус');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Розрив сітківки');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, 'Олександр', 'Васильченко', 'вул. Петлюри, 20');
		END
		ELSE IF @Category_title='Педіатрія'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'ГРВІ');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Ангіна');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Вітряна віспа');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Алергічний дерматит');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Захворювання органів дихання');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Інфекційний гепатит');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, 'Анна', 'Ковальчук', 'вул. Свободи, 5');
		END
		ELSE IF @Category_title='Кардіологія'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Інфаркт міокарда');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Стенокардія');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Аритмія');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Гіпертонія');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Хронічна серцева недостатність');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Вроджені вади серця');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, 'Петро', 'Морозенко', 'вул. Стефанчука, 12');
		END
		ELSE IF @Category_title='Ендокринологія'
		BEGIN
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Діабет');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Гіпотиреоз');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Гіпертиреоз');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Інсулінома');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Ожиріння');
			INSERT INTO [Clinic].[Illness_type] (category_id, title)
			VALUES (@Category_id, 'Надниркова недостатність');
			INSERT INTO [Clinic].[Doctor] (category_id, name, surname, address)
			VALUES (@Category_id, 'Олексій', 'Петров', 'вул. Центральна 123');
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
	IF @Illness_type_title='ГРВІ'
	BEGIN
		INSERT INTO [Clinic].[Illness] (illness_type_id, name)
		VALUES (@Illness_type_id, 'Риновірус');
		INSERT INTO [Clinic].[Illness] (illness_type_id, name)
		VALUES (@Illness_type_id, 'Аденовірус');
		INSERT INTO [Clinic].[Illness] (illness_type_id, name)
		VALUES (@Illness_type_id, 'Тяжкий гострий респіраторний синдром');
	END
	FETCH NEXT FROM Illness_type_cursor INTO 
		@Illness_type_title,
		@Illness_type_id;
END;

CLOSE Illness_type_cursor;

INSERT INTO [Clinic].[Symptom] (description)
VALUES ('Закладення носу');
INSERT INTO [Clinic].[Symptom] (description)
VALUES ('Кашель');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Головний біль');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('М`язові болі');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Біль у горлі');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Втрата нюху');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Подразнення очей');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Слабкість');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Лихоманка');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Втрата апетиту');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Діарея');
INSERT INTO [Clinic].[Symptom] (description)
VALUES('Ускладнене дихання');

OPEN Illness_cursor;

FETCH NEXT FROM Illness_cursor INTO 
    @Illness_title,
	@Illness_id;

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @Illness_title='Тяжкий гострий респіраторний синдром'
	BEGIN
		INSERT INTO [Clinic].[Symptom_complex]([illness_id],[symptom_id])
		SELECT @Illness_id, id
		FROM [Clinic].[Symptom]
		WHERE description IN ('Лихоманка', 'Кашель', 'М`язові болі', 'Головний біль', 'Слабкість', 'Діарея','Ускладнене дихання')
	END
	ELSE IF @Illness_title='Риновірус'
	BEGIN
		INSERT INTO [Clinic].[Symptom_complex]([illness_id],[symptom_id])
		SELECT @Illness_id, id
		FROM [Clinic].[Symptom]
		WHERE description IN ('Ускладнене дихання', 'Кашель', 'Головний біль', 'Закладення носу', 'Втрата нюху', 'М`язові болі')
	END
	ELSE IF @Illness_title='Аденовірус'
	BEGIN
		INSERT INTO [Clinic].[Symptom_complex]([illness_id],[symptom_id])
		SELECT @Illness_id, id
		FROM [Clinic].[Symptom]
		WHERE description IN ('Біль у горлі', 'Кашель', 'Кон`юнктивіт', 'Висип', 'Слабкість', 'Головний біль','Лихоманка', 'Втрата апетиту')
	END
	FETCH NEXT FROM Illness_cursor INTO 
		@Illness_title,
		@Illness_id;
END;

CLOSE Illness_cursor;

INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Remdesivir', 'Антивірусна дія, зниження тяжкості захворювання');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Lopinavir/Ritonavir', 'Антивірусна дія, інгібування протеази SARS-CoV-2');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Favipiravir', 'Антивірусна дія, покращення репараційних процесів');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Dexamethasone', 'Протизапальна дія, зменшення запалення і опухання');
INSERT INTO [Clinic].[Medicine](name, effect)
VALUES('Ivermectin', 'Антивірусна та протизапальна дія, зниження реплікації вірусу та запалення');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Oseltamivir', 'Антивірусна дія, зниження реплікації вірусу');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Ribavirin', 'Антивірусна дія, інгібування реплікації вірусу');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Cidofovir', 'Антивірусна дія, інгібування реплікації вірусу');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Interferon alpha', 'Стимулювання імунної відповіді, інгібування реплікації вірусу');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Brincidofovir', 'Антивірусна дія, інгібування реплікації вірусу');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Ibuprofen', 'Зменшення запалення, зниження болю та жару');
INSERT INTO [Clinic].[Medicine] (name, effect)
VALUES ('Acetaminophen', 'Зниження температури тіла, зниження болю');

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
WHERE C.title='Педіатрія'

INSERT INTO [Clinic].[Patient] (family_doctor_id, name, middlename, surname, identification_number, address)
VALUES (@doctor_id, N'Іван', N'Петрович', N'Ковальчук', N'1234567890', N'вул. Головна, 1');
INSERT INTO [Clinic].[Patient] (family_doctor_id, name, middlename, surname, identification_number, address)
VALUES (@doctor_id, N'Олена', N'Василівна', N'Сидоренко', N'9876543210', N'пр. Шевченка, 15');

SELECT TOP 1 @Doctor_id=D.id
FROM [Clinic].[Doctor] D
LEFT JOIN [Clinic].[Category] C ON C.id=D.category_id
WHERE C.title='Кардіологія'

INSERT INTO [Clinic].[Patient] (family_doctor_id, name, middlename, surname, identification_number, address)
VALUES (@doctor_id, N'Марія', N'Іванівна', N'Петренко', N'2468135790', N'вул. Київська, 25');
GO

DECLARE @Patient_id uniqueidentifier, @Appeal_id uniqueidentifier, @Doctor_id uniqueidentifier, @Illness_id uniqueidentifier

SELECT TOP 1 @Patient_id=P.id
FROM [Clinic].[Patient] P
WHERE P.identification_number='2468135790'

INSERT INTO [Clinic].[Appeal] (patient_id,text)
VALUES (@Patient_id, N'Головний біль, Відсутність смаку, Відсутність нюху');

SELECT TOP 1 @Appeal_id=A.id
FROM [Clinic].[Appeal] A
LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
WHERE P.identification_number='2468135790' AND (A.text LIKE '%Головний біль%' OR A.text LIKE '%Відсутність нюху%')

SELECT TOP 1 @Doctor_id=D.id
FROM [Clinic].[Doctor] D
LEFT JOIN [Clinic].[Category] C ON C.id=D.category_id
WHERE C.title='Педіатрія'

SELECT TOP 1 @Illness_id=I.id
FROM [Clinic].[Illness] I
WHERE I.name='Аденовірус'

INSERT INTO [Clinic].[Treatment](appeal_id,doctor_id,illness_id,treatment_start)
VALUES(@Appeal_id, @Doctor_id, @Illness_id, '2022-01-01 00:00:00')