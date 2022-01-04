select * from tblEmployee

select SUM(salary) from tblEmployee
select MIN(salary) from tblEmployee
select MAX(salary) from tblEmployee

------------------------------------

SELECT City, SUM(salary) AS TotalSalary
FROM tblEmployee GROUP BY City
---------------------------------------------------------------
--Msg 8120, Level 16, State 1, Line 12
--Column 'tblEmployee.City' is invalid in the select list 
--because it is not contained in either an 
--aggregate function or the GROUP BY clause.
SELECT City, SUM(salary) AS TotalSalary
FROM tblEmployee --this errors out

SELECT  SUM(salary) AS TotalSalary FROM tblEmployee 

---------------------------------------------------
SELECT City, Gender, SUM(salary) AS TotalSalary
FROM tblEmployee 
GROUP BY City 
--this errors out
--Column 'tblEmployee.City' is invalid in the select list 
--because it is not contained in either an 
--aggregate function or the GROUP BY clause.

SELECT City, Gender, SUM(salary) AS TotalSalary
FROM tblEmployee 
GROUP BY City, Gender
ORDER BY City

----------------------------------------------

SELECT Gender, City,SUM(salary) AS TotalSalary
FROM tblEmployee 
GROUP BY Gender , City

---------------------------------------------

Select COUNT(ID) from tblEmployee


--need to use square brackets if you use spaces for 
--your column name like total employees
SELECT Gender, City, SUM(salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
FROM tblEmployee 
GROUP BY Gender, City

--------------------------------------------------

SELECT Gender, City, SUM(salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
FROM tblEmployee 
WHERE Gender = 'Male'
Group by Gender, City


SELECT Gender, City, SUM(salary) AS TotalSalary, COUNT(ID) AS [Total Employees]
FROM tblEmployee 
Group by Gender, City
HAVING Gender = 'Male' --having has to come after group by clause

---------------------------------------------------------
--AGGREGATE FUNCTIONS CANNOT BE USED IN THE WHERE CLAUSE!!!!

SELECT * FROM tblEmployee WHERE SUM(Salary) > 4000
--An aggregate may not appear in the WHERE 
--clause unless it is in a subquery 
--contained in a HAVING clause or a 
--select list, and the column being aggregated is an outer reference.

SELECT Gender, City, SUM(salary) AS TotalSalary, COUNT(ID) AS TotalEmployees
FROM tblEmployee 
Group by Gender, City
HAVING SUM(Salary) > 5000 --this works
