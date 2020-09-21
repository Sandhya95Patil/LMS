create table HiredCandidate 
(
Id int Identity(1,1) primary key,
FirstName varchar(30),
MiddleName varchar(30),
LastName varchar(30),
Email varchar(50),
Hired_City varchar(30),
Hired_Date datetime,
Degree varchar(30),
Mobile_No varchar(50),
Permanent_Pincode int,
Hired_Lab varchar(30),
Attitude varchar(30),
Communication_Remark varchar(30),
Knowledge_Remark varchar(40),
Aggregate_Remark varchar(40),
Status varchar(40),
Creator_Stamp varchar(30),
Creator_User varchar(30)
);