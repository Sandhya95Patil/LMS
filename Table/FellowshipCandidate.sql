create table FellowshipCandidate 
(
Id int identity(1,1) primary key,
FirstName varchar(30),
MiddleName varchar(30),
LastName varchar(30),
Email varchar(50),
Hired_City varchar(30),
Hired_Date datetime,
Hired_Lab varchar(30),
Degree varchar(30),
Mobile_No varchar(50),
Permanent_Pincode int,
Attitude varchar(30),
Communication_Remark varchar(30),
Knowledge_Remark varchar(40),
Aggregate_Remark varchar(40),
Creator_Stamp varchar(30),
Creator_User varchar(30),
Birth_Date datetime,
Is_Birth_Date_Verified bit,
Parent_Name varchar(30),
Parent_Occupation varchar(30),
Parent_Mobile_No varchar(50),
Parent_Annual_Salary bigint,
Local_Address varchar(50),
Permanent_Address varchar(50),
Photo_Path varchar(50),
Joining_Date datetime,
Candidate_Status varchar(50),
Personal_Info varchar(50),
Bank_Info varchar(50),
Educational_Info varchar(50),
Document_Status bit,
Remark varchar(50)
);