create table CandidateQualification 
(
Id int identity (1, 1) primary key,
Candidate_Id int foreign key references FellowshipCandidate(Id),
Diploma varchar(40),
Degree_Name_Verified bit,
Employee_Deciplin varchar(40),
Is_Emp_Deciplin_Verified bit,
Passing_Year int,
Is_Passing_Year_Verified bit,
Aggregate_Percentage int,
Is_Aggr_Per_Verified bit,
Final_Year_Per int,
Is_Final_Year_Verified bit,
Training_Institute varchar(50),
Is_Training_Institute_Verified bit,
Training_Duration_Month int,
Is_Training_Duration_Month_Verified bit,
Other_Training varchar(30),
Is_Other_Training_Verified bit,
Creator_Stamp varchar(30),
Creator_User varchar(30)
)