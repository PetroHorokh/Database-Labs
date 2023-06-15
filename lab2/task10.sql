SELECT 'AMOUNT OF INGREDIENTS' AS MEDICINE, [Nortriptyline] AS Nortriptyline, [Ibuprofen] AS Ibuprofen
--SELECT FromTable.MEDICINE, FromTable.AMOUNT_OF_INGREDIENTS
FROM 
(
	SELECT M.name AS MEDICINE, I.name AS INGREDIENT
	FROM [Clinic].[Ingredients] I

	LEFT JOIN [Clinic].[Composition] C ON I.id=C.ingredient_id
	LEFT JOIN [Clinic].[Medicine] M ON M.id=C.medicine_id

) AS FromTable
PIVOT
(
	COUNT(INGREDIENT)
	FOR MEDICINE IN ([Nortriptyline], [Ibuprofen])
) AS PivotTable