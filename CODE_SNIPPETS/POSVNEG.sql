SELECT TOP (25000) 
'POS' AS RESULT, sectionCategory,ResultSection.sectionValue 
FROM ResultSection
WHERE 
(
sectionValue LIKE '%HER2 oncogene protein overexpression: P%'
OR sectionValue LIKE '%Estrogen receptor expression: P%'
OR sectionValue LIKE'%Progesterone receptor expression: P%'
OR sectionValue LIKE '%E-cadherin:  Positive%'
OR sectionValue LIKE '%: POSIT%'
OR sectionValue LIKE '%:  POSIT%'
OR sectionValue LIKE '%:   POSIT%'
)
AND sectionCategory LIKE '%DIAGNO%'

-- Right breast, 12 o'clock, biopsies:  -  Infiltrating ductal carcinoma with the following features:   -  Site:  Right breast 12 o'clock, 2.5 cm from nipple.   -  Size:  73.7 x 29.0 mm mass (radiologic).   -  Histologic grade:  2 of 3.   -  Nottingham score:    -  Tubule formation: 3   -  Nuclear pleomorphism:  2   -  Mitotic activity:  1  -  E-cadherin:  Positive, supports a ductal phenotype.  -  Extent of involvement:  Neoplasm involves all cores with the greatest linear extent of invasive carcinoma being 1.7 cm.   -  In situ carcinoma:  Present with solid growth pattern, intermediate nuclear grade, and no comedonecrosis.                  -  Lobular cancerization is present.   -  Additional findings:  Angiolymphatic invasion:  Probable.                              -  Microcalcification, necrosis not present.   -  Estrogen receptor:  Positive.   -  Percentage of tumor cells with nuclear positivity: Greater than 75%.   -  Average staining intensity:  Strong.   -  Progesterone receptor:  Positive.   -  Percentage of tumor cells with nuclear positivity: About 10%.   -  Average staining intensity:  Moderate..   -  Ki-67:  About 20%.  -  HER2 is pending and will be reported as an addendum. 