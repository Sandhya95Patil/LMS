create table CandidateDocuments
(
Id int Identity(1,1) primary key,
Candidate_Id int foreign key references FellowshipCandidate(Id),
Doc_Type varchar(20),
Doc_Path varchar(20),
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20)
)