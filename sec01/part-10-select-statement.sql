select * from tblPerson 

-------------------------------------

USE [Sample]
GO

SELECT [ID]
      ,[Name]
      ,[Email]
      ,[GenderID]
      ,[Age]
  FROM [dbo].[tblPerson]
GO

-----------------------------------

SELECT DISTINCT City from tblPerson
SELECT DISTINCT Name, City from tblPerson --specifying across columns put together

-----------------------------------

SELECT * FROM tblPerson WHERE City = 'London'

--not equal
SELECT * FROM tblPerson WHERE city <> 'London' -- != also works

--------------------------------------------------

SELECT * FROM tblPerson WHERE age = 20 or age = 23 or age = 29

SELECT * FROM tblPerson WHERE age in (20, 23, 29)

SELECT * FROM tblPerson WHERE age BETWEEN 20 AND 25 --boundaries inclusive

SELECT * FROM tblPerson WHERE city LIKE 'L%' --starts with L

SELECT * FROM tblPerson WHERE email LIKE '%@%' --includes it somewhere

SELECT * FROM tblPerson WHERE email NOT LIKE '%@%' --does not include
 
--A@A.COM
--B@B.COM
SELECT * FROM tblPerson WHERE email LIKE '_@_.com' 

-----------------------------------------------------------------

--WHEN USING TEXT/CHARS, MUST BE '' SINGLE QUOTES!!!!

--starts with m s t 
SELECT * FROM tblPerson WHERE name LIKE '[MST]%'

--opposite
SELECT * FROM tblPerson WHERE name LIKE '[^MST]%'
 
--------------------------------------------------------

SELECT * FROM tblPerson 
WHERE (City = 'London' OR  City = 'Mumbai') 
AND Age > 25

--------------------------------------------------------

SELECT * FROM tblPerson 
ORDER BY name

SELECT * FROM tblPerson 
ORDER BY name DESC

SELECT * FROM tblPerson 
ORDER BY name DESC, age ASC

--------------------------------------------------------

SELECT TOP 2 * FROM tblPerson 

SELECT TOP 2 name, age FROM tblPerson 

SELECT TOP 50 PERCENT * FROM tblPerson

SELECT TOP 1 * FROM tblPerson ORDER BY age DESC
--eldest person
