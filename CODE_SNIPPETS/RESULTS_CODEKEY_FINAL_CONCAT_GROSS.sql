SELECT 
CPTCODEKEY.RESULTKEY,
CPTCODEKEY.CPT88302,
CPTCODEKEY.CPT88304, 
CPTCODEKEY.CPT88305, 
CPTCODEKEY.CPT88307, 
CPTCODEKEY.CPT88309,  
description, 
CONCAT(ResultSection.sectionValue, TEMP.VAL) AS sectionValue 
FROM 
(SELECT ResultSection.sectionValue AS VAL, 
ResultSection.resultKey AS KEYY 
FROM ResultSection
WHERE sectionValue <> ' ' 
and ResultSection.sectionValue <>' No diagnosis; performed technical only '
and ResultSection.sectionCategory like '%PATHOLOGIC DIAGNOSIS%'
and ResultSection.resultKey in 
( select RESULTKEY from CPTcodekey )
) AS TEMP 
LEFT JOIN ResultSection ON TEMP.KEYY = ResultSection.resultKey
LEFT JOIN CPTCODEKEY ON ResultSection.resultKey = CPTCODEKEY.resultkey
LEFT JOIN mapResultRequestedProcedure ON ResultSection.resultKey  = mapResultRequestedProcedure.resultKey 
LEFT JOIN RequestedProcedure ON mapResultRequestedProcedure.requestedProcedureKey = RequestedProcedure.requestedProcedureKey
LEFT JOIN FillerOrder ON RequestedProcedure.fillerOrderKey = FillerOrder.fillerOrderKey
LEFT JOIN PlacerOrder ON FillerOrder.placerOrderKey = PlacerOrder.placerOrderKey
LEFT JOIN ExamCode ON PlacerOrder.examCodeKey = ExamCode.examCodeKey
WHERE sectionValue <> ' ' 
and ResultSection.sectionCategory like '%gross%' 
and description is not null 
--order by cptcodekey.resultkey
