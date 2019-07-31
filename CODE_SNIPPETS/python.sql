-- USE THIS CODE TO ENABLE PYTHON SCRIPT IN SQL.
-- YOU NEED TO HAVE PYTHON SERVICES INSTALLED FROM MSSQLSERVER INSTALLATION PACKAGE. 
-- https://docs.microsoft.com/en-us/sql/advanced-analytics/install/sql-machine-learning-services-windows-install?view=sql-server-2017
-- AFTER THIS CODE EXECUTES YOU NEED TO RESTART THE SQL INSTANCE
-- MAKE SURE THAT SQL SERVER LAUNCHPAD IS UP AND RUNNING

/*

EXEC SP_CONFIGURE 'external scripts engabled', 1

RECONFIGURE WITH OVERRIDE

*/


exec sp_execute_external_script 
@language =N'Python',
@script=N'OutputDataSet = InputDataSet

##OutputDataSet["sectionValue"] = OutputDataSet["sectionValue"].str.lower()
', 
@input_data_1 = N' SELECT TOP(10000) ResultSection.sectionCategory, ResultSection.sectionValue FROM ResultSection --WHERE ResultSection.sectionCategory = "COMMENT"
'
WITH RESULT SETS(("CATEGORY" VARCHAR(50),"VALUE" NVARCHAR(MAX)))


--exec sp_execute_external_script 
--@language =N'Python',
--@script=N'
--print("HELLO WORLD")
--'
