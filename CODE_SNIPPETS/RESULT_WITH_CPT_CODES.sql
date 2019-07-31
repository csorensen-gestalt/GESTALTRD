INSERT INTO CPTCODEKEY (RESULTKEY)

SELECT DISTINCT ResultSection.resultKey
FROM ResultSection


WHERE 
(
sectionValue LIKE '%88302%'
OR sectionValue LIKE '%88304%'
OR sectionValue LIKE '%88305%'
OR sectionValue LIKE '%88307%'
OR sectionValue LIKE '%88309%'
)
AND
(
sectionCategory LIKE '%COMMENT%'
OR sectionCategory LIKE '%PATHOLOG%'
OR sectionCategory LIKE '%SPECIMEN%'
OR sectionCategory LIKE '%DESC%'
)