--DIFFERENCE BETWEEN PRIMARY KEY CONSTRAINT
--AND UNIQUE KEY CONSTRAINT?
--1. A table can have only one primary key, but more than one unique key
--2. Primary key does not allow nulls, where as unique key allows one null

Alter table tblPerson
Add Constraint UQ_tblPerson_Email Unique(Email)

Insert into tblPerson Values(8,'ABC', 'a@a.com', 1, 20)
--get an error violation of unique key constraint

---------------------------------------------------

Alter table tblPerson
drop constraint UQ_tblPerson_Email

Insert into tblPerson Values(8,'ABC', 'a@a.com', 1, 20)
--now it works