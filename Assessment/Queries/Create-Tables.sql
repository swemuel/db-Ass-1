use [WaitList];
GO

--Create Patient table
CREATE TABLE Patient(
patientID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
NHI char(7) NOT NULL,
firstName varchar(25) NOT NULL,
lastName varchar(35) NOT NULL,
DOB date,
gender varchar(10) NOT NULL,
healthTargetEligible varchar(3) NOT NULL
);
GO

--test patient table
SELECT * FROM [dbo].[Patient]



--Create Surgeon table
CREATE TABLE Surgeon(
surgeonID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
firstName varchar(25) NOT NULL,
lastName varchar(35) NOT NULL,
departmentName varchar(25) NOT NULL
);
GO

--test surgeon table
SELECT * FROM [dbo].[Surgeon]



--Create Referrer table
CREATE TABLE Referrer(
referrerID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
referredFrom varchar(10) NOT NULL,
firstName varchar(25) NOT NULL,
lastName varchar(35) NOT NULL,
);
GO

--test Referrer table
SELECT * FROM [dbo].[Referrer]



--Create Referral table
CREATE TABLE Referral(
referralNumber int IDENTITY(1,1) PRIMARY KEY NOT NULL,
referralDate date,
referrerID int FOREIGN KEY REFERENCES Referrer(referrerID),
addedToWaitlistDate date,
FSADate date,
patientID int FOREIGN KEY REFERENCES Patient(patientID),
surgeonID int FOREIGN KEY REFERENCES Surgeon(surgeonID)
);
GO

--test Referral table
SELECT * FROM [dbo].[Referral]



--Drop tables
drop table [dbo].[Patient];
GO