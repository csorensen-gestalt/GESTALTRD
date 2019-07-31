

DROP TABLE RS

CREATE TABLE RS
(
SC VARCHAR(255),
RSK UNIQUEIDENTIFIER,
RK UNIQUEIDENTIFIER,
SV NVARCHAR(MAX)
)

INSERT INTO RS
SELECT  sectionCategory, resultSectionKey, resultKey, sectionValue
FROM ResultSection

SELECT *
FROM RS
WHERE SC LIKE '%GROSS%'

UPDATE RS
SET SV = REPLACE(SV, Contact.givenName,'P@T!3NT N@M3')
FROM 
(
Patient LEFT JOIN mapPatientContact ON Patient.patientKey = mapPatientContact.patientKey
LEFT JOIN Contact ON mapPatientContact.contactKey = Contact.contactKey
LEFT JOIN FillerOrder ON Patient.patientKey = FillerOrder.patientKey
LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey
LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey
LEFT JOIN RS ON mapResultRequestedProcedure.resultKey = RS.RK
)
WHERE SC LIKE '%GROSS%'

UPDATE RS
SET SV = REPLACE(SV, Contact.familyName,'P@T!3NT N@M3')
FROM 
(
Patient LEFT JOIN mapPatientContact ON Patient.patientKey = mapPatientContact.patientKey
LEFT JOIN Contact ON mapPatientContact.contactKey = Contact.contactKey
LEFT JOIN FillerOrder ON Patient.patientKey = FillerOrder.patientKey
LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey
LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey
LEFT JOIN RS ON mapResultRequestedProcedure.resultKey = RS.RK
)

SELECT *
FROM RS
WHERE SC LIKE '%GROSS%'

DROP TABLE RS