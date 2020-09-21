create table Mentor
(
Id int identity(1,1) primary key,
Name varchar(30),
Mentor_Type varchar(20),
Lab_Id int foreign key references Lab(Id),
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20)
)