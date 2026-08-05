--FILENAME 02_01.sql

USE AdventureWorks2017; --if i was in master/any other database, this statement switches me to the AdventureWorks database
GO -- this ends my batch of queries, basically breaks my script into different parts.

/*This is just a simple SELECT statement that returns all the fields
in the specified Employee table that is found in Human Resources*/

SELECT * --tells server to return all columns
FROM HumanResources.Employee; -- specifies which table from which schema of the database
GO

/*This is a refined SELECT statement because i am explicity choosing what i would like to see.
which are the three columns mentioned in the SELECT clause*/

SELECT loginID, JobTitle, HireDate
FROM HumanResources.Employee;--demonstration of intellisense because it needs the table reference before it can suggest which columns are available
GO-- end of batch

/*demonstration of intellisense because it needs the table
reference before it can suggest which columns are available
we did not need a semicolon in this case because it is optional in most cases.
we just need to see the columns specified returned
*/

SELECT LoginID, JobTitle
FROM HumanResources.Employee 
--END OF 02_01 QUERY 1

--FILENAME 02_02.sql

/*this is a refined SELECT statement selecting specific attributes 
and we used the AS to give the table an alias
*/

SELECT hre.LoginID, hre.JobTitle, hre.HireDate
FROM HumanResources.Employee AS hre
GO

/*aliases can be shorter, just a single letter is enough,
similar to when i create an instance of a class in Java and want to reference
a field of said class, e.g
Mamello me = new Mamello();
me.method1();
me is my alias in this case(in terms of the fact that i use a shorter name instead of the whole
class name) but it is just a temporary nickname for the table in sql.
it exists only while the query runs, it makes the query shorter and easier to read especially
when using joins. in SQL we use aliases to shorten the lengthy 
table name names to save time/ improve readablity. once you type in the alias, SQL immediately knows
that you are referencing a table as its alias. here we also used an alias for columns for the same reason of
making it more user-friendly/readable, only changes the result set, not the schema*/

SELECT e.LoginID AS [login], e.JobTitle AS [Title],e.HireDate
AS [DateHired] -- the [] are optional, you can just write AS login with [login]
FROM HumanResources.Employee AS e;
GO

SELECT hre.LoginID AS [login], hre.JobTitle AS [Title], hre.HireDate
AS [Date Hired]
FROM HumanResources.Employee AS hre;

--END OF 02_02 Query 2

--FILENAME 02_03.sql