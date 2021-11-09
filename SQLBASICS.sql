
--Table 1 Query:
--Create Table EmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Table 2 Query:
--Create Table EmployeeSalary 
--(EmployeeID int, 
--JobTitle varchar(50), 
--Salary int
--)

-- Table 1 Insert:
--Insert into EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--Table 2 Insert:
--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

-- selecting columns from tables
SELECT FirstName, LastName
FROM EmployeeDemographics

--SELECTING TOP 5
SELECT TOP 5 *
FROM EmployeeDemographics

--UNIQUE VALUES FROM SPECIFIC COLUMNS
SELECT DISTINCT(Gender)
FROM EmployeeDemographics

--COUNT SHOWS ALL THE NON VALUES IN A COLUMN
SELECT COUNT(LastName)
FROM EmployeeDemographics

-- AS USED FOR ALLIAS
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

--AGGREGATION OR MATH MAX, MIN, AVG()
SELECT MAX(Salary)
FROM EmployeeSalary

--USING SLQ AT THE MASTER LEVEL

SELECT *
FROM SQLBASICS.dbo.EmployeeSalary

-- where statement limits the amount of data we want
-- =, <>, AND, OR; LIKE; NULL; NOT NULL, IN

SELECT *
FROM EmployeeDemographics
WHERE FirstName='Jim' 

--excludes Jim with <>
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim' 

-- bigger equal less than operators
SELECT *
FROM EmployeeDemographics
WHERE Age >29  AND Gender='Male'

--like
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%' --starts with S

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%' --s will be anywhere in the lastname

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%'

SELECT *
FROM EmployeeDemographics
WHERE LastName is NOT NULL

-- IN MEANS EQUAL FOR MULTIPLE THINGS

SELECT *
FROM EmployeeDemographics
WHERE LastName IN('Martin','Scott')

-- GROUP BY ORDER BY
-- GROUP BY GENDER for example all the males rolled up into male row..

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender

SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age >31
GROUP BY Gender, Age


-- ORDER BY DEFAULT IS ASC NOT DESC
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age >31
GROUP BY Gender
ORDER BY CountGender DESC

--ORDER BY BOTH COLUMNS CAN BE USED WITH DESC OR ASC
SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC

--ORDER BY INSTEAD OF COLUMN NAMES; COLUMN NUMBERS CAN BE USED STARTING FROM 1

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC

-- JOINS INNER; FULL/LEFT/RIGHT/OUTER
-- WHEN YOU ARE AT THE MASTER LEVEL

SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics

SELECT *
FROM SQLBASICS.dbo.EmployeeSalary

--inner join or join MEANS A ∩ B

SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics
INNER JOIN SQLBASICS.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

-- previous example with allias
SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics ed
INNER JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID

-- to show join effectively add new values

--Insert into EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly','Flax', NULL, 'Male'),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Insert into EmployeeSalary VALUES
--(1010, NULL, 47000),
--(NULL, 'Salesman', 43000)

-- FULL OUTER JOIN

SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics ed
FULL OUTER JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID

--LEFT OUTER JOIN 
-- EVERYTHING FROM THE LEFT TABLE AND OVERLAPPING FROM THE RIGHT TABLE
-- IF IT IS ONLY IN THE RIGHT TABLE WE DO NOT WANT IT


SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics ed
LEFT OUTER JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID


--OPPOSITE OF LEFT OUTER JOIN
SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics ed
RIGHT OUTER JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID

--EXAMPLE
SELECT ed.EmployeeID, ed.FirstName, ed.LastName, es.Salary
FROM SQLBASICS.dbo.EmployeeDemographics ed
JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID

SELECT ed.EmployeeID, ed.FirstName, ed.LastName, es.Salary
FROM SQLBASICS.dbo.EmployeeDemographics ed
lEFT OUTER JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID

SELECT ed.EmployeeID, ed.FirstName, ed.LastName, es.Salary
FROM SQLBASICS.dbo.EmployeeDemographics ed
RIGHT OUTER JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID

SELECT ed.EmployeeID, FirstName, LastName, Salary
FROM SQLBASICS.dbo.EmployeeDemographics ed
JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

SELECT JobTitle, AVG(Salary)
FROM SQLBASICS.dbo.EmployeeDemographics ed
JOIN SQLBASICS.dbo.EmployeeSalary es
	ON ed.EmployeeID=es.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle

-- BEFORE UNION CREATING NEW TABLE
--Table 3 Query:
--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Table 3 Insert:
----Insert into WareHouseEmployeeDemographics VALUES
----(1013, 'Darryl', 'Philbin', NULL, 'Male'),
----(1050, 'Roy', 'Anderson', 31, 'Male'),
----(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
----(1052, 'Val', 'Johnson', 31, 'Female')

SELECT *
FROM WareHouseEmployeeDemographics
-- UNION ANION ALL
--JOIN COMBINES TABLES BASED ON A COMMON COLUMNS

SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics ED 
FULL OUTER JOIN SQLBASICS.dbo.WareHouseEmployeeDemographics WD
	ON ED.EmployeeID = WD.EmployeeID

-- they have both same columns so it will be easy to from the second table
--to add down below table 1 not as a seperate column
--removes the duplicates like 1013	Darryl	Philbin	NULL	Male


SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics 
UNION
SELECT *
FROM SQLBASICS.dbo.WareHouseEmployeeDemographics 

-- UNION ALL SHOWS DUPLICATES TOO
-- as in the case of 1013	Darryl	Philbin	NULL	Male

SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics 
UNION ALL
SELECT *
FROM SQLBASICS.dbo.WareHouseEmployeeDemographics 
ORDER BY EmployeeID

--CASE STATEMENT
--specifying condition and also allows us to specify 
-- what you want to return when that condition is met
-- as many when and then statements as we want
-- AFTER AGE DO NOT FORGET COMMA

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END --this creates a new column showing young or old
FROM SQLBASICS.dbo.EmployeeDemographics 
WHERE Age IS NOT NULL
ORDER BY AGE

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle='Salesman' THEN CAST (Salary + (Salary * .10) AS FLOAT) 
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03) 
END  AS NewSalary
FROM SQLBASICS.dbo.EmployeeDemographics ED
JOIN SQLBASICS.dbo.EmployeeSalary ES
	ON ED.EmployeeID = ES.EmployeeID

--CASE STATEMENT CAN BE USEFUL TO CATEGORIZE THING OR LABEL THINGS:

-- HAVING CLAUSE
-- we cannot use aggregate in where clause
-- so we use having clause
SELECT JobTitle, COUNT(JobTitle) as JobTitleCount
FROM SQLBASICS.dbo.EmployeeDemographics ED
JOIN SQLBASICS.dbo.EmployeeSalary ES
	ON ED.EmployeeID = ES.EmployeeID
GROUP BY JobTitle
ORDER BY 2 DESC


-- An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list,
-- and the column being aggregated is an outer reference.
-- Having clause should be used after GROUP BY STATEMENT; DEPENDENT ON GROUP BY
-- WE CANNOT LOOK AT THE AGGREGATED INFORMATION
-- BEFORE IT IS ACTUALLY AGGREGATED IN THAT GROUP BY STATEMENT

SELECT JobTitle, COUNT(JobTitle) as JobTitleCount
FROM SQLBASICS.dbo.EmployeeDemographics ED
JOIN SQLBASICS.dbo.EmployeeSalary ES
	ON ED.EmployeeID = ES.EmployeeID
--WHERE COUNT(JobTitle) >1
GROUP BY JobTitle
HAVING COUNT(JobTitle) >1
ORDER BY 2 DESC

SELECT JobTitle, AVG(Salary) as AverageSalary
FROM SQLBASICS.dbo.EmployeeDemographics ED
JOIN SQLBASICS.dbo.EmployeeSalary ES
	ON ED.EmployeeID = ES.EmployeeID
--WHERE COUNT(JobTitle) >1
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY 2 DESC

--UPDATING AND DELETING DATA

SELECT *
FROM SQLBASICS.dbo.EmployeeDemographics

UPDATE SQLBASICS.dbo.EmployeeDemographics
SET EmployeeID=1012
WHERE FirstName='Holly' AND LastName = 'Flax'

UPDATE SQLBASICS.dbo.EmployeeDemographics
SET Age =31, Gender= 'Female'
WHERE FirstName='Holly' AND LastName = 'Flax'

--you cannot reverse it
DELETE FROM SQLBASICS.dbo.EmployeeDemographics
WHERE EmployeeID =1005

-- ALIASING

SELECT FirstName + ' ' + LastName as FullName
FROM [SQLBASICS].[dbo].[EmployeeDemographics]

SELECT ED.EmployeeID, ES.Salary
FROM SQLBASICS.dbo.EmployeeDemographics AS ED
JOIN SQLBASICS.dbo.EmployeeSalary AS ES
	ON ED.EmployeeID= ES.EmployeeID

--Partition By
--DIVIDES THE RESULT SET INTO PARTITIONS AND CHANGES HOW 
-- WINDOW FUNCTION IS CALCULATED AND DOES NOT REDUCE THE ROWS RETURNING IN OUTPUT
-- WHEN YOU WISH TO ROLL THE FIGURES UP

SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (Partition by Gender) as TotalGender
FROM SQLBASICS.dbo.EmployeeDemographics ED
JOIN SQLBASICS.dbo.EmployeeSalary ES
	ON ED.EmployeeID= ES.EmployeeID