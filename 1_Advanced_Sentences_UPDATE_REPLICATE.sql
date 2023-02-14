USE AdventureWorks2019
Go
/*
AUTHOR: ALBERTO CRUZ
DATE: 10 - 02 -23
DESC: Scripts related to the course
      "SQL SERVER ADVANCED PROGRAMMING"

*/

--INSERT SELECT 
-----------------------------------------
CREATE TABLE personEjemplo(
	firstName VARCHAR(50),
	lastName  VARCHAR(50)
)

INSERT INTO personEjemplo
SELECT FirstName,LastName
FROM person.Person;

--UPDATE INNER JOIN
-----------------------------------------
SELECT m1.Suffix,m2.NationalIDNumber
FROM Person.Person m1
INNER JOIN HumanResources.Employee m2
ON(m1.BusinessEntityID=m2.BusinessEntityID)
WHERE m2.JobTitle='Sales Representative'

UPDATE m1
SET m1.Suffix=m2.NationalIDNumber
FROM Person.Person m1
INNER JOIN HumanResources.Employee m2
ON(m1.BusinessEntityID=m2.BusinessEntityID)
WHERE m2.JobTitle='Sales Representative';

--DELETE INNER JOIN
-----------------------------------------

SELECT *
FROM Person.EmailAddress m1
INNER JOIN person.BusinessEntity m2
ON(m1.BusinessEntityID=m2.BusinessEntityID)
INNER JOIN HumanResources.Employee m3
ON(m2.BusinessEntityID=m3.BusinessEntityID)
WHERE m3.JobTitle='Tool Designer';

DELETE m1
FROM Person.EmailAddress m1
INNER JOIN person.BusinessEntity m2
ON(m1.BusinessEntityID=m2.BusinessEntityID)
INNER JOIN HumanResources.Employee m3
ON(m2.BusinessEntityID=m3.BusinessEntityID)
WHERE m3.JobTitle='Tool Designer';



--SELECT INTO
-----------------------------------------
SELECT * INTO EmailAddress_BK
FROM Person.EmailAddress
WHERE 1=0;

--BK Generated with 0 rows
SELECT * 
FROM EmailAddress_BK

--SELECT INTO (for copy structure and data from a table)
--Primary key and index are not copied
-----------------------------------------

SELECT * 
INTO Person.Person_BK
FROM Person.Person;


SELECT * 
FROM Person.Person_BK;

--SELECT INTO
--From different BD
-----------------------------------------
SELECT * 
INTO AdventureWorks_BK..PersonAddr_BK
FROM Person.Address;

SELECT *
FROM AdventureWorks_BK..PersonAddr_BK;

--SELECT INTO
--For copying a table with an identity field
-----------------------------------------

SELECT IDENTITY(INT,1,1) as id, * 
INTO AdventureWorks_BK..PersonPhoneNew
FROM Person.PersonPhone;


SELECT * 
FROM AdventureWorks_BK..PersonPhoneNew;


--CLONEDATABASE
--Making an exact copy from the original database
-----------------------------------------

DBCC CLONEDATABASE(AdventureWorks_BK,AdventureWorks_CLONED);

