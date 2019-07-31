create table bckup5
(
patient_key uniqueidentifier,
cpt88302 varchar(10),
cpt88304 varchar(10),
cpt88305 varchar(10),
cpt88307 varchar(10),
cpt88309 varchar(10),
)

create table bckup10
(
patient_key uniqueidentifier,
cpt88304 varchar(10),
cpt88305 varchar(10),
cpt88307 varchar(10),
cpt88309 varchar(10),
cpt88331 varchar(10),
cpt88341 varchar(10),
cpt88342 varchar(10),
cpt88112 varchar(10),
cpt88141 varchar(10),
cpt88175 varchar(10),
)

insert into bckup5
select * 
from MClinical.dbo.CODEKEY


insert into bckup10
select *
from MClinical.dbo.CPTCODEKEY