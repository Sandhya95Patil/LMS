create table MakerProgram
(
Id int identity(1,1) primary key,
Program_Name varchar(30),
Program_Type varchar(30),
Program_Link varchar(30),
Tech_Stack_Id int foreign key references TechStack(Id),
Tech_Type_Id int foreign key references TechType(Id),
Is_Program_Approved bit,
Description varchar(30),
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20)
)