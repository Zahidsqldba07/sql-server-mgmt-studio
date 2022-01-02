use [Sample]
go

create table tblGender
(
ID int NOT NULL Primary Key,
Gender nvarchar(50) NOT NULL
)

-----------------------------------------
--FOREIGN KEY CONSTRAINTS
alter table tblPerson add constraint tblPerson_GenderID_FK
Foreign Key (GenderId) references tblGender (ID)

