create table MentorIdeationMap 
(
Id int identity(1,1) primary key,
Parent_Mentor_Id int foreign key references Mentor(Id),
Mentor_Id int foreign key references Mentor(Id),
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20)
)