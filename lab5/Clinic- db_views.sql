CREATE OR ALTER VIEW [Clinic].[Patient_view]
AS
SELECT P.name + ' ' + P.middlename + ' ' + P.surname AS Patient_name, P.address AS Patient_address, D.name + ' ' + D.surname AS Family_docotor_name
FROM [Clinic].[Patient] P
LEFT JOIN [Clinic].[Doctor] D ON D.id=P.family_doctor_id

WHERE CONVERT(nvarchar(50), P.id)=SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME()));
GO

CREATE OR ALTER VIEW [Clinic].[Patient_appeal_view]
AS
SELECT A.text AS Appeal_text
FROM [Clinic].[Appeal] A

WHERE CONVERT(nvarchar(50), A.patient_id)=SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME()));
GO

CREATE OR ALTER VIEW [Clinic].[Patient_treatment_view]
AS
SELECT T.diagnosis AS Diagnosis, I.name, D.name + ' ' + D.surname AS Doctor_name, T.treatment_start AS Treatment_start, T.treatment_end AS Treatment_end
FROM [Clinic].[Treatment] T
LEFT JOIN [Clinic].[Illness] I ON I.id=T.illness_id
RIGHT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
LEFT JOIN [Clinic].[Doctor] D ON D.id=T.doctor_id

WHERE CONVERT(nvarchar(50), A.patient_id)=SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME()));
GO

CREATE OR ALTER VIEW [Clinic].[Medicine_view]
AS
SELECT M.id AS Medicine_id, M.name AS Medicine_name, STRING_AGG(I.name, ', ') AS Medicine_ingredients
FROM [Clinic].[Medicine] M
LEFT JOIN [Clinic].[Composition] C ON C.medicine_id=M.id
LEFT JOIN [Clinic].[Ingredient] I ON I.id=C.ingredient_id

GROUP BY M.id, M.name;
GO

CREATE OR ALTER VIEW [Clinic].[Patient_medicine_view]
AS
SELECT M.id AS Medicine_id, M.name AS Medicine_name, STRING_AGG(I.name, ', ') AS Medicine_ingredients
FROM [Clinic].[Medicine] M
LEFT JOIN [Clinic].[Composition] C ON C.medicine_id=M.id
LEFT JOIN [Clinic].[Ingredient] I ON I.id=C.ingredient_id
RIGHT JOIN [Clinic].[Receipt] R ON R.medicine_id=M.id
LEFT JOIN [Clinic].[Treatment] T ON T.id=R.treatment_id
LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id

WHERE CONVERT(nvarchar(50), A.patient_id)=SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME()))

GROUP BY M.id, M.name;
GO

CREATE OR ALTER VIEW [Clinic].[Illness_view]
AS
SELECT I.name, STRING_AGG(S.description, ', ') AS Symptoms
FROM [Clinic].[Illness] I
LEFT JOIN [Clinic].[Illness_type] It ON It.id=I.illness_type_id
LEFT JOIN [Clinic].[Symptom_complex] Sc ON Sc.illness_id=I.id
LEFT JOIN [Clinic].[Symptom] S ON S.id=Sc.symptom_id

GROUP BY I.name;
GO

CREATE OR ALTER VIEW [Clinic].[Patient_illness_view]
AS
SELECT I.name, STRING_AGG(S.description, ', ') AS Symptoms
FROM [Clinic].[Illness] I
LEFT JOIN [Clinic].[Illness_type] It ON It.id=I.illness_type_id
LEFT JOIN [Clinic].[Symptom_complex] Sc ON Sc.illness_id=I.id
LEFT JOIN [Clinic].[Symptom] S ON S.id=Sc.symptom_id
RIGHT JOIN [Clinic].[Treatment] T ON T.illness_id=I.id
LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id

WHERE CONVERT(nvarchar(50), A.patient_id)=SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME()))

GROUP BY I.name;
GO

CREATE OR ALTER VIEW [Clinic].[Doctor_family_patient_view]
AS
SELECT P.name + ' ' + P.middlename + ' ' + P.surname AS Patient_name, P.identification_number AS Identification_number, P.address AS Address
FROM [Clinic].[Doctor] D 
LEFT JOIN [Clinic].[Patient] P ON P.family_doctor_id=D.id

WHERE CONVERT(nvarchar(50), D.id)=SUBSTRING(SUSER_NAME(),7,LEN(SUSER_NAME()));
GO

CREATE OR ALTER VIEW [Clinic].[Doctor_patient_ban_view]
AS
SELECT P.name + ' ' + P.middlename + ' ' + P.surname AS Patient_name, STRING_AGG(I.name, ', ') AS Bans
FROM [Clinic].[Doctor] D 
RIGHT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id
LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
LEFT JOIN [Clinic].[Ban] B ON B.patient_id=P.id
LEFT JOIN [Clinic].[Ingredient] I ON I.id=B.ingredient_id

WHERE CONVERT(nvarchar(50), D.id)=SUBSTRING(SUSER_NAME(),7,LEN(SUSER_NAME()))

GROUP BY P.id, P.name + ' ' + P.middlename + ' ' + P.surname;

GO

CREATE OR ALTER VIEW [Clinic].[Doctor_treatment_view]
AS
SELECT T.id AS Treatment_id, T.doctor_id AS Treatment_doctor_id, T.illness_id AS Illness_id, T.diagnosis AS Diagnosis, T.treatment_start AS Treatment_start
FROM [Clinic].[Doctor] D 
RIGHT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id

WHERE CONVERT(nvarchar(50), D.id)=SUBSTRING(SUSER_NAME(),7,LEN(SUSER_NAME()))
GO

CREATE OR ALTER VIEW [Clinic].[Family_doctor_patient_treatment_view]
AS
SELECT P.name + ' ' + P.middlename + ' ' + P.surname AS Patient_name, A.id AS Apppeal_id, A.text AS Appeal_text, T.doctor_id AS Doctor_id
FROM [Clinic].[Doctor] D
RIGHT JOIN [Clinic].[Patient] P ON P.family_doctor_id=D.id
RIGHT JOIN [Clinic].[Appeal] A ON A.patient_id=P.id
LEFT JOIN [Clinic].[Treatment] T ON T.appeal_id=A.id

WHERE CONVERT(nvarchar(50), D.id)=SUBSTRING(SUSER_NAME(),7,LEN(SUSER_NAME()));
GO

CREATE OR ALTER VIEW [Clinic].[Doctor_reciept_view]
AS
SELECT I.name AS Illness_name, T.id AS Treatment_id, M.name AS Medicine_name
FROM [Clinic].[Doctor] D
RIGHT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id
LEFT JOIN [Clinic].[Illness] I ON I.id=T.illness_id
LEFT JOIN [Clinic].[Receipt] R ON R.treatment_id=T.id
LEFT JOIN [Clinic].[Medicine] M ON M.id=R.medicine_id

WHERE CONVERT(nvarchar(50), D.id)=SUBSTRING(SUSER_NAME(),7,LEN(SUSER_NAME()));	
GO

CREATE OR ALTER VIEW [Clinic].[Patient_reciept_view]
AS
SELECT I.name AS Illness_name, A.text AS Appeal_text, M.name AS Medicine_name
FROM [Clinic].[Patient] P
RIGHT JOIN [Clinic].[Appeal] A ON A.patient_id=P.id
RIGHT JOIN [Clinic].[Treatment] T ON T.appeal_id=A.id
LEFT JOIN [Clinic].[Illness] I ON I.id=T.illness_id
LEFT JOIN [Clinic].[Receipt] R ON R.treatment_id=T.id
LEFT JOIN [Clinic].[Medicine] M ON M.id=R.medicine_id

WHERE CONVERT(nvarchar(50), P.id)=SUBSTRING(SUSER_NAME(),8,LEN(SUSER_NAME()));	
GO