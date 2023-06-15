SELECT D.name, D.surname, YEAR(T.treatment_start) AS Year
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 1 THEN T.Qty END), 0) AS Jan
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 2 THEN T.Qty END), 0) AS Feb 
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 3 THEN T.Qty END), 0) AS Mar
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 4 THEN T.Qty END), 0) AS Apr
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 5 THEN T.Qty END), 0) AS May
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 6 THEN T.Qty END), 0) AS Jun
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 7 THEN T.Qty END), 0) AS Jul
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 8 THEN T.Qty END), 0) AS Aug
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 9 THEN T.Qty END), 0) AS Sep
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 10 THEN T.Qty END), 0) AS Oct
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 11 THEN T.Qty END), 0) AS Nov
,ISNULL(SUM(CASE WHEN MONTH(t.treatment_start) = 12 THEN T.Qty END), 0) AS Dec
FROM
(
	SELECT TT.doctor_id, TT.treatment_start, COUNT(TT.appeal_id) AS Qty
	FROM [Clinic].[Treatment] TT

	GROUP BY TT.doctor_id, TT.appeal_id, TT.treatment_start
) T

LEFT JOIN [Clinic].[Doctor] D ON D.id=T.doctor_id

group by D.name, D.surname, Year(t.treatment_start);