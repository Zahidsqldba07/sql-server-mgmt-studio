create table Test1
(
ID int identity(1,1),
Value nvarchar(20)
)

create table Test2
(
ID int identity(1,1),
Value nvarchar(20)
)

Insert into Test1 Values('X')

--delete from test1
--drop table test1

select * from Test1

--we want last generated identity column retrieved

select SCOPE_IDENTITY()
SELECT @@IDENTITY 
------------------------------------
--DIFFERENCE BETWEEN THE ABOVE 2 SELECT statements:

--create a trigger on a table for specific action
--ex when someone inserts a row in a table1, we 
--want a row to be auto inserted in table2

--trForInsert is trigger name
Create Trigger trForInsert on  Test1 for Insert
as
Begin
	--trigger def goes here
	Insert into Test2 Values ('YYYY')
End

select * from Test1
select * from Test2

select SCOPE_IDENTITY()
SELECT @@IDENTITY 

--USER 1 SESSION

Insert into Test1 Values('X') --trigger will also insert in test2 table
--2 rows affected 
--(1 row(s) affected)
--(1 row(s) affected)


--similarity: both return last generated value
select SCOPE_IDENTITY() --3
SELECT @@IDENTITY --1

--SCOPE_IDENTITY() - same session and the same scope
--scope identity returns last gen value in the same session (connection)
--so one query editor window open so just one session to sql server
--within same session and same scope

--@@IDENTITY-same session and across any scope
--IDENT_CURRENT('tablename') - specific table across any session and any scope

------------------------------------------------
--USER 1 SESSION in this current query editor
insert into test2 values ('zzz')

--USER 2 SESSION in a different query editor (pretend i ran this in a different editor)
insert into test2 values ('zzz')

----compare the 2: 
select SCOPE_IDENTITY() --2 both return 2 bc they operate only in the current session
select @@IDENTITY --2 
select IDENT_CURRENT('Test2') --3
--but ident_current operates across any session but for that test2 table


