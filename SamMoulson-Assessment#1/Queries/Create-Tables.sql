use [WaitList];
GO

--Create Patient table
CREATE TABLE Patient(
patientID int PRIMARY KEY NOT NULL,
NHI char(7) NOT NULL,
firstName varchar(25) NOT NULL,
lastName varchar(35) NOT NULL,
DOB date,
gender varchar(10) NOT NULL,
healthTargetEligible varchar(3) NOT NULL
);
GO

--insert patient data
Bulk insert [dbo].[Patient]
from 'D:\User\Ara\sem 2\databases\db-Ass-1\Assessment\csv-files\pat.csv'
 WITH   
      (  
         FIELDTERMINATOR =',',  
         ROWTERMINATOR ='\n',
		FIRSTROW = 1   
      );  

--test patient table
SELECT * FROM [dbo].[Patient]



--Create Surgeon table
CREATE TABLE Surgeon(
surgeonID int PRIMARY KEY NOT NULL,
firstName varchar(25) NOT NULL,
lastName varchar(35) NOT NULL,
departmentName varchar(25) NOT NULL
);
GO

--insert surgeon data
Bulk insert [dbo].[Surgeon]
from 'D:\User\Ara\sem 2\databases\db-Ass-1\Assessment\csv-files\surgeon.csv'
 WITH   
      (  
         FIELDTERMINATOR =',',  
         ROWTERMINATOR ='\n',
		FIRSTROW = 2   
      );  

--test surgeon table
SELECT * FROM [dbo].[Surgeon]



--Create Referrer table
CREATE TABLE Referrer(
referrerID int PRIMARY KEY NOT NULL,
referredFrom varchar(10) NOT NULL,
firstName varchar(25) NOT NULL,
lastName varchar(35) NOT NULL,
);
GO

--insert patient data
Bulk insert [dbo].[Patient]
from 'D:\User\Ara\sem 2\databases\db-Ass-1\Assessment\csv-files\referrer.csv'
 WITH   
      (  
         FIELDTERMINATOR =',',  
         ROWTERMINATOR ='\n',
		FIRSTROW = 2   
      );  

--test Referrer table
SELECT * FROM [dbo].[Referrer]



--Create Referral table
CREATE TABLE Referral(
referralNumber int PRIMARY KEY NOT NULL,
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
drop table [dbo].[Surgeon];
drop table [dbo].[Referrer];
drop table [dbo].[Referral];

GO