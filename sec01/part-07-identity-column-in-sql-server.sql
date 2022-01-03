use Sample

go

select * from dbo.tblPerson

--without identity column set, we need to include the id
insert into dbo.tblPerson values (7, 'Todd', 't@t.com', 1,25)

---------------------------------------
--here we set an identity column

select * from tblPerson1

insert into dbo.tblPerson1 values ('John')

insert into dbo.tblPerson1 values ('Tom')

insert into dbo.tblPerson1 values ('Sara')

delete from tblPerson1 where PersonId = 1;

insert into dbo.tblPerson1 values ('Tom')

------------------------------------------- 

--now theres a gap (personId is now - 2,3,4)
--if we want, we can reuse the old value (1)
insert into dbo.tblPerson1 values (1, 'Jane')
--we get this warning
--An explicit value for the identity 
--column in table 'dbo.tblPerson1' 
--can only be specified when a 
--column list is used and IDENTITY_INSERT is ON.

--we turn on identity insert 
SET IDENTITY_INSERT tblPerson1 ON

--now it works but we also have to include column list
insert into dbo.tblPerson1 (PersonId, Name) values (1, 'Jane')

select * from tblPerson1

-------------------------------------------
insert into dbo.tblPerson1 values ('Martin')
--Explicit value must be specified for 
--identity column in table 'tblPerson1' 
--either when IDENTITY_INSERT is set to ON
--or when a replication user is inserting 
--into a NOT FOR REPLICATION identity column.

--SO IF YOU DONT WANT TO SUPPLY THE VALUE EXCPLICITLY FOR IDENTITY COLUMN,
--THEN YOU HAVE TO TURN OFF IDENTITY_INSERT

SET IDENTITY_INSERT tblPerson1 OFF

--so now i can add martin without passing personId
insert into dbo.tblPerson1 values ('Martin')

--------------------------------------------------
delete FROM dbo.tblPerson1

insert into dbo.tblPerson1 values ('Martin')
--wierd because personID is 6

--so we want to reset the identity value (back to 1 basically)

--DBCC database consistency check commands
--if you have deleted all rows in a table and want to reset identity column
--value, use DBCC CHECKIDENT command

DBCC CHECKIDENT('tblPerson1', RESEED, 0)
--Checking identity information: current identity value '0'.
--DBCC execution completed. If DBCC printed error messages, 
--contact your system administrator.

insert into dbo.tblPerson1 values ('Martin')
--SO NOW MARTIN'S ID IS 1