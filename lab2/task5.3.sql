SELECT *
FROM [Clinic].[Patient] P

WHERE EXISTS (
	SELECT *
	FROM [Clinic].[Ban] B

	WHERE B.patient_id = P.id
)