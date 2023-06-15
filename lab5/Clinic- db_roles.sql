CREATE ROLE patient;
CREATE ROLE doctor;
GO

GRANT SELECT
ON OBJECT::[Clinic].[Patient_view]
TO patient;
GRANT SELECT, INSERT
ON OBJECT::[Clinic].[Patient_appeal_view]
TO patient;
GRANT SELECT
ON OBJECT::[Clinic].[Patient_treatment_view]
TO patient;
GRANT SELECT
ON OBJECT::[Clinic].[Patient_reciept_view]
TO patient;
GRANT SELECT
ON OBJECT::[Clinic].[Patient_medicine_view]
TO patient;
GRANT SELECT
ON OBJECT::[Clinic].[Patient_illness_view]
TO patient;


GRANT SELECT
ON OBJECT::[Clinic].[Doctor_family_patient_view]
TO doctor;
GRANT SELECT, INSERT, UPDATE
ON OBJECT::[Clinic].[Family_doctor_patient_treatment_view]
TO doctor;
GRANT SELECT
ON OBJECT::[Clinic].[Doctor_patient_ban_view]
TO doctor;
GRANT SELECT, UPDATE
ON OBJECT::[Clinic].[Doctor_treatment_view]
TO doctor;
GRANT SELECT, INSERT, DELETE
ON OBJECT::[Clinic].[Doctor_reciept_view]
TO doctor;
GRANT SELECT
ON OBJECT::[Clinic].[Medicine_view]
TO doctor;
GRANT SELECT
ON OBJECT::[Clinic].[Illness_view]
TO doctor;
GO

GRANT SELECT
ON [Clinic].[Special_account]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Receipt]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Speciality]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Composition]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Symptom_complex]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Ban]([UCR],[UCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Symptom]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Medicine]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Ingredient]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Treatment]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Illness]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Illness_type]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Appeal]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Patient]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Doctor]([UCR],[DCR],[ULR],[DLC]) TO admin;
GRANT SELECT
ON [Clinic].[Category]([UCR],[DCR],[ULR],[DLC]) TO admin;