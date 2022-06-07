-- Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable

DECLARE @Firstname nvarchar (100)
SET @Firstname = 'Antonio'

SELECT *
FROM dbo.Student
WHERE Firstname = @Firstname

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students

DECLARE @FemaleStudents TABLE 
(StudentID int,
StudentName nvarchar (200),
DateOfBirth date)

INSERT INTO @FemaleStudents (StudentID,StudentName,DateOfBirth) 
SELECT id,FirstName,DateOfBirth from dbo.Student 
WHERE Gender = 'F'

SELECT * FROM @FemaleStudents

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters

CREATE TABLE #MaleStudents (LastName nvarchar (100),EnrolledDate date)

INSERT INTO #MaleStudents(LastName,EnrolledDate)
SELECT LastName,EnrolledDate from dbo.Student
WHERE Gender  = 'M' AND FirstName like 'A%'

SELECT * FROM #MaleStudents

SELECT * FROM #MaleStudents
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and he first 3 characters of their FirstName and LastName are the same

SELECT *
FROM dbo.Teacher
WHERE  LEN(FirstName) < 5 AND LEFT(FirstName,3) = LEFT(LastName,3)