SELECT D.name AS doctor_name, D.surname AS doctor_surname, P.name AS patient_name, P.surname AS patient_surname
FROM [Clinic].[Doctor] D

RIGHT JOIN [Clinic].[Treatment] T ON T.doctor_id=D.id
LEFT JOIN [Clinic].[Appeal] A ON A.id=T.appeal_id
INNER JOIN [Clinic].[Patient] P ON P.id=A.patient_id

WHERE T.treatment_end IS NULL;