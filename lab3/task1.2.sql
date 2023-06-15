CREATE OR ALTER PROCEDURE [Clinic].[Amount_for_rate] @Doctor_id uniqueidentifier
AS

DECLARE @temp AS decimal(10,5)

SELECT @temp=AVG(T.treatment_rate)
	FROM [Clinic].[Doctor] D

	RIGHT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id

	GROUP BY D.id

	HAVING D.id=@Doctor_id

RETURN @temp

