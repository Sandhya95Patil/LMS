create table MentorTechStack 
(
Id int identity(1,1) primary key,
Mentor_Id int foreign key references Mentor(Id),
Tech_Stack_Id int foreign key references TechStack(Id),
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20),
DateTime datetime
)