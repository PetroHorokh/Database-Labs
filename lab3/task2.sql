CREATE OR ALTER PROCEDURE [Clinic].[Doctors_rate]
AS

DECLARE @Doctor_id AS uniqueidentifier

DECLARE Doctor_cursor CURSOR
    FOR SELECT
			id
		FROM [Clinic].[Doctor];

OPEN Doctor_cursor;

FETCH NEXT FROM Doctor_cursor INTO 
    @Doctor_id;

WHILE @@FETCH_STATUS = 0
    BEGIN
		EXEC [Clinic].[Doctor_rate] @Doctor_id       
        FETCH NEXT FROM Doctor_cursor INTO 
			@Doctor_id;
    END;

CLOSE Doctor_cursor;

DEALLOCATE Doctor_cursor;	
GO

EXEC [Clinic].[DoctorS_rate];
GO
