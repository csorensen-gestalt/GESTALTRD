SELECT 
CPTCODEKEY.CPT88304, 
CPTCODEKEY.CPT88305, 
CPTCODEKEY.CPT88307, 
CPTCODEKEY.CPT88309, 
CPTCODEKEY.CPT88331, 
CPTCODEKEY.CPT88341, 
CPTCODEKEY.CPT88342, 
CPTCODEKEY.CPT88112, 
CPTCODEKEY.CPT88141, 
CPTCODEKEY.CPT88175, 
description, 
ResultSection.sectionValue 
FROM [MClinical].[dbo].[Result] 
LEFT JOIN ResultSection ON Result.resultKey = ResultSection.resultKey 
left join mapResultRequestedProcedure ON Result.resultKey = mapResultRequestedProcedure.resultKey  
left join RequestedProcedure ON mapResultRequestedProcedure.requestedProcedureKey = RequestedProcedure.requestedProcedureKey 
left join FillerOrder ON RequestedProcedure.fillerOrderKey = FillerOrder.fillerOrderKey 
left join PlacerOrder ON FillerOrder.placerOrderKey = PlacerOrder.placerOrderKey 
left join ExamCode ON PlacerOrder.examCodeKey = ExamCode.examCodeKey 
left join Patient on FillerOrder.patientKey = Patient.patientKey 
left join cptcodekey on patient.patientkey = cptcodekey.patient_key 
WHERE sectionValue <> ' ' 
and (ResultSection.sectionValue <>' No diagnosis; performed technical only ') 
and ResultSection.sectionCategory like '%pathologic%' 
and description is not null 
and Patient.patientKey in ( select patient_key from cptcodekey ) order by patient.patientkey
