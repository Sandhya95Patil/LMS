create table CandidateBankDetails 
(
Id int Identity(1,1) primary key,
Candidate_Id int foreign key references FellowshipCandidate(Id),
Name varchar(30),
Account_No varchar(50),
Is_Account_No_Verified bit,
IFSC_Code varchar(30),
Is_IFSC_Code_Verified bit,
Pan_No varchar(30),
Is_Pan_No_Verified bit,
Adhar_No varchar(50),
Is_Adhar_No_Verified bit,
Cretor_Stamp varchar(30),
Cretor_User varchar(30),
);