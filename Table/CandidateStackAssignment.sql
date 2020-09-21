create table CandidateStackAssignment
(
Id int identity(1,1) primary key,
Requirement_Id int foreign key references CompanyRequirements(Id),
Candidate_Id int foreign key references FellowshipCandidate(Id),
Assign_Date datetime,
Complete_Date datetime,
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20)
)