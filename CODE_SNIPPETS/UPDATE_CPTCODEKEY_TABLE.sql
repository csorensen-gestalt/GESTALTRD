UPDATE CPTCODEKEY
SET cpt88304 = 1
WHERE CPTCODEKEY.patient_key IN
(
SELECT DISTINCT Patient.patientKey
FROM PATIENT 
LEFT JOIN FillerOrder ON Patient.patientKey = FillerOrder.patientKey
LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey
LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey
LEFT JOIN ResultSection ON mapResultRequestedProcedure.resultKey = ResultSection.resultKey


WHERE 
(
sectionValue LIKE '%88304%'
--sectionValue LIKE '%88305%'
--sectionValue LIKE '%88307%'
--sectionValue LIKE '%88309%'
--sectionValue LIKE '%88331%'
--sectionValue LIKE '%88341%'
--sectionValue LIKE '%88342%'
--sectionValue LIKE '%88112%'
--sectionValue LIKE '%88141%'
--sectionValue LIKE '%88175%'

)
AND
(
sectionCategory LIKE '%COMMENT%'
OR sectionCategory LIKE '%PATHOLOG%'
OR sectionCategory LIKE '%SPECIMEN%'
OR sectionCategory LIKE '%DESC%'
)
)

UPDATE CPTCODEKEY
SET cpt88304 = 0
WHERE cpt88304 IS NULL
