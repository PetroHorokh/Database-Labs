CREATE OR ALTER PROCEDURE [Clinic].[Amount_for_special_acounts] @Doctor_id uniqueidentifier
AS

DECLARE @temp AS int

SELECT 
	@temp=COUNT(*)
FROM
(
	SELECT
		Sa.patient_id
	FROM [Clinic].[Doctor] D
	LEFT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id
	LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
	LEFT JOIN [Clinic].[Patient] P ON P.id=A.patient_id
	LEFT JOIN [Clinic].[Special_account] Sa ON Sa.patient_id=P.id

	WHERE D.id=@Doctor_id
	UNION
	SELECT
		Sa.patient_id
	FROM [Clinic].[Doctor] D
	RIGHT JOIN [Clinic].[Patient] P ON P.family_doctor_id=D.id
	RIGHT JOIN [Clinic].[Special_account] Sa ON Sa.patient_id=P.id

	WHERE D.id=@Doctor_id

) AS RES

WHERE RES.patient_id IS NOT NULL

RETURN @temp

