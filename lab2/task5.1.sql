SELECT *

FROM [Clinic].[Ingredients] I

WHERE I.name LIKE 'S%' OR I.name IN ('Hypromellose', 'Lactose')