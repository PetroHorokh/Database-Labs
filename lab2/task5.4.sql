SELECT *
FROM [Clinic].[Patient] P

WHERE P.id = ALL (
	SELECT B.patient_id
	FROM [Clinic].[Ban] B
);