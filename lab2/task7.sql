SELECT *
FROM [Clinic].[Patient] P

WHERE P.id = ANY(
	SELECT B.patient_id
	FROM [Clinic].[Ban] B
);