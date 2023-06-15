SELECT *
FROM [Clinic].[Patient] AS P

LEFT JOIN [Clinic].[Ban] B on b.patient_id = p.id
LEFT JOIN [Clinic].[Ingredients] I on I.id = B.ingredient_id

WHERE (P.name = 'Anne' OR  P.name = 'Shay' OR P.surname = 'Hodge') AND B.patient_id IS NOT NULL

ORDER BY I.name ASC;