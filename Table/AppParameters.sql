create table AppParameters
(
Id int identity(1,1) primary key,
Key_Type varchar(20),
Key_Value varchar(20),
Key_Text varchar(20),
Cur_Status varchar(20),
Lastupd_User varchar(20),
Lastupd_Stamp varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20),
Sequence_No int
)