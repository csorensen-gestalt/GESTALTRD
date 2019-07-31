SELECT COUNT(DISTINCT Patient.patientKey)
FROM PATIENT 
LEFT JOIN FillerOrder ON Patient.patientKey = FillerOrder.patientKey
LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey
LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey
LEFT JOIN ResultSection ON mapResultRequestedProcedure.resultKey = ResultSection.resultKey


WHERE 
(
sectionValue LIKE '%88304%'
OR sectionValue LIKE '%88305%'
OR sectionValue LIKE '%88307%'
OR sectionValue LIKE '%88309%'
OR sectionValue LIKE '%88331%'
OR sectionValue LIKE '%88341%'
OR sectionValue LIKE '%88342%'
OR sectionValue LIKE '%88112%'
OR sectionValue LIKE '%88141%'
OR sectionValue LIKE '%88175%'

)
AND
(
sectionCategory LIKE '%COMMENT%'
OR sectionCategory LIKE '%PATHOLOG%'
OR sectionCategory LIKE '%SPECIMEN%'
OR sectionCategory LIKE '%DESC%'
)