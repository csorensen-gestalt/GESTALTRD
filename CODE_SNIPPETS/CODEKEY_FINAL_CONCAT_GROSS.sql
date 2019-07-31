SELECT 
CODEKEY.patient_key,
CODEKEY.CPT88302,
CODEKEY.CPT88304, 
CODEKEY.CPT88305, 
CODEKEY.CPT88307, 
CODEKEY.CPT88309,  
description, 
CONCAT(ResultSection.sectionValue, TEMP.VAL) AS sectionValue 
FROM 
(SELECT ResultSection.sectionValue AS VAL, 
Patient.patientKey AS KEYY 
FROM [MClinical].[dbo].[Result] 
LEFT JOIN ResultSection ON Result.resultKey = ResultSection.resultKey 
left join mapResultRequestedProcedure ON Result.resultKey = mapResultRequestedProcedure.resultKey 
left join RequestedProcedure ON mapResultRequestedProcedure.requestedProcedureKey = RequestedProcedure.requestedProcedureKey 
left join FillerOrder ON RequestedProcedure.fillerOrderKey = FillerOrder.fillerOrderKey 
left join PlacerOrder ON FillerOrder.placerOrderKey = PlacerOrder.placerOrderKey 
left join ExamCode ON PlacerOrder.examCodeKey = ExamCode.examCodeKey 
left join Patient on FillerOrder.patientKey = Patient.patientKey 
left join CODEKEY on patient.patientkey = CODEKEY.patient_key 
WHERE sectionValue <> ' ' 
and (ResultSection.sectionValue <>' No diagnosis; performed technical only ') 
and ResultSection.sectionCategory like '%PATHOLOGIC DIAGNOSIS%' 
and description is not null 
and Patient.patientKey in 
( select patient_key from codekey )
) AS TEMP 
LEFT JOIN Patient ON TEMP.KEYY = Patient.patientKey 
LEFT JOIN CODEKEY ON Patient.patientKey = codekey.patient_key 
LEFT JOIN FillerOrder ON  CODEKEY.patient_key = FillerOrder.patientKey 
LEFT JOIN PlacerOrder ON FillerOrder.placerOrderKey = PlacerOrder.placerOrderKey 
LEFT JOIN ExamCode ON PlacerOrder.examCodeKey = ExamCode.examCodeKey 
LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey 
LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey 
LEFT JOIN ResultSection ON mapResultRequestedProcedure.resultKey = ResultSection.resultKey 
WHERE sectionValue <> ' ' 
and (ResultSection.sectionValue <>' No diagnosis; performed technical only ') 
and ResultSection.sectionCategory like '%gross%' 
and description is not null 
and Patient.patientKey in 
( select patient_key from codekey ) 
order by CODEKEY.patient_key
