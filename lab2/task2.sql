SELECT SUM(Bans.Amount_of_bans) AS Amount_of_bans
FROM(
	SELECT COUNT(*) AS Amount_of_bans
FROM [Clinic].[Patient] AS P

LEFT JOIN [Clinic].[Ban] B ON B.patient_id = P.id

WHERE B.patient_id IS NOT NULL

GROUP BY P.id
) AS Bans