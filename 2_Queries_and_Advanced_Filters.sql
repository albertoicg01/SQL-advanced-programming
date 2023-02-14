USE AdventureWorks2019
Go
/*
AUTHOR: ALBERTO CRUZ
DATE: 10 - 02 -23
DESC: Scripts related to the course
      "SQL SERVER ADVANCED PROGRAMMING"
*/

/*
SQL QUERIES
*/

--LEFT JOIN AND ISNULL
-----------------------------------------
SELECT * 
FROM Person.Person m1
LEFT JOIN Person.EmailAddress m2
ON(m1.BusinessEntityID=m2.BusinessEntityID)
WHERE ISNULL(m2.BusinessEntityID,'')='';


--CASE
-----------------------------------------
DECLARE @ls_name VARCHAR(30)=NULL;
SET @ls_name='Roberto'

SELECT *
FROM Person.Person m1
WHERE m1.FirstName=(CASE WHEN ISNULL(@ls_name,'')<>'' THEN @ls_name 
						ELSE m1.FirstName 
					END);

SELECT *
FROM Person.Person m1
WHERE ISNULL(M1.FirstName,'')<>'';


--Querires btw different db's
-----------------------------------------

SELECT *
FROM Person.EmailAddress m1
INNER JOIN AdventureWorks_CLONED.dbo.PersonEmailAddr_BK m2
ON(m1.BusinessEntityID=m2.BusinessEntityID);


SET IDENTITY_INSERT Person.EmailAddress ON


INSERT INTO Person.EmailAddress(BusinessEntityID,EmailAddressID,EmailAddress,rowguid,ModifiedDate)
SELECT m2.*
FROM Person.EmailAddress m1
RIGHT JOIN AdventureWorks_CLONED.dbo.PersonEmailAddr_BK m2
ON(m1.BusinessEntityID=m2.BusinessEntityID)
WHERE ISNULL(m1.BusinessEntityID,0)=0 ;



SET IDENTITY_INSERT Person.EmailAddress OFF


--CROSS JOIN
--For obtaining all possible combinations
--Cartesian product
-----------------------------------------

SELECT *
FROM Sales.SpecialOffer
WHERE Category='Customer'

SELECT *
FROM Sales.SpecialOfferCustomer;

SELECT *
FROM Sales.SpecialOfferReseller;

SELECT C.*,R.*
FROM Sales.SpecialOfferCustomer C
CROSS JOIN Sales.SpecialOfferReseller R


--Delivering the info
SELECT C.[Description] 
	  ,R.[Description]
	  ,C.[DiscountPct]
	  ,R.[DiscountPct]
	  ,C.[DiscountPct]+R.[DiscountPct] as DiscountPctTOTAL
FROM Sales.SpecialOfferCustomer C
CROSS JOIN Sales.SpecialOfferReseller R







