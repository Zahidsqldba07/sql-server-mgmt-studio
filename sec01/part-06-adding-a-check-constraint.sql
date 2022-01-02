select * from tblGender
select * from tblPerson --press alt-f1 to see more info

---------------------------------------
--this wont work if a constraint is added (CK_tblPerson_Age: age > 0 and age < 150)
Insert into tblPerson values 
(
4, 'Sara', 's@s.com', 2, -970
)

--The INSERT statement conflicted with 
--the CHECK constraint "CK_tblPerson_Age". 
--The conflict occurred in database "Sample", 
--table "dbo.tblPerson", column 'Age'.

--this works
Insert into tblPerson values 
(
4, 'Sara', 's@s.com', 2, 10
)

Delete from tblPerson where ID = 4

---------------------------------------
--remember age is a nullable column
Insert into tblPerson values 
(
5, 'Sara', 's@s.com', 2, NULL --this would still work because the bool expression returns unknown
)

--------------------------------------
--REMOVE A CONSTRAINT
alter table tblPerson
drop constraint CK_tblPerson_Age

--------------------------------------
--ADD A CONSTRAINT
Alter table tblPerson
Add constraint CK_tblPerson_Age 
CHECK (age < 0 AND age > 150)



