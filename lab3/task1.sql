CREATE OR ALTER PROCEDURE [Clinic].[Doctor_rate] @Doctor_id uniqueidentifier
AS

DECLARE 
	@amount_for_patients AS int, 
	@amount_for_rate AS decimal(10,5), 
	@amount_for_special_acounts AS int, 
	@amount_for_treatments AS int

EXEC @amount_for_patients = [Clinic].[Amount_for_patients] @Doctor_id
EXEC @amount_for_rate = [Clinic].[Amount_for_rate] @Doctor_id
EXEC @amount_for_special_acounts = [Clinic].[Amount_for_special_acounts] @Doctor_id
EXEC @amount_for_treatments = [Clinic].[Amount_for_treatments] @Doctor_id

DECLARE 
	@points_for_patients AS int = @amount_for_patients,
	@points_for_rate AS decimal(10,2) = @amount_for_rate*0.7,
	@points_for_treatment AS int = CASE WHEN @amount_for_special_acounts > 0 THEN 10 ELSE 0 END,
	@points_for_special_acounts AS int = CASE WHEN @amount_for_treatments > 5 then 10 WHEN @amount_for_treatments > 0 THEN 5 ELSE 0 END

SELECT D.name AS 'Name', D.surname AS 'Last name', @points_for_patients+@points_for_rate+@points_for_special_acounts+@points_for_treatment AS 'Rating'
FROM [Clinic].[Doctor] D
WHERE D.id=@Doctor_id