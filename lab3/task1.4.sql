CREATE OR ALTER PROCEDURE [Clinic].[Amount_for_treatments] @Doctor_id uniqueidentifier
AS

DECLARE @temp AS int

SELECT @temp=COUNT(T.id)
	FROM [Clinic].[Doctor] D

	RIGHT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id

	GROUP BY D.id

	HAVING D.id=@Doctor_id
RETURN @temp