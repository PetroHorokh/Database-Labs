SELECT DISTINCT
	P.name AS patient_name,
	P.middlename AS patient_middlename,
	P.surname AS patient_surname,
	I.name AS Illness,
	T.diagnosis,
	T.treatment_start AS start_of_treatment,
	T.treatment_end AS end_of_treatment,
	STRING_AGG(M.name, ', ' ) WITHIN GROUP (ORDER BY T.id DESC) AS Medicines
FROM [Clinic].[Patient] P

RIGHT JOIN [Clinic].[Appeal] A ON A.patient_id=P.id
RIGHT JOIN [Clinic].[Treatment] T ON T.appeal_id=A.id
LEFT JOIN [Clinic].[Illness] I ON I.id=T.illness_id
LEFT JOIN [Clinic].[Receipt] R ON R.treatment_id=T.id
LEFT JOIN [Clinic].[Medicine] M ON M.id=R.medicine_id

GROUP BY P.name, P.surname, I.name, T.diagnosis, P.middlename, T.id, T.treatment_end, T.treatment_start;