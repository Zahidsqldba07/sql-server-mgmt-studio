select * from tblGender
select * from tblPerson

ALTER TABLE tblPerson 
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GENDERID

Delete from tblGender where id=2
--The DELETE statement conflicted with the REFERENCE 
--constraint "tblPerson_GenderID_FK". 
--The conflict occurred in database "Sample", 
--table "dbo.tblPerson", column 'GenderID'.

--its currently set to no action

--4 options : no action, cascade, setnull, setdefault

--set to default so any person with genderid = 2 will now be set to 3 
Delete from tblGender where id=2

--set NULL example: so now the person genderid will be set to NULL
Delete from tblGender where id=1

--cascade EXAMPLE: so all dependent rows will be deleted from tblPerson
Delete from tblGender where id=3
