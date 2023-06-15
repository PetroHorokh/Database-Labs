DECLARE @Doctor_id uniqueidentifier;

DECLARE Doctor_cursor CURSOR
FOR SELECT 
		id
	FROM [Clinic].[Doctor];

OPEN Doctor_cursor;

FETCH NEXT FROM Doctor_cursor INTO 
    @Doctor_id;

WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE @SQL nvarchar(max), @Person nvarchar(max) = 'Doctor' + CONVERT(varchar(50), @Doctor_id);
		
		SET @SQL = 'CREATE LOGIN [' + @Person + '] WITH PASSWORD = ''password_' + CONVERT(varchar(50), @Doctor_id) + ''';'

		EXEC sp_executesql @SQL;

		SET @SQL = 'CREATE USER [' + @Person + '] FOR LOGIN [' + @Person + ']'

		EXEC sp_executesql @SQL;

		EXEC sp_addrolemember 'doctor', @Person

		FETCH NEXT FROM Doctor_cursor INTO 
			@Doctor_id;
	END;

CLOSE Doctor_cursor;

DEALLOCATE Doctor_cursor;
GO

DECLARE @Patient_id uniqueidentifier;

DECLARE Patient_cursor CURSOR
FOR SELECT
		id
	FROM [Clinic].[Patient];

OPEN Patient_cursor;

FETCH NEXT FROM Patient_cursor INTO 
    @Patient_id;

WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @SQL nvarchar(max), @Person nvarchar(max) = 'Patient' + CONVERT(varchar(50), @Patient_id);
		
		SET @SQL = 'CREATE LOGIN [' + @Person + '] WITH PASSWORD = ''password_' + CONVERT(varchar(50), @Patient_id) + ''';'

		EXEC sp_executesql @SQL;

		SET @SQL = 'CREATE USER [' + @Person + '] FOR LOGIN [' + @Person + ']'

		EXEC sp_executesql @SQL;

		EXEC sp_addrolemember 'patient', @Person

		FETCH NEXT FROM Patient_cursor INTO 
			@Patient_id;
	END;

CLOSE Patient_cursor;

DEALLOCATE Patient_cursor;
GO

CREATE LOGIN [admin] WITH PASSWORD = 'password_admin'
CREATE USER [admin] FOR LOGIN [admin]