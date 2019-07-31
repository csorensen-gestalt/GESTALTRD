
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE _ANONYMIZATION_OF_PHI 

AS
BEGIN

UPDATE Patient
SET 

ssn = FORMAT( 100000000 + ROUND( (999999999-100000000) *RAND(CONVERT(VARBINARY, NEWID())), 0), '###-##-####'),
mrnNumeric = ( 1000000 + ROUND( (9999999-1000000) *RAND(CONVERT(VARBINARY, NEWID())), 0)),
patientDeathDateTime = DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % (DATEDIFF(DAY, '1900/01/01',GETDATE()))), 0),
patientBirthDateTimeUTC = NULL


UPDATE Contact
SET

givenName = 
(
SELECT TOP(1) fName
FROM RandomData.dbo.person
ORDER BY NEWID(), contactKey
)
,

middleName = 
(
SELECT TOP(1) middleName
FROM RandomData.dbo.person
ORDER BY NEWID(), contactKey
)
,

familyName = 
(
SELECT TOP(1) lastName
FROM RandomData.dbo.person
ORDER BY NEWID(), contactKey
)

UPDATE Address
SET

address1 = 
(
SELECT TOP(1) address
FROM RandomData.dbo.person
ORDER BY NEWID(), addressKey
)
,

Address2 = null,
Address3 = null
--,postalZipCode = (10000 + ROUND( (99999-10000) *RAND(CONVERT(VARBINARY, NEWID())), 0))


UPDATE EmailAddress
SET

emailAddress = 
(
SELECT TOP(1) email
FROM RandomData.dbo.person
ORDER BY NEWID(), emailAddressKey
)

UPDATE phoneNumber
SET

phoneNumber = FORMAT(10000000000 + ROUND( (99999999999-10000000000) *RAND(CONVERT(VARBINARY, NEWID())), 0), '#-###-###-####')


END
GO
