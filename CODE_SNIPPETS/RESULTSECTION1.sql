--DROP TABLE #TEMPTABLE
CREATE TABLE #TEMPTABLE
(
	TEMPKEY UNIQUEIDENTIFIER NOT NULL,
	FNAME NVARCHAR(50),
	MNAME NVARCHAR(50),
	LNAME NVARCHAR(50),
	--STREET NVARCHAR(199),
	--PHONE VARCHAR(60),
	--EMAIL VARCHAR(255),
	--SSN NVARCHAR(50),
	--MRN VARCHAR(45),
	--DOB DATETIME,
	--DOBT DATETIME
)

INSERT INTO #TEMPTABLE


SELECT 
Contact.contactKey,
Contact.givenName,
Contact.middleName,
Contact.familyName
--Address.address1,
--PhoneNumber.phoneNumber,
--EmailAddress.emailAddress,
--Patient.ssn,
--Patient.mrnNumeric,
--Patient.patientBirthDateTime,
--Patient.patientBirthDateTimeUTC



FROM 
Contact
--Patient LEFT JOIN mapPatientContact ON Patient.patientKey = mapPatientContact.patientKey
--LEFT JOIN Contact ON mapPatientContact.contactKey = Contact.contactKey
--LEFT JOIN mapContactAddress ON Contact.contactKey = mapContactAddress.contactKey
--LEFT JOIN Address ON mapContactAddress.addressKey = Address.addressKey
--LEFT JOIN mapContactPhoneNumber ON Contact.contactKey = mapContactPhoneNumber.contactKey
--LEFT JOIN PhoneNumber ON mapContactPhoneNumber.phoneNumberKey = PhoneNumber.phoneNumberKey
--LEFT JOIN mapContactEmailAddress ON Contact.contactKey = mapContactEmailAddress.contactKey
--LEFT JOIN EmailAddress ON mapContactEmailAddress.emailAddressKey = EmailAddress.emailAddressKey
--LEFT JOIN FillerOrder ON Patient.patientKey = FillerOrder.patientKey
--LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey
--LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey
--LEFT JOIN ResultSection ON mapResultRequestedProcedure.resultKey = ResultSection.resultKey




SELECT count(distinct FNAME)
FROM #TEMPTABLE

--UPDATE #TEMPTABLE
--SET 

--ssn = FORMAT( 100000000 + ROUND( (999999999-100000000) *RAND(CONVERT(VARBINARY, NEWID())), 0), '###-##-####'),
--mrn = FORMAT((1000000 + ROUND( (9999999-1000000) *RAND(CONVERT(VARBINARY, NEWID())), 0)),'#######'),
--DOB = DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % (DATEDIFF(DAY, '1900/01/01',GETDATE()))), 0),
--DOBT = NULL


UPDATE #TEMPTABLE
SET 
FNAME = 
(
Select top 1 FirstName
From AdventureWorks2017.Person.Person
order by NEWID(), TEMPKEY
)



--UPDATE #TEMPTABLE
--SET 

--MNAME = 
--(
--SELECT TOP(1) middleName
--FROM RandomData.dbo.person
--ORDER BY NEWID(), KEY1
--)
--UPDATE #TEMPTABLE
--SET 

--LNAME = 
--(
--SELECT TOP(1) lastName
--FROM RandomData.dbo.person
--ORDER BY NEWID(), KEY1
--)
--UPDATE #TEMPTABLE
--SET 
--STREET =
--(
--SELECT TOP(1) address
--FROM RandomData.dbo.person
--ORDER BY NEWID(), KEY1
--)
--UPDATE #TEMPTABLE
--SET 
--PHONE = FORMAT(10000000000 + ROUND( (99999999999-10000000000) *RAND(CONVERT(VARBINARY, NEWID())), 0), '#-###-###-####')

--UPDATE #TEMPTABLE
--SET 
--EMAIL = 
--(
--SELECT TOP(1) email
--FROM RandomData.dbo.person
--ORDER BY NEWID(), KEY1
--)

SELECT COUNT(DISTINCT TEMPKEY) AS COUNT, COUNT(DISTINCT FNAME) AS COUNTNAME 
FROM #TEMPTABLE
--ORDER BY FNAME, KEY1

SELECT * 
FROM #TEMPTABLE
DROP TABLE #TEMPTABLE