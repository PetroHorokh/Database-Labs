SELECT *

FROM [Clinic].[Patient] AS P

FULL OUTER JOIN [Clinic].[Ban] B on b.patient_id = p.id