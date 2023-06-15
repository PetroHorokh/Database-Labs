UPDATE P
SET P.name = 'Shena'

FROM [Clinic].[Patient] P
	JOIN [Clinic].[Ban] B ON B.patient_id=P.id
	JOIN [Clinic].[Ingredients] I ON B.ingredient_id=I.id

WHERE P.identification_number = 0023313211 AND I.name = 'Lactose'