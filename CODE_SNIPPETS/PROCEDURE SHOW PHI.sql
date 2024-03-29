USE [MClinical]
GO
/****** Object:  StoredProcedure [dbo].[_SHOW_SENSITIVE_DATA]    Script Date: 7/12/2019 9:26:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[_SHOW_SENSITIVE_DATA]
	-- Add the parameters for the stored procedure here

AS
BEGIN

SELECT --TOP(100) 

Patient.patientKey,
Contact.givenName,
Contact.middleName,
Contact.familyName,
Address.address1,
Address.city,
Address.provinceStateCd,
Address.postalZipCode,
PhoneNumber.phoneNumber,
EmailAddress.emailAddress,
Patient.patientBirthDateTime,
Patient.patientBirthDateTimeUTC,
Patient.mrnNumeric,
Patient.ssn,
ResultSection.resultSectionKey,
ResultSection.sectionValue


FROM 

Patient LEFT JOIN mapPatientContact ON Patient.patientKey = mapPatientContact.patientKey
LEFT JOIN Contact ON mapPatientContact.contactKey = Contact.contactKey
LEFT JOIN mapContactAddress ON Contact.contactKey = mapContactAddress.contactKey
LEFT JOIN Address ON mapContactAddress.addressKey = Address.addressKey
LEFT JOIN mapContactPhoneNumber ON Contact.contactKey = mapContactPhoneNumber.contactKey
LEFT JOIN PhoneNumber ON mapContactPhoneNumber.phoneNumberKey = PhoneNumber.phoneNumberKey
LEFT JOIN mapContactEmailAddress ON Contact.contactKey = mapContactEmailAddress.contactKey
LEFT JOIN EmailAddress ON mapContactEmailAddress.emailAddressKey = EmailAddress.emailAddressKey
LEFT JOIN FillerOrder ON Patient.patientKey = FillerOrder.patientKey
LEFT JOIN RequestedProcedure ON FillerOrder.fillerOrderKey = RequestedProcedure.fillerOrderKey
LEFT JOIN mapResultRequestedProcedure ON RequestedProcedure.requestedProcedureKey = mapResultRequestedProcedure.requestedProcedureKey
LEFT JOIN ResultSection ON mapResultRequestedProcedure.resultKey = ResultSection.resultKey

WHERE ResultSection.sectionValue <> ' '

SELECT OLFDataVarcharValues.result_value
FROM OLFDataVarcharValues

END
