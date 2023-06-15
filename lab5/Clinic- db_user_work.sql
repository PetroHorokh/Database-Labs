EXECUTE AS LOGIN = 'PatientB2D3574C-61B4-4D65-AA5A-3F4527A8B31C';

SELECT *
FROM [Clinic].[Patient_view];

SELECT *
FROM [Clinic].[Patient_appeal_view];

INSERT INTO [Clinic].[Patient_appeal_view](Appeal_text)
VALUES('Головний біль, Відсутність смаку, Відсутність нюху');

SELECT *
FROM [Clinic].[Patient_appeal_view];

SELECT *
FROM [Clinic].[Patient_treatment_view];

SELECT *
FROM [Clinic].[Patient_reciept_view];

SELECT *
FROM [Clinic].[Patient_illness_view]

SELECT *
FROM [Clinic].[Patient_medicine_view]

REVERT;
GO

EXECUTE AS LOGIN = 'Doctor10BB0A6A-DF9A-4132-9361-7F8B91C9E8B8';

SELECT *
FROM [Clinic].[Doctor_family_patient_view];

SELECT *
FROM [Clinic].[Family_doctor_patient_treatment_view];

INSERT INTO [Clinic].[Family_doctor_patient_treatment_view](Apppeal_id, Doctor_id)
VALUES(N'F4CF424C-1AC3-41F5-8470-BDC2AF3F6077',N'37232786-551F-409B-A58E-67531AB75D7C');

SELECT *
FROM [Clinic].[Doctor_treatment_view];

SELECT *
FROM [Clinic].[Doctor_reciept_view];

REVERT;
GO

EXECUTE AS LOGIN = 'Doctor37232786-551F-409B-A58E-67531AB75D7C';

SELECT *
FROM [Clinic].[Doctor_treatment_view];

SELECT *
FROM [Clinic].[Medicine_view]

SELECT *
FROM [Clinic].[Illness_view]

SELECT *
FROM [Clinic].[Doctor_patient_ban_view]

SELECT *
FROM [Clinic].[Doctor_reciept_view]

UPDATE [Clinic].[Doctor_treatment_view]
SET Diagnosis='Тяжкий гострий респіраторний синдром', Illness_id='75543B37-4CDA-42BE-95E6-25B658B79162'
WHERE Treatment_id='873DBEAF-03E6-45A0-9769-08013966EE82'

REVERT;
GO